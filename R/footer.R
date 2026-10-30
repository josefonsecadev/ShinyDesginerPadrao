sdp_footer_ui <- function(designer_name, left = NULL, right = NULL) {
  if (!identical(designer_name, "executivo")) {
    return(NULL)
  }

  has_content <- !is.null(left) || !is.null(right)

  shiny::tags$footer(
    class = "sdp-footer",
    `data-sdp-designer` = designer_name,
    `aria-hidden` = if (has_content) NULL else "true",
    if (has_content) {
      shiny::tags$div(
        class = "sdp-footer__content",
        if (!is.null(left)) {
          shiny::tags$p(class = "sdp-footer__left", left)
        },
        if (!is.null(right)) {
          shiny::tags$p(class = "sdp-footer__right", right)
        }
      )
    }
  )
}
