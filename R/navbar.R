#' Cria uma barra de navegação reutilizável para dashboards Shiny
#'
#' A função monta uma página com navegação superior usando bslib. O formato
#' recomendado para `menu_items` é uma lista nomeada de listas com `label` e
#' `ui`, podendo incluir `value`, `icon` e `items` para grupos de navegação.
#'
#' @param title Título exibido na marca da barra de navegação.
#' @param menu_items Lista nomeada de itens ou grupos de navegação.
#' @param theme Tema bslib usado pela página. Se `NULL`, usa o tema global
#'   configurado por `sdp_use_designer()` ou o tema padrão do bslib.
#' @details Itens de submenu podem incluir `description` para exibir uma
#'   linha auxiliar de contexto abaixo do rÃ³tulo. O campo Ã© opcional.
#'
#' @param selected Valor do painel selecionado inicialmente.
#' @param id Identificador da navegação para controle programático.
#' @param brand Conteúdo opcional exibido antes do título, como uma tag de
#'   imagem ou logotipo.
#' @param right_items Lista opcional de tags exibidas à direita do menu.
#' @param include_css Lógico que indica se a dependência visual do pacote deve
#'   ser anexada ao componente.
#' @param icons Formato legado: vetor de nomes de ícones usado com `pags`.
#' @param pags Formato legado: vetor de conteúdos usado com `menu_items` e
#'   `icons`.
#' @param designer Nome de um preset visual de `sdp_theme()`. Quando informado,
#'   substitui `theme`.
#' @param contact Lógico que indica se o botão estático “Sobre mim” deve ser
#'   exibido ao final da barra.
#' @param footer_left Conteúdo opcional alinhado à esquerda no rodapé do
#'   designer executivo.
#' @param footer_right Conteúdo opcional alinhado à direita no rodapé do
#'   designer executivo.
#' @param ... Argumentos adicionais enviados para [bslib::page_navbar()].
#'
#' @return Um objeto de interface do Shiny.
#' @export
#'
#' @examples
#' \dontrun{
#' menu_items <- list(
#'   visao_geral = list(
#'     label = "Visão geral",
#'     icon = "speedometer2",
#'     ui = shiny::h2("Visão geral")
#'   ),
#'   relatorios = list(
#'     label = "Relatórios",
#'     icon = "bar-chart",
#'     ui = shiny::h2("Relatórios")
#'   )
#' )
#'
#' ShinyDesginerPadrao::navbar(
#'   title = "Meu dashboard",
#'   menu_items = menu_items
#' )
#' }
navbar <- function(
    title,
    menu_items,
    theme = NULL,
    selected = NULL,
    id = NULL,
    brand = NULL,
    right_items = NULL,
    include_css = TRUE,
    icons = NULL,
    pags = NULL,
    designer = NULL,
    contact = TRUE,
    ...,
    footer_left = NULL,
    footer_right = NULL) {
  if (!is.null(designer)) {
    theme <- sdp_theme(designer)
  }

  if (is.null(theme)) {
    theme <- bslib::bs_global_get()
  }
  if (is.null(theme)) {
    theme <- bslib::bs_theme(version = 5)
  }

  if (!is.null(pags)) {
    menu_items <- legacy_menu_items(menu_items, icons, pags)
  } else if (!is.null(icons)) {
    stop("`icons` precisa ser usado junto com `pags`.", call. = FALSE)
  }

  normalized_menu <- normalize_menu_items(menu_items)
  nav_items <- unname(lapply(normalized_menu, build_nav_item))

  designer_name <- attr(theme, "sdp-designer")
  navbar_attribs <- list(class = "sdp-navbar")
  if (!is.null(designer_name)) {
    navbar_attribs[["data-sdp-designer"]] <- designer_name
  }

  title_content <- shiny::tags$span(
    class = "sdp-navbar__brand",
    if (!is.null(brand)) {
      shiny::tags$span(class = "sdp-navbar__brand-mark", brand)
    },
    shiny::tags$span(class = "sdp-navbar__title", title)
  )

  data_pattern <- NULL
  if (identical(designer_name, "executivo")) {
    data_pattern <- shiny::tags$svg(
      class = "sdp-navbar__data-pattern",
      `aria-hidden` = "true",
      viewBox = "0 0 960 88",
      preserveAspectRatio = "none",
      shiny::tags$path(
        class = "sdp-navbar__data-wave",
        d = "M0 44 C80 8 160 8 240 44 S400 80 480 44 S640 8 720 44 S880 80 960 44"
      ),
      shiny::tags$circle(class = "sdp-navbar__data-point", cx = "120", cy = "17"),
      shiny::tags$circle(class = "sdp-navbar__data-point", cx = "360", cy = "71"),
      shiny::tags$circle(class = "sdp-navbar__data-point", cx = "600", cy = "17"),
      shiny::tags$circle(class = "sdp-navbar__data-point", cx = "840", cy = "71")
    )
  }

  page_args <- list(
    title = title_content,
    id = id,
    selected = selected,
    theme = theme,
    navbar_options = list(attribs = navbar_attribs)
  )

  navbar_items <- nav_items
  contact_button <- NULL
  if (isTRUE(contact)) {
    contact_button <- shiny::actionButton(
      inputId = "abrir_contato",
      label = "Sobre mim",
      class = "sdp-navbar__contact"
    )
  }

  if (length(right_items) > 0 ||
      identical(designer_name, "executivo") ||
      (isTRUE(contact) && !identical(designer_name, "executivo"))) {
    navbar_items <- c(
      navbar_items,
      list(bslib::nav_spacer())
    )

    if (length(right_items) > 0) {
      navbar_items <- c(
        navbar_items,
        unname(lapply(as_nav_list(right_items), bslib::nav_item))
      )
    }

    if (identical(designer_name, "executivo")) {
      navbar_items <- c(
        navbar_items,
        list(bslib::nav_item(sdp_theme_toggle_ui()))
      )
    }

    if (isTRUE(contact) && !identical(designer_name, "executivo")) {
      navbar_items <- c(
        navbar_items,
        list(bslib::nav_item(contact_button))
      )
    }
  }

  page <- do.call(
    bslib::page_navbar,
    c(page_args, navbar_items, list(...))
  )

  if (identical(designer_name, "executivo")) {
    page_query <- htmltools::tagQuery(page)
    if (isTRUE(contact)) {
      page_query$find(".sdp-navbar__contact")$parent("li")$remove()
    }
    if (!is.null(data_pattern)) {
      page_query$find(".navbar-header")$append(data_pattern)
    }
    if (isTRUE(contact)) {
      page_query$find(".navbar-header")$append(contact_button)
    }
    page_query$find(".sdp-navbar")$parent("body")$append(
      sdp_footer_ui(
        designer_name,
        left = footer_left,
        right = footer_right
      )
    )
    page <- page_query$allTags()
  }

  if (isTRUE(include_css)) {
    page <- htmltools::attachDependencies(
      page,
      sdp_html_dependency(),
      append = TRUE
    )
  }

  page
}

legacy_menu_items <- function(menu_items, icons, pags) {
  if (length(menu_items) != length(pags)) {
    stop("`menu_items` e `pags` precisam ter o mesmo tamanho.", call. = FALSE)
  }

  if (!is.null(icons) && length(icons) != length(menu_items)) {
    stop("`icons` e `menu_items` precisam ter o mesmo tamanho.", call. = FALSE)
  }

  item_names <- names(menu_items)
  if (is.null(item_names) || any(!nzchar(item_names))) {
    item_names <- paste0("item_", seq_along(menu_items))
  }

  items <- vector("list", length(menu_items))
  for (index in seq_along(menu_items)) {
    items[[index]] <- list(
      label = as.character(menu_items[[index]]),
      value = item_names[[index]],
      icon = if (is.null(icons)) NULL else icons[[index]],
      ui = pags[[index]]
    )
  }

  names(items) <- item_names
  items
}

normalize_menu_items <- function(menu_items, path = "item") {
  if (is.null(menu_items)) {
    return(list())
  }

  if (!is.list(menu_items) || inherits(menu_items, "shiny.tag")) {
    stop("`menu_items` precisa ser uma lista.", call. = FALSE)
  }

  item_names <- names(menu_items)
  if (is.null(item_names)) {
    item_names <- paste0(path, "_", seq_along(menu_items))
  }
  item_names[!nzchar(item_names)] <- paste0(
    path,
    "_",
    which(!nzchar(item_names))
  )

  normalized <- lapply(seq_along(menu_items), function(index) {
    normalize_menu_item(menu_items[[index]], item_names[[index]])
  })

  names(normalized) <- item_names

  values <- vapply(normalized, function(item) item$value, character(1))
  if (anyDuplicated(values)) {
    stop("Os valores dos itens de navegação precisam ser únicos.", call. = FALSE)
  }

  normalized
}

normalize_menu_item <- function(item, item_name) {
  is_specification <- is.list(item) &&
    !inherits(item, c("shiny.tag", "shiny.tag.list")) &&
    any(names(item) %in% c(
      "label",
      "value",
      "icon",
      "ui",
      "content",
      "description",
      "items"
    ))

  if (!is_specification) {
    return(list(
      label = item_name,
      value = item_name,
      icon = NULL,
      ui = item,
      description = NULL,
      items = NULL
    ))
  }

  label <- item$label
  if (is.null(label)) {
    label <- item_name
  }

  value <- item$value
  if (is.null(value)) {
    value <- item_name
  }
  if (!is.character(value) || length(value) != 1L || !nzchar(value)) {
    stop("Cada item precisa de um `value` textual não vazio.", call. = FALSE)
  }

  description <- item$description
  if (!is.null(description) &&
      (!is.character(description) || length(description) != 1L)) {
    stop("Cada `description` precisa ser textual e Ãºnica.", call. = FALSE)
  }

  children <- item$items
  if (!is.null(children)) {
    children <- normalize_menu_items(children, path = value)
    if (!length(children)) {
      stop("Um grupo de navegação precisa ter pelo menos um item.", call. = FALSE)
    }
  }

  content <- item$ui
  if (is.null(content) && !is.null(item$content)) {
    content <- item$content
  }

  list(
    label = label,
    value = value,
    icon = item$icon,
    ui = content,
    description = description,
    items = children
  )
}

build_nav_item <- function(item, submenu = FALSE) {
  if (!is.null(item$items)) {
    children <- unname(lapply(
      item$items,
      function(child) build_nav_item(child, submenu = TRUE)
    ))
    return(do.call(
      bslib::nav_menu,
      c(
        list(
          title = nav_item_title(item$label, submenu = submenu),
          value = item$value,
          icon = nav_item_icon(item$icon, item$label)
        ),
        children
      )
    ))
  }

  arguments <- list(
    title = nav_item_title(
      item$label,
      description = item$description,
      submenu = submenu
    ),
    value = item$value,
    icon = nav_item_icon(item$icon, item$label)
  )

  if (!is.null(item$ui)) {
    arguments <- c(arguments, list(item$ui))
  }

  do.call(bslib::nav_panel, arguments)
}

nav_item_title <- function(label, description = NULL, submenu = FALSE) {
  item_class <- if (isTRUE(submenu)) {
    "sdp-navbar__item sdp-navbar__item--submenu"
  } else {
    "sdp-navbar__item"
  }

  item_content <- list(
    shiny::tags$span(class = "sdp-navbar__item-label", label)
  )

  if (isTRUE(submenu) && !is.null(description) && nzchar(description)) {
    item_content <- c(
      item_content,
      list(
        shiny::tags$span(
          class = "sdp-navbar__item-description",
          description
        )
      )
    )
  }

  shiny::tags$span(
    class = item_class,
    item_content
  )
}

nav_item_icon <- function(icon, label) {
  if (is.null(icon)) {
    return(NULL)
  }

  if (is.character(icon)) {
    if (length(icon) != 1L || !nzchar(icon)) {
      stop("`icon` precisa ser um nome textual não vazio.", call. = FALSE)
    }
    return(bsicons::bs_icon(icon))
  }

  icon
}

as_nav_list <- function(items) {
  if (inherits(items, c("shiny.tag", "shiny.tag.list"))) {
    return(list(items))
  }
  if (!is.list(items)) {
    return(list(items))
  }
  items
}

sdp_html_dependency <- function() {
  www_path <- sdp_www_path()
  if (!nzchar(www_path)) {
    stop("Os assets do pacote não foram encontrados.", call. = FALSE)
  }

  package_version <- tryCatch(
    as.character(utils::packageVersion("ShinyDesginerPadrao")),
    error = function(error) "0.0.0.9000"
  )

  htmltools::htmlDependency(
    name = "shiny-designer-padrao",
    version = package_version,
    src = www_path,
    stylesheet = "css/shiny-designer-padrao.css",
    script = "js/shiny-designer-padrao.js"
  )
}

sdp_www_path <- function(pkgname = "ShinyDesginerPadrao") {
  installed_path <- system.file("www", package = pkgname)
  if (nzchar(installed_path)) {
    return(installed_path)
  }

  development_root <- if (requireNamespace("pkgload", quietly = TRUE)) {
    tryCatch(pkgload::pkg_path(), error = function(error) getwd())
  } else {
    getwd()
  }
  development_path <- file.path(development_root, "inst", "www")
  if (dir.exists(development_path)) {
    return(normalizePath(development_path, winslash = "/", mustWork = TRUE))
  }

  ""
}

#' @export
#' @noRd
.onLoad <- function(libname, pkgname) {
  www_path <- sdp_www_path(pkgname)
  if (nzchar(www_path)) {
    shiny::addResourcePath(
      prefix = "ShinyDesginerPadrao-www",
      directoryPath = www_path
    )
  }
}
