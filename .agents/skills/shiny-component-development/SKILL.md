---
name: shiny-component-development
description: Criar, refatorar, revisar e validar componentes e módulos Shiny deste pacote, incluindo layout, tema, acessibilidade, reatividade, assets, Sass e integração Rhino. Não usar para lógica R pura sem UI.
---

# Componentes Shiny

Crie componentes reutilizáveis, configuráveis e independentes de objetos de negócio no ambiente global do app consumidor. Não altere implicitamente estado global; respeite o tema configurado explicitamente pelo consumidor, inclusive via `sdp_use_designer()`.

## Arquitetura

- Use helper de UI para markup estático e módulo para UI com reatividade ou estado.
- Módulos seguem `<nome>UI(id, ...)` e `<nome>Server(id, ...)`, com `NS(id)` e `moduleServer()`.
- Extraia regras de negócio para funções R puras.
- Parametrize conteúdo, ações, dados, ícones, assets e tema; preserve a API pública.

## Estilos obrigatórios

- Toda nova UI usa classes `sdp-*` e tokens `--sdp-*`; crie partial SCSS externo apenas para estilo próprio e reutilize os existentes em helpers de composição.
- Não introduza `style=`, `tags$style()`, blocos `<style>`, strings CSS em R ou valores visuais literais no markup próprio do pacote. A saída interna de dependências e os literais estruturais seguem o contrato de CSS.
- Importe o partial no entrypoint Sass, compile o CSS em `inst/www/css/` e carregue uma dependência HTML deduplicável.
- Respeite o `bs_theme()` do consumidor e evite recursos remotos obrigatórios.
- Antes de criar ou alterar visualmente uma UI, leia [o contrato de CSS e tokens](references/design-system-css.md).

## UI/UX e acessibilidade

- Defina tarefa principal, hierarquia, navegação e estados antes do acabamento visual.
- Considere estados inicial, carregando, vazio, sucesso, erro, desabilitado e selecionado quando aplicáveis.
- Priorize semântica HTML, operação por teclado, foco visível, contraste e mensagens de erro recuperáveis.
- Reuse componentes e tokens existentes; evite cards sem função, ícones ambíguos e animação decorativa.
- Para mudanças visuais materiais, leia [a referência de acessibilidade e QA](references/accessibility-and-visual-qa.md) e prepare os cenários de larguras, estados e conteúdo longo para avaliação do usuário. Faça inspeção visual própria apenas quando explicitamente solicitada.

## Verificação

- Use o designer e o exemplo de referência definidos no `AGENTS.md`. Durante a padronização, concentre novos componentes e ajustes em `examples/exemplo_executivo.R`, sem criar exemplos separados por componente nem desenvolver variações. Preserve os demais exemplos e APIs existentes; amplie a cobertura visual somente quando o usuário solicitar.
- Teste classes, atributos, dependências e ausência de estilo inline introduzido pelo pacote, sem congelar a implementação interna das dependências.
- Use `shiny::testServer()` para módulos; testes de reatividade não substituem inspeção renderizada em alterações visuais.
- Para nova funcionalidade Shiny ou alteração visual, siga [a referência de acessibilidade e QA](references/accessibility-and-visual-qa.md), execute o exemplo correspondente e mantenha o servidor ativo até a validação visual e funcional do usuário, conforme `AGENTS.md`.
- Para Rhino ou `box::use()`, leia [a referência de integração](references/rhino-integration.md).

Referência principal: https://shiny.posit.co/r/articles/improve/modules
