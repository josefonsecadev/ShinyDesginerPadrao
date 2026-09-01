ShinyDesginerPadrao::sdp_use_designer("produto")

menu_items <- list(
  produto = list(
    label = "Produto",
    icon = "box-seam",
    ui = shiny::h2("Visão do produto")
  ),
  comportamento = list(
    label = "Comportamento",
    icon = "people",
    items = list(
      adocao = list(
        label = "Adoção",
        description = "Uso e ativação",
        ui = shiny::h2("Adoção")
      ),
      jornadas = list(
        label = "Jornadas",
        description = "Caminhos de descoberta",
        ui = shiny::h2("Jornadas")
      )
    )
  ),
  experimentos = list(
    label = "Experimentos",
    icon = "lightbulb",
    ui = shiny::h2("Experimentos")
  )
)

ui <- ShinyDesginerPadrao::navbar(
  title = "Dashboard de Produto",
  menu_items = menu_items,
  selected = "produto"
)

server <- function(input, output, session) {
  ShinyDesginerPadrao::server_navbar(input, output, session)
}

shiny::shinyApp(ui, server)
