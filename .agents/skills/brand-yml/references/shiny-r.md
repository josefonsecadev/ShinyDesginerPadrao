# Usando brand.yml com Shiny R

## Pré-requisitos

Use versões de `bslib` e Shiny compatíveis com suporte a `brand.yml`.

```r
install.packages(c("shiny", "bslib"))
```

## Descoberta automática

Coloque `_brand.yml` na raiz da aplicação. O bslib procura o arquivo no diretório da aplicação e em diretórios ancestrais.

```r
ui <- bslib::page_fluid(
  theme = bslib::bs_theme(brand = TRUE),
  shiny::h1("Aplicação")
)
```

## Caminho explícito

Use um caminho explícito quando o arquivo estiver fora da árvore da aplicação ou quando houver mais de uma configuração de marca.

```r
theme <- bslib::bs_theme(brand = "config/_brand.yml")
ui <- bslib::page_fluid(theme = theme)
```

## Funções de página

O tema pode ser passado para qualquer função de página bslib:

```r
theme <- bslib::bs_theme(brand = TRUE)

ui <- bslib::page_sidebar(
  theme = theme,
  sidebar = bslib::sidebar(shiny::selectInput("grupo", "Grupo", choices = NULL)),
  shiny::uiOutput("conteudo")
)
```

Use o mesmo objeto de tema na aplicação inteira para evitar configurações divergentes entre páginas.

## Exemplo completo

```r
ui <- bslib::page_sidebar(
  title = "Aplicação com marca",
  theme = bslib::bs_theme(brand = TRUE),
  sidebar = bslib::sidebar(
    shiny::selectInput("dataset", "Dataset", c("mtcars", "iris"))
  ),
  shiny::tableOutput("dados")
)

server <- function(input, output, session) {
  output$dados <- shiny::renderTable({
    get(input$dataset)
  })
}

shiny::shinyApp(ui, server)
```

## Diagnóstico

- Confirme que o arquivo se chama `_brand.yml` e está no diretório esperado.
- Teste o caminho explícito com `bslib::bs_theme(brand = "caminho")`.
- Valide a sintaxe YAML e as referências da paleta.
- Confirme que fontes, pesos e logos usam nomes e caminhos válidos.
- Verifique se outro tema não está substituindo o tema com marca.
