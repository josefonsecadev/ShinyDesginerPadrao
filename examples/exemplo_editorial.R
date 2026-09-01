ShinyDesginerPadrao::sdp_use_designer("editorial")

menu_items <- list(
  narrativa = list(
    label = "Narrativa",
    icon = "journal-text",
    ui = shiny::h2("Relatório executivo")
  ),
  contexto = list(
    label = "Contexto",
    icon = "blockquote-left",
    items = list(
      panorama = list(
        label = "Panorama",
        description = "Visão geral do período",
        ui = shiny::h2("Panorama do período")
      ),
      evidencias = list(
        label = "Evidências",
        description = "Fontes e sinais relevantes",
        ui = shiny::h2("Evidências e fontes")
      )
    )
  ),
  conclusoes = list(
    label = "Conclusões",
    icon = "check2-circle",
    ui = shiny::h2("Conclusões")
  )
)

ui <- ShinyDesginerPadrao::navbar(
  title = "Dashboard Editorial",
  menu_items = menu_items,
  selected = "narrativa"
)

server <- function(input, output, session) {
  ShinyDesginerPadrao::server_navbar(input, output, session)
}

shiny::shinyApp(ui, server)
