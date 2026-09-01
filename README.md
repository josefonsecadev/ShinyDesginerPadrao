# ShinyDesginerPadrao

Biblioteca R de componentes visuais e funcionais reutilizáveis para dashboards
Shiny.

## Designers

O designer da aplicação deve ser definido uma única vez, durante a criação da
UI:

```r
ShinyDesginerPadrao::sdp_use_designer("analitico")

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

## Regra obrigatória para exemplos

A pasta `examples/` deve conter somente cinco arquivos de exemplo, um para cada
designer:

- `exemplo_executivo.R`
- `exemplo_analitico.R`
- `exemplo_editorial.R`
- `exemplo_produto.R`
- `exemplo_operacoes.R`

Cada arquivo deve ser uma aplicação Shiny completa e conter todas as
funcionalidades existentes no pacote. Quando um novo componente for criado,
como um gráfico, card, tabela ou módulo, ele deve ser incluído nos cinco
arquivos de exemplo, permitindo comparar o mesmo conjunto de funcionalidades
entre os designers.

Não crie um arquivo de exemplo separado para um componente individual. A
organização por designer é obrigatória e deve ser preservada durante a
evolução do pacote.

## Regra obrigatória para novos componentes

Todo componente novo deve possuir cinco versões visuais, uma para cada
designer: `executivo`, `analitico`, `editorial`, `produto` e `operacoes`.

As cinco versões devem respeitar os padrões já definidos para cada tema,
incluindo:

- cores de fundo, texto, ação e estados;
- família, peso, tamanho e escala tipográfica;
- espaçamentos e densidade de informação;
- formato, raio, bordas e sombras;
- estados de interação, foco, erro, sucesso e desabilitado.

Por exemplo, um novo card deve ter cinco apresentações coerentes: um card
executivo, um analítico, um editorial, um de produto e um de operações. A
função pública pode manter a mesma API, mas a implementação visual deve usar
os tokens do designer ativo para produzir a variação correspondente.

Cada novo componente também deve ser incluído nos cinco arquivos de exemplo,
para que as cinco versões sejam demonstradas e verificadas em conjunto.

## Desenvolvimento

```r
devtools::load_all()
devtools::test()
devtools::document()
```
