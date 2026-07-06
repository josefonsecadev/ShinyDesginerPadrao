box::use(
  shiny[fluidPage, h2, p, shinyApp],
  ShinyDesginerPadrao[navbar]
)

menu_items <- list(
  "home" = list(
    label = "Home",
    ui = fluidPage(
      h2("Home"),
      p("Conteúdo mínimo do exemplo")
    )
  )
)

ui <- navbar(
  title = "Exemplo Navbar",
  menu_items = menu_items
)

server <- function(input, output, session) {}

shinyApp(ui = ui, server = server)
