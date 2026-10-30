#' Cria um tema de designer para dashboards Shiny
#'
#' Os presets usam `bslib::bs_theme()` e podem ser usados em qualquer layout
#' bslib. As fontes são declaradas com alternativas locais para que o tema
#' funcione sem depender de uma conexão externa.
#'
#' Os presets foram desenhados para tarefas diferentes: `executivo` prioriza
#' decisão e metas; `analitico`, exploração e comparação; `editorial`, leitura
#' contextual; `produto`, operação diária; e `operacoes`, monitoramento e
#' alertas. O tamanho base, escala tipográfica, altura de linha, densidade e
#' raio de cada preset podem ser consultados em `sdp_designers()`.
#'
#' @param designer Nome do preset visual. Consulte `sdp_designers()` para ver
#'   as opções disponíveis.
#'
#' @return Um objeto [bslib::bs_theme()] configurado para o designer escolhido.
#' @export
#'
#' @examples
#' theme <- sdp_theme("analitico")
#' navbar <- ShinyDesginerPadrao::navbar(
#'   title = "Indicadores",
#'   menu_items = list(inicio = "Visão geral"),
#'   theme = theme
#' )
sdp_theme <- function(designer = "executivo") {
  designer <- match.arg(designer, choices = names(sdp_designer_specs()))
  spec <- sdp_designer_specs()[[designer]]

  theme <- bslib::bs_theme(
    version = 5,
    bg = spec$bg,
    fg = spec$fg,
    "body-color" = spec$fg,
    primary = spec$primary,
    secondary = spec$secondary,
    success = spec$success,
    info = spec$info,
    warning = spec$warning,
    danger = spec$danger,
    base_font = spec$base_font,
    heading_font = spec$heading_font,
    code_font = spec$code_font,
    font_scale = spec$font_scale,
    "font-size-base" = spec$font_size_base,
    "line-height-base" = spec$line_height_base,
    "border-radius" = spec$radius,
    "border-radius-sm" = spec$radius_sm,
    "border-radius-lg" = spec$radius_lg,
    "box-shadow" = spec$shadow,
    "headings-font-weight" = spec$heading_weight,
    "navbar-padding-y" = spec$navbar_padding,
    "card-border-width" = spec$card_border_width
  )

  attr(theme, "sdp-designer") <- designer
  theme
}

#' Define o designer global da aplicação
#'
#' A configuração usa o tema global oficial do bslib. Depois de executar esta
#' função uma vez na criação da UI, os componentes bslib e os componentes do
#' pacote herdam o designer sem receber `theme` ou `designer` individualmente.
#'
#' @param designer Nome do preset visual usado pela aplicação.
#'
#' @return O objeto de tema configurado, de forma invisível.
#' @export
#'
#' @examples
#' sdp_use_designer("produto")
#' ui <- ShinyDesginerPadrao::navbar(
#'   title = "Produto",
#'   menu_items = list(inicio = "Visão geral")
#' )
sdp_use_designer <- function(designer = "executivo") {
  theme <- sdp_theme(designer)
  bslib::bs_global_set(theme)
  invisible(theme)
}

#' Retorna o designer global atualmente configurado
#'
#' @return O identificador do designer global ou `NULL` quando não há um
#'   designer configurado pelo pacote.
#' @export
#'
#' @examples
#' sdp_use_designer("editorial")
#' sdp_current_designer()
sdp_current_designer <- function() {
  theme <- bslib::bs_global_get()
  if (is.null(theme)) {
    return(NULL)
  }

  attr(theme, "sdp-designer")
}

#' Remove o designer global da aplicação
#'
#' Depois da remoção, o bslib volta a usar o comportamento padrão quando um
#' componente não recebe um tema explícito.
#'
#' @return `NULL`, de forma invisível.
#' @export
#'
#' @examples
#' sdp_use_designer("executivo")
#' sdp_clear_designer()
sdp_clear_designer <- function() {
  bslib::bs_global_clear()
  invisible(NULL)
}

#' Lista os designers disponíveis no pacote
#'
#' A tabela resume a intenção de uso de cada preset. Para obter o tema pronto,
#' use `sdp_theme()` com o valor da coluna `designer`.
#'
#' @return Um data frame com o nome, a finalidade e a personalidade visual de
#'   cada preset.
#' @export
#'
#' @examples
#' sdp_designers()
sdp_designers <- function() {
  specs <- sdp_designer_specs()
  data.frame(
    designer = names(specs),
    nome = vapply(specs, `[[`, character(1), "name"),
    finalidade = vapply(specs, `[[`, character(1), "purpose"),
    personalidade = vapply(specs, `[[`, character(1), "personality"),
    cor_fundo = vapply(specs, `[[`, character(1), "bg"),
    cor_texto = vapply(specs, `[[`, character(1), "fg"),
    cor_acao = vapply(specs, `[[`, character(1), "primary"),
    familia_base = vapply(
      specs,
      function(spec) paste(spec$base_font, collapse = ", "),
      character(1)
    ),
    familia_titulos = vapply(
      specs,
      function(spec) paste(spec$heading_font, collapse = ", "),
      character(1)
    ),
    tamanho_base = vapply(specs, `[[`, character(1), "font_size_base"),
    escala_tipografica = vapply(specs, `[[`, numeric(1), "font_scale"),
    altura_linha = vapply(specs, `[[`, numeric(1), "line_height_base"),
    densidade = vapply(specs, `[[`, character(1), "density"),
    raio = vapply(specs, `[[`, character(1), "radius"),
    stringsAsFactors = FALSE
  )
}

sdp_designer_specs <- function() {
  list(
    executivo = list(
      name = "Executivo",
      purpose = "Indicadores para decisão e acompanhamento de metas",
      personality = "Confiável, sóbrio e orientado a prioridade",
      bg = "#F7F9FC",
      fg = "#132238",
      primary = "#155EEF",
      secondary = "#475467",
      success = "#067647",
      info = "#175CD3",
      warning = "#B54708",
      danger = "#B42318",
      base_font = c(
        "IBM Plex Sans",
        "Segoe UI",
        "system-ui",
        "sans-serif"
      ),
      heading_font = c(
        "Space Grotesk",
        "Segoe UI",
        "system-ui",
        "sans-serif"
      ),
      code_font = c(
        "IBM Plex Mono",
        "ui-monospace",
        "Cascadia Mono",
        "monospace"
      ),
      font_size_base = "1rem",
      font_scale = 1,
      line_height_base = 1.5,
      density = "equilibrada",
      radius = "0.5rem",
      radius_sm = "0.25rem",
      radius_lg = "0.75rem",
      shadow = "0 0.5rem 1.25rem rgba(19, 34, 56, 0.10)",
      heading_weight = 700,
      navbar_padding = "0.5rem",
      card_border_width = "1px"
    ),
    analitico = list(
      name = "Analítico",
      purpose = "Exploração de dados, tabelas e séries comparáveis",
      personality = "Preciso, denso e técnico",
      bg = "#F4F4F4",
      fg = "#161616",
      primary = "#0043CE",
      secondary = "#525252",
      success = "#198038",
      info = "#0072C3",
      warning = "#8A3800",
      danger = "#DA1E28",
      base_font = c("IBM Plex Sans", "Arial", "sans-serif"),
      heading_font = c("IBM Plex Sans", "Arial", "sans-serif"),
      code_font = c("IBM Plex Mono", "Consolas", "monospace"),
      font_size_base = "0.9375rem",
      font_scale = 0.96,
      line_height_base = 1.4,
      density = "alta",
      radius = "0.125rem",
      radius_sm = "0",
      radius_lg = "0.25rem",
      shadow = "0 0.125rem 0.25rem rgba(22, 22, 22, 0.10)",
      heading_weight = 600,
      navbar_padding = "0.375rem",
      card_border_width = "1px"
    ),
    editorial = list(
      name = "Editorial",
      purpose = "Relatórios, narrativas executivas e leitura contextual",
      personality = "Humano, reflexivo e autoral",
      bg = "#FCFBF7",
      fg = "#202124",
      primary = "#6D2E46",
      secondary = "#5B6470",
      success = "#286B4F",
      info = "#315A7D",
      warning = "#8A4B08",
      danger = "#9F2D2D",
      base_font = c("Source Sans 3", "Segoe UI", "sans-serif"),
      heading_font = c("Georgia", "Times New Roman", "serif"),
      code_font = c("ui-monospace", "Cascadia Code", "Consolas", "monospace"),
      font_size_base = "1rem",
      font_scale = 1.02,
      line_height_base = 1.6,
      density = "respirada",
      radius = "0",
      radius_sm = "0",
      radius_lg = "0",
      shadow = "none",
      heading_weight = 700,
      navbar_padding = "0.625rem",
      card_border_width = "1px"
    ),
    produto = list(
      name = "Produto",
      purpose = "Operação diária, descoberta e acompanhamento de produto",
      personality = "Acolhedor, claro e energético",
      bg = "#F8F7FC",
      fg = "#272238",
      primary = "#5B3CC4",
      secondary = "#087F8C",
      success = "#237A57",
      info = "#1769AA",
      warning = "#955800",
      danger = "#B4235A",
      base_font = c("Nunito Sans", "Segoe UI", "sans-serif"),
      heading_font = c("Nunito Sans", "Segoe UI", "sans-serif"),
      code_font = c("ui-monospace", "Cascadia Code", "Consolas", "monospace"),
      font_size_base = "1rem",
      font_scale = 1,
      line_height_base = 1.5,
      density = "equilibrada",
      radius = "0.875rem",
      radius_sm = "0.5rem",
      radius_lg = "1.25rem",
      shadow = "0 0.5rem 1.5rem rgba(39, 34, 56, 0.12)",
      heading_weight = 700,
      navbar_padding = "0.625rem",
      card_border_width = "0"
    ),
    operacoes = list(
      name = "Operações",
      purpose = "Monitoramento contínuo, alertas e resposta rápida",
      personality = "Concentrado, contrastado e orientado a estado",
      bg = "#0C1117",
      fg = "#E6EDF3",
      primary = "#58A6FF",
      secondary = "#8B949E",
      success = "#56D364",
      info = "#79C0FF",
      warning = "#F2CC60",
      danger = "#FF7B72",
      base_font = c("Roboto", "Arial", "sans-serif"),
      heading_font = c("Roboto", "Arial", "sans-serif"),
      code_font = c("Roboto Mono", "Cascadia Code", "Consolas", "monospace"),
      font_size_base = "0.9375rem",
      font_scale = 0.98,
      line_height_base = 1.4,
      density = "alta",
      radius = "0.25rem",
      radius_sm = "0.125rem",
      radius_lg = "0.5rem",
      shadow = "0 0.5rem 1.25rem rgba(0, 0, 0, 0.35)",
      heading_weight = 600,
      navbar_padding = "0.375rem",
      card_border_width = "1px"
    )
  )
}
