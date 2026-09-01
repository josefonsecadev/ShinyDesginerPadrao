ShinyDesginerPadrao::sdp_use_designer("analitico")

menu_items <- list(
  exploracao = list(
    label = "Exploração",
    icon = "search",
    ui = shiny::h2("Exploração analítica")
  ),
  analises = list(
    label = "Análises",
    icon = "bar-chart-line",
    items = list(
      distribuicoes = list(
        label = "Distribuições",
        ui = shiny::h2("Distribuições")
      ),
      tendencias = list(
        label = "Tendências",
        ui = shiny::h2("Tendências")
      )
    )
  ),
  dados = list(
    label = "Dados",
    icon = "table",
    ui = shiny::h2("Tabela de dados")
  )
)

ui <- ShinyDesginerPadrao::navbar(
  title = "Dashboard Analítico",
  menu_items = menu_items,
  selected = "exploracao"
)

server <- function(input, output, session) {}

shiny::shinyApp(ui, server)
