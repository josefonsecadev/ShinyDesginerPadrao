devtools::load_all(".")


title <- "Câmara dos Deputados"
menus <- c("Teste", "Teste2")
icons <- c("house", "app")
pags <- c("vouCriar", "Criarei")

ui <- shiny::fluidPage(
  ShinyDesginerPadrao::navbar(
    title = title,
    menu_items = menus,
    icons = icons,
    pags = pags
  )

)

server <- function(input, output, session) {
  ShinyDesginerPadrao::server_navbar(input, output, session)
}

shiny::runApp(shiny::shinyApp(ui, server))