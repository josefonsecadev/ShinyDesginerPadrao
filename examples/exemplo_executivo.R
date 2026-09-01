ShinyDesginerPadrao::sdp_use_designer("executivo")

menu_items <- list(
  visao_geral = list(
    label = "Visão geral",
    icon = "speedometer2",
    ui = shiny::h2("Resumo executivo")
  ),
  desempenho = list(
    label = "Desempenho",
    icon = "graph-up-arrow",
    items = list(
      metas = list(label = "Metas", ui = shiny::h2("Metas e resultados")),
      comparativos = list(
        label = "Comparativos",
        ui = shiny::h2("Comparativos executivos")
      )
    )
  ),
  relatorios = list(
    label = "Relatórios",
    icon = "file-earmark-bar-graph",
    ui = shiny::h2("Relatórios")
  )
)

ui <- ShinyDesginerPadrao::navbar(
  title = "Dashboard Executivo",
  menu_items = menu_items,
  selected = "visao_geral"
)

server <- function(input, output, session) {}

shiny::shinyApp(ui, server)
