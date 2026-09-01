# ShinyDesginerPadrao (development version)

* `navbar()` permite descricoes contextuais em itens de submenu, com hierarquia
  visual de titulo e descricao nos cinco exemplos de designer.
* `sdp_theme()` passa a aplicar direções visuais distintas no navbar, com
  variações de paleta, contraste, tipografia, densidade, raios e sombras.
* `sdp_theme()` oferece cinco presets de designer para dashboards e `navbar()`
  aceita a seleção direta pelo argumento `designer`.
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
