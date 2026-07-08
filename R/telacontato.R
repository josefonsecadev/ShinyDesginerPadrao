css <- "
.cont-principal-contato {
  display: flex;
  width: 100%;
  height: 100%;
  background: white;
}
.info-gerais {
  flex: 1;
  padding: 1.5rem;
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
  justify-content: center;
  align-items: center;
}
.info-gerais .contatos-icones {
  display: flex;
  gap: 1rem;
}
.info-gerais .contatos-icones a {
  color: inherit;
  font-size: 1.6rem;
}
"

#' @export
telacontato <- function() {
  shiny::fluidPage(
    shiny::tags$style(shiny::HTML(css)),
    shiny::tags$div(
      class = "cont-principal-contato",
      shiny::tags$div(
        class = "info-gerais",
        shiny::tags$h4("José Fonseca"),
        shiny::tags$p(
          shiny::tags$span("Especialista em dados")
        ),
        shiny::tags$p(
          shiny::tags$strong("Telefone: "), "(84) 98738-1057"
        ),
        shiny::tags$div(
          class = "contatos-icones",
          shiny::tags$a(
            href = "mailto:jose.fonseca.dev@gmail.com",
            bsicons::bs_icon("envelope-at")
          ),
          shiny::tags$a(
            href = "https://github.com/josefonsecadev",
            target = "_blank",
            bsicons::bs_icon("github")
          ),
          shiny::tags$a(
            href = "https://linkedin.com/in/jose-ferreira-fonseca-neto",
            target = "_blank",
            bsicons::bs_icon("linkedin")
          ),
          shiny::tags$a(
            href = "
              https://wa.me//5584987381075?
              text=Tenho%20interesse%20em%20conversar%20sobre%20dados
              ",
            target = "_blank",
            bsicons::bs_icon("whatsapp")
          )
        )
      ),
      shiny::tags$div(
        style = "width: 1px; background-color: rgba(0, 0, 0, 0.1);"
      ),
      shiny::tags$div(
        class = "imagem-contato",
        style = paste0(
          c(
            "flex: 1;",
            "display: flex;",
            "align-items: center;",
            "justify-content: center;",
            "padding: 1.5rem;"
          )
        ),
        shiny::tags$img(
          src = "ShinyDesginerPadrao-www/png/foto-perfil-nav-bar.jpeg",
          style = paste0(
            c(
              "max-width: 100%;",
              "max-height: 300px;",
              "border-radius: 8px;",
              "object-fit: cover;"
            )
          )
        )
      )
    )
  )
}

#' @export
server_navbar <- function(input, output, session) {
  shiny::observeEvent(input$abrir_contato, {
    shiny::showModal(
      shiny::modalDialog(
        ShinyDesginerPadrao::telacontato(),
        easyClose = TRUE,
        footer = NULL,
        size = "l"
      )
    )
  })
}