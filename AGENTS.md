# Instruções do projeto

## Objetivo

Este repositório mantém um pacote R de componentes visuais e funcionais reutilizáveis para dashboards Shiny. Priorize APIs estáveis, composição entre projetos, temas configuráveis, acessibilidade e ausência de dependência no ambiente global do app consumidor.

O pacote é uma biblioteca de componentes. Não converta o repositório em uma aplicação Rhino. Considere Rhino apenas ao projetar ou validar a integração do pacote com aplicações consumidoras.

## Acordos de trabalho

- Explique as alterações propostas antes de editar arquivos ou executar ações que alterem o projeto.
- Não adicione comentários explicativos ao código. Em APIs públicas, use somente a documentação Roxygen necessária para gerar ajuda e `NAMESPACE`.
- Preserve mudanças existentes do usuário e evite alterações fora do escopo.
- Verifique primeiro se já existe função, estilo, token ou asset equivalente.
- Não quebre APIs exportadas sem solicitação explícita e estratégia de migração.
- Não codifique identidade pessoal, conteúdo de negócio, caminhos locais ou estado global como padrão de componente.
- Prefira parâmetros explícitos e padrões neutros para tornar os componentes reutilizáveis.
- Toda nova função que produza UI deve usar classes `sdp-*` e estilos em arquivos SCSS externos ao código R. É proibido introduzir `style=`, `tags$style()`, strings CSS em R ou valores visuais hardcoded no componente.
- Cores, tipografia, espaçamento, raios, sombras, movimento e camadas devem vir dos tokens centralizados `--sdp-*`. Alterações de identidade visual devem acontecer na fonte de tokens, nunca em cada componente.
- Funções R puras sem markup ou efeito visual não devem criar arquivos de estilo vazios.
- Não edite `NAMESPACE` ou arquivos `.Rd` manualmente; regenere-os com Roxygen.
- Use `pacote::funcao()` para dependências externas no código do pacote e mantenha `DESCRIPTION` coerente com o uso real.
- Não execute commit, push, publicação ou release sem solicitação explícita.

## Skills do repositório

- Use `r-package-development` ao alterar API, código R, dependências, documentação, testes, metadados ou CI do pacote.
- Use `shiny-component-development` ao criar ou alterar UI, módulos, reatividade, assets ou integração com aplicações Shiny/Rhino.
- Use `shiny-component-development` ao criar, revisar ou validar UI, layout, tema, responsividade, acessibilidade, estados, módulos, assets ou integração com aplicações Shiny/Rhino.
- Para qualquer função que produza UI, use `shiny-component-development`, mesmo quando a tarefa também ativar `r-package-development`.
- Em tarefas que cruzem esses domínios, use somente as skills necessárias e aplique primeiro as decisões de arquitetura do pacote, depois as de componente e por fim as de apresentação.

## Verificação

Valide em proporção ao risco. Para mudanças públicas, execute documentação, testes e `R CMD check` quando o ambiente permitir. Para mudanças visuais, complemente os testes automatizados com inspeção renderizada nos estados e larguras relevantes. Informe claramente o que foi executado, o que falhou e o que não pôde ser verificado.
