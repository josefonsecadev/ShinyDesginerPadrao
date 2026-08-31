# Integração com Rhino

Use estas regras para aplicações consumidoras. Este repositório continua sendo um pacote R e não deve receber a estrutura de uma aplicação Rhino.

## Limite arquitetural

- O pacote fornece componentes, módulos, temas e assets.
- A aplicação Rhino controla entrypoint, configuração, `renv`, módulos `box`, logging, build de assets e implantação.
- Não faça o pacote depender de Rhino apenas para permitir seu consumo por um app Rhino.

## Uso no consumidor

- Importe a API pública instalada do pacote pelo mecanismo adotado pela aplicação, inclusive `box::use()` quando essa for a convenção Rhino.
- Mantenha código independente de Shiny na camada `logic` do app consumidor.
- Componha helpers e módulos do pacote na camada `view`.
- Preserve o namespace em todos os níveis: o app define o ID da instância e o componente encapsula seus IDs internos.
- Não use `devtools::load_all()` no fluxo de produção do consumidor.

## Sass e tema

- O pacote deve expor componentes compatíveis com um `bs_theme()` fornecido pelo consumidor.
- O app Rhino pode combinar seus estilos em `app/styles/main.scss` ou em uma camada Sass de `bslib`; não duplique tokens do pacote sem uma razão de produto.
- Se pacote e app distribuírem CSS, defina responsabilidades e ordem de carregamento para evitar seletores globais concorrentes.

## Verificação

- Mantenha um exemplo mínimo que instale ou carregue o pacote como um consumidor real.
- Valide duas instâncias do mesmo módulo na mesma página para detectar falhas de namespace.
- Valide integração com o tema e com o pipeline de assets do app, sem transformar o exemplo em teste de toda a aplicação Rhino.

Referências oficiais:

- https://appsilon.github.io/rhino/articles/explanation/application-structure.html
- https://appsilon.github.io/rhino/articles/how-to/use-bslib.html
- https://appsilon.github.io/rhino/articles/how-to/use-shinytest2.html
