menu_items <- list(
  inicio = list(
    label = "Início",
    icon = "house",
    ui = shiny::h2("Visão geral")
  ),
  analises = list(
    label = "Análises",
    icon = "graph-up",
    items = list(
      indicadores = list(
        label = "Indicadores",
        ui = shiny::h2("Indicadores")
      ),
      comparativos = list(
        label = "Comparativos",
        ui = shiny::h2("Comparativos")
      )
    )
  )
)

ui <- ShinyDesginerPadrao::navbar(
  title = "Meu dashboard",
  menu_items = menu_items,
  selected = "inicio"
)

server <- function(input, output, session) {}

shiny::shinyApp(ui, server)
