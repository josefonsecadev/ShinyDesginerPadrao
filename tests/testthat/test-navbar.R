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

test_that("sdp_theme cria os cinco designers", {
  designers <- sdp_designers()

  expect_equal(
    designers$designer,
    c("executivo", "analitico", "editorial", "produto", "operacoes")
  )
  expect_identical(designers$tamanho_base, c(
    "1rem",
    "0.9375rem",
    "1rem",
    "1rem",
    "0.9375rem"
  ))
  expect_identical(designers$densidade, c(
    "equilibrada",
    "alta",
    "respirada",
    "equilibrada",
    "alta"
  ))
  expect_true(all(vapply(
    designers$designer,
    function(designer) bslib::is_bs_theme(sdp_theme(designer)),
    logical(1)
  )))
})

test_that("sdp_theme configura tokens principais do designer", {
  theme <- sdp_theme("operacoes")

  expect_identical(attr(theme, "sdp-designer"), "operacoes")
  expect_identical(bslib::bs_get_variables(theme, "body-bg")[[1]], "#0C1117")
  expect_identical(bslib::bs_get_variables(theme, "body-color")[[1]], "#E6EDF3")
  expect_identical(bslib::bs_get_variables(theme, "primary")[[1]], "#58A6FF")
  expect_identical(
    bslib::bs_get_variables(theme, "headings-font-family")[[1]],
    "Roboto, Arial, sans-serif"
  )
})

test_that("navbar aceita um designer diretamente", {
  ui <- navbar(
    title = "Operações",
    menu_items = list(inicio = "Monitoramento"),
    designer = "operacoes"
  )

  expect_match(as.character(ui), "sdp-navbar")
})

test_that("navbar inclui o campo Sobre mim por padrão", {
  ui <- navbar(
    title = "Dashboard",
    menu_items = list(inicio = "Conteúdo")
  )

  html <- as.character(ui)

  expect_match(html, "abrir_contato")
  expect_match(html, "Sobre mim")
  expect_match(html, "sdp-navbar__contact")
})

test_that("navbar permite ocultar o campo Sobre mim", {
  ui <- navbar(
    title = "Dashboard",
    menu_items = list(inicio = "Conteúdo"),
    contact = FALSE
  )

  expect_no_match(as.character(ui), "abrir_contato")
})

test_that("telacontato usa classes do componente e dependência central", {
  ui <- telacontato()
  html <- as.character(ui)
  dependencies <- htmltools::renderTags(ui)$dependencies
  matching <- Filter(
    function(dependency) identical(dependency$name, "shiny-designer-padrao"),
    dependencies
  )

  expect_match(html, "sdp-contato")
  expect_match(html, "Fonseca")
  expect_match(html, "sdp-contato__links")
  expect_no_match(html, "style=")
  expect_length(matching, 1)
})

test_that("sdp_use_designer configura o tema global uma única vez", {
  previous <- bslib::bs_global_get()
  on.exit(if (is.null(previous)) {
    bslib::bs_global_clear()
  } else {
    bslib::bs_global_set(previous)
  }, add = TRUE)

  sdp_use_designer("operacoes")

  expect_identical(sdp_current_designer(), "operacoes")
  ui <- navbar(
    title = "Operações",
    menu_items = list(inicio = "Monitoramento")
  )

  expect_match(as.character(ui), "sdp-navbar")
})

test_that("sdp_clear_designer remove o tema global do pacote", {
  previous <- bslib::bs_global_get()
  on.exit(if (is.null(previous)) {
    bslib::bs_global_clear()
  } else {
    bslib::bs_global_set(previous)
  }, add = TRUE)

  sdp_use_designer("produto")
  sdp_clear_designer()

  expect_null(sdp_current_designer())
})

test_that("sdp_theme rejeita designer desconhecido", {
  expect_snapshot(error = TRUE, sdp_theme("inexistente"))
})
