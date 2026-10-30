# ShinyDesginerPadrao

Biblioteca R de componentes visuais e funcionais reutilizáveis para dashboards
Shiny.

## Designers

O designer da aplicação deve ser definido uma única vez, durante a criação da
UI:

```r
ShinyDesginerPadrao::sdp_use_designer("executivo")

ui <- ShinyDesginerPadrao::navbar(
  title = "Meu dashboard",
  menu_items = menu_items
)
```

Depois dessa definição, os componentes do pacote e os componentes bslib devem
herdar o designer global. Não passe `theme` ou `designer` repetidamente para
cada componente.

Os designers disponíveis são `executivo`, `analitico`, `editorial`, `produto` e
`operacoes`. Use `sdp_designers()` para consultar as características de cada
padrão.

## Versão de referência em padronização

Nesta fase, o desenvolvimento visual se concentra somente no designer
`executivo`, demonstrado em `examples/exemplo_executivo.R`.

As melhorias são feitas diretamente no Shiny, uma por vez, e avaliadas pelo
usuário na mesma versão até a aprovação do padrão. O foco inicial é o
esqueleto da página: cabeçalho, navegação e submenus, fundo, tipografia,
espaçamentos e rodapé. Figma não é necessário para esse fluxo.

Novos componentes e ajustes devem ser demonstrados no exemplo executivo.
Não crie exemplos individuais por componente nem desenvolva variações de
cor ou tema durante essa padronização.

Os demais presets e exemplos existentes são preservados por compatibilidade,
mas sua evolução visual fica suspensa. A expansão para outras versões depende
da aprovação da base e de solicitação do usuário.

Itens de submenu podem receber uma descriÃ§Ã£o curta para reforÃ§ar a hierarquia
da navegaÃ§Ã£o:

```r
menu_items <- list(
  contexto = list(
    label = "Contexto",
    items = list(
      panorama = list(
        label = "Panorama",
        description = "VisÃ£o geral do perÃ­odo",
        ui = shiny::h2("Panorama")
      )
    )
  )
)
```

`description` Ã© opcional e Ã© exibida somente nos itens de submenu. Itens sem
descriÃ§Ã£o continuam usando o formato compacto anterior.

## Desenvolvimento

```r
devtools::load_all()
devtools::test()
devtools::document()
```
