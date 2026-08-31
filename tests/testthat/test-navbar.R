test_that("navbar cria uma página com a classe do componente", {
  ui <- navbar(
    title = "Dashboard",
    menu_items = list(
      inicio = list(
        label = "Inicio",
        ui = shiny::h2("Conteúdo")
      )
    )
  )

  html <- as.character(ui)

  expect_match(html, "sdp-navbar")
  expect_match(html, "sdp-navbar__title")
  expect_match(html, "sdp-navbar__item-label")
  expect_no_match(html, "sdp-navbar[^>]*style=")
})

test_that("navbar aceita grupos de navegação", {
  ui <- navbar(
    title = "Dashboard",
    menu_items = list(
      analises = list(
        label = "Analises",
        items = list(
          mensal = list(label = "Mensal", ui = "Conteudo")
        )
      )
    )
  )

  html <- as.character(ui)

  expect_match(html, "Analises")
  expect_match(html, "Mensal")
})

test_that("navbar mantém o formato legado com páginas paralelas", {
  ui <- navbar(
    title = "Dashboard",
    menu_items = c("Inicio", "Dados"),
    icons = NULL,
    pags = list("Primeira tela", "Segunda tela")
  )

  html <- as.character(ui)

  expect_match(html, "Inicio")
  expect_match(html, "Segunda tela")
})

test_that("navbar permite omitir a dependência visual", {
  ui <- navbar(
    title = "Dashboard",
    menu_items = list(inicio = "Conteúdo"),
    include_css = FALSE
  )

  dependencies <- htmltools::renderTags(ui)$dependencies

  expect_false(any(vapply(
    dependencies,
    function(dependency) identical(dependency$name, "shiny-designer-padrao"),
    logical(1)
  )))
})

test_that("navbar anexa uma única dependência visual", {
  ui <- navbar(
    title = "Dashboard",
    menu_items = list(inicio = "Conteúdo")
  )

  dependencies <- htmltools::renderTags(ui)$dependencies
  matching <- Filter(
    function(dependency) identical(dependency$name, "shiny-designer-padrao"),
    dependencies
  )

  expect_length(matching, 1)
  expect_identical(matching[[1]]$stylesheet, "css/shiny-designer-padrao.css")
})
