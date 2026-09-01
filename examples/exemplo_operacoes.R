ShinyDesginerPadrao::sdp_use_designer("operacoes")

menu_items <- list(
  monitoramento = list(
    label = "Monitoramento",
    icon = "activity",
    ui = shiny::h2("Monitoramento operacional")
  ),
  incidentes = list(
    label = "Incidentes",
    icon = "exclamation-triangle",
    items = list(
      ativos = list(label = "Ativos", ui = shiny::h2("Incidentes ativos")),
      historico = list(
        label = "Histórico",
        ui = shiny::h2("Histórico de incidentes")
      )
    )
  ),
  infraestrutura = list(
    label = "Infraestrutura",
    icon = "hdd-stack",
    ui = shiny::h2("Infraestrutura")
  )
)

ui <- ShinyDesginerPadrao::navbar(
  title = "Dashboard de Operações",
  menu_items = menu_items,
  selected = "monitoramento"
)

server <- function(input, output, session) {}

shiny::shinyApp(ui, server)
