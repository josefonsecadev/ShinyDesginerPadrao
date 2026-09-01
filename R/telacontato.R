#' Cria o conteúdo estático do modal Sobre mim
#'
#' @return Um objeto de interface do Shiny com informações de contato
#'   estáticas.
#' @export
telacontato <- function() {
  content <- shiny::tags$section(
    class = "sdp-contato",
    `aria-labelledby` = "sdp-contato-titulo",
    shiny::tags$div(
      class = "sdp-contato__visual",
      shiny::tags$div(
        class = "sdp-contato__avatar",
        `aria-hidden` = "true",
        "JF"
      ),
      shiny::tags$p(
        class = "sdp-contato__assinatura",
        "José Fonseca"
      )
    ),
    shiny::tags$div(
      class = "sdp-contato__conteudo",
      shiny::tags$h2(
        id = "sdp-contato-titulo",
        class = "sdp-contato__titulo",
        "José Fonseca"
      ),
      shiny::tags$p(
        class = "sdp-contato__descricao",
        "Especialista em dados"
      ),
      shiny::tags$dl(
        class = "sdp-contato__detalhes",
        shiny::tags$dt("Telefone"),
        shiny::tags$dd("(84) 98738-1057"),
        shiny::tags$dt("E-mail"),
        shiny::tags$dd("jose.fonseca.dev@gmail.com")
      ),
      shiny::tags$nav(
        class = "sdp-contato__links",
        `aria-label` = "Redes e canais de contato",
        shiny::tags$a(
          class = "sdp-contato__link",
          href = "mailto:jose.fonseca.dev@gmail.com",
          `aria-label` = "Enviar e-mail",
          title = "Enviar e-mail",
          shiny::tags$span(class = "sdp-contato__link-label", "E-mail")
        ),
        shiny::tags$a(
          class = "sdp-contato__link",
          href = "https://github.com/josefonsecadev",
          target = "_blank",
          rel = "noopener noreferrer",
          `aria-label` = "Abrir GitHub",
          title = "Abrir GitHub",
          shiny::tags$span(class = "sdp-contato__link-label", "GitHub")
        ),
        shiny::tags$a(
          class = "sdp-contato__link",
          href = "https://linkedin.com/in/jose-ferreira-fonseca-neto",
          target = "_blank",
          rel = "noopener noreferrer",
          `aria-label` = "Abrir LinkedIn",
          title = "Abrir LinkedIn",
          shiny::tags$span(class = "sdp-contato__link-label", "LinkedIn")
        ),
        shiny::tags$a(
          class = "sdp-contato__link",
          href = paste0(
            "https://wa.me/5584987381075?text=",
            "Tenho%20interesse%20em%20conversar%20sobre%20dados"
          ),
          target = "_blank",
          rel = "noopener noreferrer",
          `aria-label` = "Abrir WhatsApp",
          title = "Abrir WhatsApp",
          shiny::tags$span(class = "sdp-contato__link-label", "WhatsApp")
        )
      )
    )
  )

  htmltools::attachDependencies(
    content,
    sdp_html_dependency(),
    append = TRUE
  )
}

#' @export
#' @noRd
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
  }, ignoreInit = TRUE)
}
