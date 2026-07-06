#' Cria um layout padronizado para dashboards Shiny
#'
#' Esta função recebe um título e uma lista de telas para montar um
#' dashboard com menu navegável, visual reutilizável e conteúdo configurável.
#'
#' @param title Texto exibido como título do dashboard.
#' @param menu_items Lista com as telas do dashboard. Cada item pode ser
#'   um objeto de UI do Shiny ou uma lista com os elementos `label` e `ui`.
#' @param theme Tema do bslib para personalizar cores e estilo.
#' @param include_css Lógico indicando se deve incluir o estilo padrão do pacote.
#' @param ... Argumentos adicionais enviados para [bslib::page_navbar()].
#'
#' @return Um objeto de interface do Shiny com o layout padronizado.
#' @export
#'
#' @examples
#' \dontrun{
#' menu_items <- list(
#'   "visao_geral" = list(
#'     label = "Visão Geral",
#'     ui = shiny::fluidPage(
#'       shiny::h2("Visão Geral"),
#'       shiny::p("Conteúdo da primeira tela")
#'     )
#'   ),
#'   "vendas" = list(
#'     label = "Vendas",
#'     ui = shiny::fluidPage(
#'       shiny::h2("Vendas"),
#'       shiny::p("Conteúdo da segunda tela")
#'     )
#'   )
#' )
#'
#' ui <- navbar(
#'   title = "Meu Dashboard",
#'   menu_items = menu_items
#' )
#' }
navbar <- function(
    title,
    menu_items,
    theme = bslib::bs_theme(version = 5),
    include_css = TRUE,
    ...) {
  normalized_menu <- normalize_menu_items(menu_items)

  panels <- lapply(seq_along(normalized_menu), function(i) {
    item <- normalized_menu[[i]]
    bslib::nav_panel(
      title = shiny::tags$span(class = "dashboard-padrao-nav-label", item$label),
      value = names(normalized_menu)[i],
      item$ui
    )
  })

  navbar_args <- list(
    title = shiny::tags$span(class = "dashboard-padrao-title", title),
    theme = theme
  )

  if (include_css) {
    navbar_args$header <- navbar_header()
  }

  do.call(
    bslib::page_navbar,
    c(navbar_args, panels, list(...))
  )
}

navbar_header <- function() {
  scss_path <- system.file("www", "dashboard_padrao.scss", package = "ShinyDesginerPadrao")

  if (!nzchar(scss_path) || !requireNamespace("sass", quietly = TRUE)) {
    return(shiny::tags$head(
      shiny::tags$meta(name = "viewport", content = "width=device-width, initial-scale=1")
    ))
  }

  css_text <- sass::sass(sass::sass_file(scss_path))

  shiny::tags$head(
    shiny::tags$meta(name = "viewport", content = "width=device-width, initial-scale=1"),
    shiny::tags$style(css_text)
  )
}

normalize_menu_items <- function(menu_items) {
  if (is.null(menu_items)) {
    return(list())
  }

  if (is.null(names(menu_items))) {
    names(menu_items) <- paste0("item_", seq_along(menu_items))
  }

  normalized <- vector("list", length(menu_items))

  for (i in seq_along(menu_items)) {
    item <- menu_items[[i]]

    if (is.list(item) && !is.null(item$ui)) {
      normalized[[i]] <- list(
        label = if (!is.null(item$label)) item$label else names(menu_items)[i],
        ui = item$ui
      )
    } else {
      normalized[[i]] <- list(
        label = names(menu_items)[i],
        ui = item
      )
    }
  }

  names(normalized) <- names(menu_items)
  normalized
}
