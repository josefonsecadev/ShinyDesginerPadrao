---
name: shiny-component-development
description: Criar, refatorar e testar helpers de UI e módulos Shiny reutilizáveis deste pacote, incluindo reatividade, bslib, assets, Sass e integração Rhino. Não usar para lógica R pura sem UI.
---

# Componentes Shiny

Crie componentes reutilizáveis, configuráveis e independentes do estado global do app consumidor.

## Arquitetura

- Use helper de UI para markup estático e módulo para UI com reatividade ou estado.
- Módulos seguem `<nome>UI(id, ...)` e `<nome>Server(id, ...)`, com `NS(id)` e `moduleServer()`.
- Extraia regras de negócio para funções R puras.
- Parametrize conteúdo, ações, dados, ícones, assets e tema; preserve a API pública.

## Estilos obrigatórios

- Toda nova UI usa classes `sdp-*`, partial SCSS externo e tokens `--sdp-*`.
- Não use `style=`, `tags$style()`, blocos `<style>`, strings CSS em R ou valores visuais literais no componente.
- Importe o partial no entrypoint Sass, compile o CSS em `inst/www/css/` e carregue uma dependência HTML deduplicável.
- Respeite o `bs_theme()` do consumidor e evite recursos remotos obrigatórios.
- Antes de criar ou alterar visualmente uma UI, leia [o contrato de CSS e tokens](references/design-system-css.md).

## UI/UX e acessibilidade

- Defina tarefa principal, hierarquia, navegação e estados antes do acabamento visual.
- Considere estados inicial, carregando, vazio, sucesso, erro, desabilitado e selecionado quando aplicáveis.
- Priorize semântica HTML, operação por teclado, foco visível, contraste e mensagens de erro recuperáveis.
- Reuse componentes e tokens existentes; evite cards sem função, ícones ambíguos e animação decorativa.
- Para mudanças visuais materiais, leia [a referência de acessibilidade e QA](references/accessibility-and-visual-qa.md) e inspecione larguras, estados e conteúdo longo.

## Verificação

- Teste classes, atributos, dependências e ausência de estilo inline.
- Use `shiny::testServer()` para módulos e navegador apenas quando necessário.
- Para Rhino ou `box::use()`, leia [a referência de integração](references/rhino-integration.md).

Referência principal: https://shiny.posit.co/r/articles/improve/modules
