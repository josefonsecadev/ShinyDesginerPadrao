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

.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(
    prefix = "ShinyDesginerPadrao-www",
    directoryPath = system.file("www", package = pkgname)
  )
}

css_navbar <- "
  .navbar {
    position: sticky;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 1000;
    background: linear-gradient(90deg, #07121f 0%, #12233b 55%, #193b5b 100%) !important;
    border-bottom: 1px solid rgba(255, 255, 255, 0.16) !important;
    box-shadow: 0 10px 30px rgba(2, 8, 23, 0.25);
    padding: 0.55rem 1rem;
    min-height: 3.4rem;
  }
"

css_navbar_brand_custom <- paste0(c(
  "display: flex;",
  "align-items: center;",
  "gap: 0.75rem;",
  "flex-shrink: 0;"
))

css_navbar_brand <- paste0(c(
  "width: 42px !important;",
  "height: 42px !important;",
  "border-radius: 50% !important;",
  "object-fit: cover !important;",
  "border: 2px solid rgba(255, 255, 255, 0.8);",
  "color: #f8fafc !important;",
  "font-weight: 700;",
  "letter-spacing: 0.02em;",
  "display: inline-flex;",
  "align-items: center;",
  "margin-right: 0;"

))

# .navbar-brand-name {
#   color: #f8fafc;
#   font-size: 1rem;
#   font-weight: 700;
#   white-space: nowrap;
# }

css_navbar_nav <- paste0(c(
  "display: flex;",
  "align-items: center;",
  "gap: 0.25rem;",
  "flex-wrap: nowrap;",
  "margin-left: 0.2rem;"
))

# .nav-link {
#   color: rgba(248, 250, 252, 0.8) !important;
# }

# .nav-link i {
#   margin-right: 8px;
# }

css_nav_menu_item <- paste0(c(
  "display: inline-flex;",
  "align-items: center;",
  "gap: 0.5rem;",
  "white-space: nowrap;"
))

css_nav_menu_item_highlight <- paste0(c(
  "position: relative;",
  "color: #e8f9ff;",
  "font-weight: 700;"
))

css_nav_menu_item_label <- paste0(c(
  "color: #e8f9ff;",
  "font-weight: 700;"
))

css_body <- "
  body {
    background: linear-gradient(135deg, #07121f 0%, #0f172a 42%, #162d45 100%);,
    color: #f8fafc;,
    font-family: 'Inter', sans-serif;,
    overflow-x: hidden;
  }
"

css_pagina <- "

/* Estilos globais compartilhados */

.navbar {
  position: sticky;
  top: 0;
  left: 0;
  width: 100%;
  z-index: 1000;
  background: linear-gradient(90deg, #07121f 0%, #12233b 55%, #193b5b 100%) !important;
  border-bottom: 1px solid rgba(255, 255, 255, 0.16) !important;
  box-shadow: 0 10px 30px rgba(2, 8, 23, 0.25);
  padding: 0.55rem 1rem;
  min-height: 3.4rem;
}

.navbar-brand-custom {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  flex-shrink: 0;
  margin-right: 1rem;
}

.navbar-brand .nav-bar-foto-perfil {
  width: 42px !important;
  height: 42px !important;
  border-radius: 50% !important;
  object-fit: cover !important;
  border: 2px solid rgba(255, 255, 255, 0.8);
}

.navbar-brand {
  color: #f8fafc !important;
  font-weight: 700;
  letter-spacing: 0.02em;
  display: inline-flex;
  align-items: center;
}

.navbar-brand-name {
  color: #f8fafc;
  font-size: 1rem;
  font-weight: 700;
  white-space: nowrap;
}

.navbar-nav {
  display: flex;
  align-items: center;
  gap: 0.25rem;
  flex-wrap: nowrap;
  margin-left: 0.2rem;
}

.nav-link {
  color: rgba(248, 250, 252, 0.8) !important;
}

.nav-link i {
  margin-right: 8px;
}

.nav-menu-item {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  white-space: nowrap;
}

.nav-menu-item--highlight {
  position: relative;
}

.nav-menu-item--highlight .nav-menu-item-label {
  color: #e8f9ff;
  font-weight: 700;
}

body {
  background:
    linear-gradient(135deg, #07121f 0%, #0f172a 42%, #162d45 100%);
  color: #f8fafc;
  font-family: 'Inter', sans-serif;
  overflow-x: hidden;
}

"
#' @export 
navbar <- function(
    title,
    menu_items,
    icons,
    pags,
    theme = bslib::bs_theme(version = 5),
    include_css = TRUE,
    ...) {

  args_nav_bar <- list(
    title = shiny::tags$span(
      style = css_navbar_brand_custom,
      shiny::tags$img(
        src = "ShinyDesginerPadrao-www/png/foto-perfil-nav-bar.jpeg",
        style = css_navbar_brand
      ),
      shiny::tags$span(
        title
      )
    ),
    theme = theme,
    header = shiny::tags$head(
      shiny::tags$link(rel = "preconnect",
                       href = "https://fonts.googleapis.com"),
      shiny::tags$style(shiny::HTML(css_pagina)),
      shiny::tags$link(
        rel = "stylesheet",
        href = paste0(
          "https://fonts.googleapis.com/css2?",
          "family=Inter:wght@400;500;600;700&display=swap"
        )
      )
    )
  )

  panels <- purrr::pmap(
    list(menu_items, icons, pags),
    function(item, icon, pag) {
      bslib::nav_panel(
        title = shiny::tags$span(
          style = css_nav_menu_item,
          item
        ),
        pag,
        icon = bsicons::bs_icon(icon)
      )
    }
  )

  tag_contato <- shiny::actionLink(
    inputId = "abrir_contato",
    label = shiny::tags$span(
      style = paste0(css_nav_menu_item, css_nav_menu_item_highlight),
      bsicons::bs_icon("paperclip"),
      shiny::tags$span(style = css_nav_menu_item_label, "Contato")
    )
  )

  do.call(
    bslib::page_navbar,
    c(args_nav_bar,
      panels,
      list(bslib::nav_spacer()),
      list(bslib::nav_item(tag_contato)),
      list(...)
    )
  )
}