sdp_footer_ui <- function(designer_name) {
  if (!identical(designer_name, "executivo")) {
    return(NULL)
  }

  shiny::tags$footer(
    class = "sdp-footer",
    `data-sdp-designer` = designer_name,
    `aria-hidden` = "true"
  )
}
