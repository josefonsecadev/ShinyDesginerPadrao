# Contrato de design tokens e CSS

Este contrato é obrigatório para toda nova função que produza UI e para alterações visuais materiais em componentes existentes. Funções R puras sem markup são isentas.

## Estrutura obrigatória

```text
inst/
|-- scss/
|   |-- settings/
|   |   |-- _fundamentos.scss
|   |   `-- _tokens.scss
|   |-- components/
|   |   `-- _<componente>.scss
|   `-- shiny-designer-padrao.scss
`-- www/
    `-- css/
        `-- shiny-designer-padrao.css
```

- `R/theme.R`, por meio de `sdp_designer_specs()` e `sdp_theme()`, define os presets enviados ao bslib: cores, fontes e demais propriedades do tema Bootstrap. Preserve a configuração explícita e a herança do tema do consumidor.
- `_fundamentos.scss` centraliza os valores brutos e escalas próprios do Sass e os fallbacks usados sem tema equivalente no Bootstrap.
- `_tokens.scss` define o contrato público `--sdp-*`, mapeia variáveis `--bs-*` e aplica decisões semânticas por designer. Componentes consomem esses tokens, sem repetir valores dos presets.
- Para propriedades compartilhadas, prefira mapear a variável Bootstrap equivalente em vez de copiar seu valor R para o Sass. Ao alterar tema ou fallback, verifique o designer de referência definido no `AGENTS.md` e, quando a mudança afetar a herança do tema, um tema do consumidor. Preserve a compatibilidade dos demais presets sem exigir sua evolução visual nesta fase. Migrações da estrutura atual exigem escopo próprio; não refatore valores legados incidentalmente.
- Cada função de UI com estilo próprio usa um partial em `components/`. Funções que apenas compõem componentes existentes reutilizam os partials existentes.
- `shiny-designer-padrao.scss` é o único entrypoint e usa módulos Sass com `@use`/`@forward`; não use `@import`.
- `shiny-designer-padrao.css` é gerado. Não o edite manualmente.
- O CSS compilado é servido localmente pelo pacote e anexado por uma dependência HTML central. Não use CDN para o CSS do pacote.

## Nomenclatura

Use português sem acentos, minúsculas e kebab-case.

Propriedades CSS seguem:

```text
--sdp-{categoria}-{papel}-{variante}-{estado}
```

Variáveis Sass usam o mesmo vocabulário com `$sdp-`. Classes usam BEM com prefixo do pacote:

```text
sdp-componente
sdp-componente__elemento
sdp-componente--modificador
sdp-componente__elemento--modificador
```

Não use IDs para estilização. Não use nomes baseados na aparência, como `.texto-azul`, quando o nome pode expressar função, como `.sdp-alerta__mensagem`.

## Tokens fundamentais

Novos valores brutos próprios do Sass e escalas pertencem a `_fundamentos.scss`. Valores dos presets bslib pertencem a `R/theme.R`; não os duplique nos componentes ou nos tokens quando houver variável Bootstrap equivalente.

```scss
$sdp-cor-azul-700: #123456;
$sdp-espaco-1: 0.25rem;
$sdp-espaco-2: 0.5rem;
$sdp-raio-2: 0.5rem;
$sdp-duracao-rapida: 150ms;
```

Use escalas previsíveis:

- Cores: `{familia}-{100..900}`.
- Espaço: `espaco-{0..8}`.
- Raio: `raio-{0..4}`.
- Sombra: `sombra-{0..3}`.
- Duração: `duracao-instantanea`, `duracao-rapida`, `duracao-normal`, `duracao-lenta`.
- Camada: `camada-base`, `camada-dropdown`, `camada-sticky`, `camada-modal`, `camada-toast`.

Não exponha nomes de paleta, como `azul-700`, diretamente nos componentes. Eles podem mudar quando a marca mudar.

## Tokens semânticos públicos

Defina em `_tokens.scss` propriedades que descrevem intenção e apontam para os fundamentos:

```scss
:root {
  --sdp-cor-acao-principal: var(--bs-primary, #{$sdp-cor-azul-700});
  --sdp-cor-acao-secundaria: var(--bs-secondary, #{$sdp-cor-cinza-700});
  --sdp-cor-superficie-pagina: var(--bs-body-bg, #{$sdp-cor-cinza-050});
  --sdp-cor-superficie-elevada: var(--bs-tertiary-bg, #{$sdp-cor-branco});
  --sdp-cor-texto-principal: var(--bs-body-color, #{$sdp-cor-cinza-900});
  --sdp-cor-texto-secundario: #{$sdp-cor-cinza-700};
  --sdp-cor-borda-padrao: var(--bs-border-color, #{$sdp-cor-cinza-300});
  --sdp-cor-estado-sucesso: #{$sdp-cor-verde-700};
  --sdp-cor-estado-alerta: #{$sdp-cor-amarelo-700};
  --sdp-cor-estado-erro: #{$sdp-cor-vermelho-700};
  --sdp-tipografia-familia-base: var(--bs-body-font-family, #{$sdp-fonte-familia-base});
  --sdp-tipografia-tamanho-base: var(--bs-body-font-size, #{$sdp-fonte-tamanho-base});
  --sdp-tipografia-tamanho-titulo-1: #{$sdp-fonte-tamanho-7};
  --sdp-tipografia-peso-titulo: #{$sdp-fonte-peso-700};
  --sdp-tipografia-altura-linha-base: #{$sdp-fonte-altura-linha-base};
  --sdp-espaco-1: #{$sdp-espaco-1};
  --sdp-espaco-2: #{$sdp-espaco-2};
  --sdp-raio-2: #{$sdp-raio-2};
  --sdp-sombra-1: #{$sdp-sombra-1};
}
```

Priorize variáveis `--bs-*` quando houver equivalência semântica para que `bslib::bs_theme()` continue controlando o visual. O fundamento `sdp` funciona como fallback e como fonte para decisões sem equivalente no Bootstrap.

Use `tipografia-tamanho-titulo-1`, não `header-1`: o token descreve a função tipográfica e não depende de uma tag HTML. Use `espaco-1`, `espaco-2` e assim por diante, não `espacamento-simples`: uma escala ordenada é mensurável e composável.

Quando um componente precisar de configuração própria, crie aliases locais na classe base:

```scss
.sdp-navbar {
  --sdp-navbar-cor-fundo: var(--sdp-cor-superficie-elevada);
  --sdp-navbar-espaco-interno: var(--sdp-espaco-2);
  background: var(--sdp-navbar-cor-fundo);
  padding: var(--sdp-navbar-espaco-interno);
}
```

Isso permite customizar uma instância sem alterar os tokens globais.

## Valores permitidos no componente

Valores visuais devem vir de tokens. Literais estruturais como `0`, `100%`, `auto`, `inherit`, `currentColor`, `none`, unidades de grid e cálculos dependentes do conteúdo podem permanecer quando não representam uma decisão de design reutilizável.

Breakpoints permanecem como variáveis Sass centralizadas porque não podem ser usados diretamente em media queries por propriedades CSS.

## Markup de dependências

A proibição de estilos inline se aplica ao código e ao markup introduzidos pelo pacote. Dependências podem produzir atributos `style` necessários ao layout ou à interação; não remova esses atributos nem reimplemente a dependência apenas para satisfazer um teste. Identifique sua origem e teste o contrato do componente. Essa exceção não autoriza inserir CSS próprio em R ou passar valores visuais literais à dependência para contornar os tokens.

## Checklist obrigatório

Antes de concluir uma nova UI:

1. Crie ou reutilize o partial do componente.
2. Importe o partial no entrypoint.
3. Use classes `sdp-*` no R e BEM no SCSS.
4. Remova `style=`, `tags$style()`, blocos `<style>` e strings CSS do R alterado.
5. Substitua valores visuais literais do componente por tokens.
6. Recompile o CSS distribuído sem editar o arquivo gerado manualmente.
7. Anexe a dependência CSS central e teste sua deduplicação.
8. Teste as classes públicas e a ausência de estilo inline introduzido pelo pacote, distinguindo o markup interno das dependências.
9. Disponibilize o componente renderizado para validação do usuário nos temas e larguras aplicáveis. Faça inspeção visual própria somente mediante solicitação explícita.

Referências:

- https://sass-lang.com/documentation/at-rules/use/
- https://getbootstrap.com/docs/5.3/customize/css-variables/
- https://rstudio.github.io/bslib/articles/theming/
- https://www.designtokens.org/tr/2025.10/format/
