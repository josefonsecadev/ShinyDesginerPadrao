# ShinyDesginerPadrao (development version)

* `navbar()` inclui um rodapé vazio no fim da página executiva, com altura e
  superfície derivadas de tokens (TASK-009).
* `navbar()` aceita `footer_left` e `footer_right` para configurar o rodapé do
  designer executivo; o exemplo aplica os textos de propriedade e áreas de
  atuação com a tipografia IBM Plex Mono (TASK-012).
* `navbar()` aplica o gradiente informado ao título do designer executivo e
  preserva texto sólido de alto contraste no modo escuro (TASK-013).
* `navbar()` aumenta em 15% o espaço entre itens do menu executivo e remove a
  sombra de foco do mouse no botão “Sobre mim”, mantendo contorno de teclado
  visível (TASK-014).
* O projeto orienta a gravação de arquivos de texto em UTF-8 e corrige o locale
  POSIX incompatível herdado pelo R no Windows.
* `navbar()` oferece um controle Light/Dark no designer executivo, com paleta
  escura baseada nas cores informadas pelo usuário (TASK-011).
* `navbar()` posiciona o contato junto ao título e desenha uma curva discreta
  de dados no cabeçalho executivo (TASK-007).
* O exemplo executivo deixa os menus sem ícones e aproxima as setas dos nomes
  dos grupos de submenu (TASK-005).
* `navbar()` diferencia a superfície dos submenus no designer executivo e
  destaca os textos selecionados e sob o mouse; Esc fecha o dropdown
  (TASK-002, TASK-003 e TASK-004).
* `navbar()` organiza o cabeçalho executivo em duas linhas, com título acima
  dos menus, maior espaço vertical e quebra de títulos longos (TASK-001).
* `navbar()` permite descricoes contextuais em itens de submenu, com hierarquia
  visual de titulo e descricao nos cinco exemplos de designer.
* `sdp_theme()` passa a aplicar direções visuais distintas no navbar, com
  variações de paleta, contraste, tipografia, densidade, raios e sombras.
* `sdp_theme()` oferece cinco presets de designer para dashboards e `navbar()`
  aceita a seleção direta pelo argumento `designer`.
* `sdp_theme("executivo")` usa IBM Plex Sans no corpo e na navegação, Space
  Grotesk em títulos e IBM Plex Mono para conteúdo monoespaçado (TASK-010).
* `sdp_use_designer()` permite definir o designer uma única vez para toda a
  aplicação, com consulta por `sdp_current_designer()` e limpeza por
  `sdp_clear_designer()`.
* `navbar()` mantém os itens principais à esquerda e separa o campo “Sobre
  mim” à direita, com layout flexível e responsivo.
* `navbar()` passa a exibir o campo “Sobre mim” e abrir o modal estático de
  `telacontato()` com os dados de contato do autor.
* A pasta `examples/` passa a organizar cinco aplicações completas, uma para
  cada designer, preparadas para receber os próximos componentes do pacote.
* `navbar()` passa a oferecer uma barra de navegação reutilizável com itens,
  grupos, ícones opcionais e integração temática com bslib.
* `navbar()` passa a localizar os assets corretamente durante o desenvolvimento
  local com `devtools::load_all()`.
