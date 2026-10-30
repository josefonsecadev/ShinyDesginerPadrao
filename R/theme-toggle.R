sdp_theme_toggle_ui <- function() {
  shiny::tags$button(
    class = "sdp-theme-toggle",
    type = "button",
    `data-sdp-theme-mode` = "light",
    `aria-pressed` = "false",
    theme_toggle_icon("light"),
    theme_toggle_icon("dark"),
    shiny::tags$span(
      class = "sdp-theme-toggle__label",
      "Light"
    )
  )
}

theme_toggle_icon <- function(mode) {
  icon_children <- if (identical(mode, "light")) {
    c(
      list(shiny::tags$circle(cx = "12", cy = "12", r = "4.2")),
      list(
        shiny::tags$line(x1 = "12", y1 = "2", x2 = "12", y2 = "5"),
        shiny::tags$line(x1 = "12", y1 = "19", x2 = "12", y2 = "22"),
        shiny::tags$line(x1 = "2", y1 = "12", x2 = "5", y2 = "12"),
        shiny::tags$line(x1 = "19", y1 = "12", x2 = "22", y2 = "12"),
        shiny::tags$line(x1 = "4.5", y1 = "4.5", x2 = "6.6", y2 = "6.6"),
        shiny::tags$line(x1 = "17.4", y1 = "17.4", x2 = "19.5", y2 = "19.5"),
        shiny::tags$line(x1 = "4.5", y1 = "19.5", x2 = "6.6", y2 = "17.4"),
        shiny::tags$line(x1 = "17.4", y1 = "6.6", x2 = "19.5", y2 = "4.5")
      )
    )
  } else {
    list(shiny::tags$path(
      d = "M20 14.5 A8 8 0 1 1 9.5 4 A6.2 6.2 0 0 0 20 14.5 Z"
    ))
  }

  do.call(
    shiny::tags$svg,
    c(
      list(
        class = paste0("sdp-theme-toggle__icon sdp-theme-toggle__icon--", mode),
        width = "17",
        height = "17",
        viewBox = "0 0 24 24",
        fill = "none",
        stroke = "currentColor",
        `stroke-width` = "1.7",
        `stroke-linecap` = "round",
        `stroke-linejoin` = "round",
        `aria-hidden` = "true"
      ),
      icon_children
    )
  )
}
