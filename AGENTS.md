# Instruções do projeto

## Objetivo

Este repositório mantém um pacote R de componentes visuais e funcionais reutilizáveis para dashboards Shiny. Priorize APIs estáveis, composição entre projetos, temas configuráveis, acessibilidade e ausência de dependência em objetos de negócio no ambiente global do app consumidor.

O pacote é uma biblioteca de componentes. Não converta o repositório em uma aplicação Rhino. Considere Rhino apenas ao projetar ou validar a integração do pacote com aplicações consumidoras.

## Acordos de trabalho

- Explique as alterações propostas antes de editar arquivos ou executar ações que alterem o projeto.
- Não adicione comentários explicativos ao código. Em APIs públicas, use somente a documentação Roxygen necessária para gerar ajuda e `NAMESPACE`.
- Preserve mudanças existentes do usuário e evite alterações fora do escopo.
- Verifique primeiro se já existe função, estilo, token ou asset equivalente.
- Não quebre APIs exportadas sem solicitação explícita e estratégia de migração.
- Não codifique identidade pessoal, conteúdo de negócio ou caminhos locais como padrão de componente. Componentes não devem alterar implicitamente estado global. A configuração explícita pelo consumidor com `sdp_use_designer()` é suportada; preserve essa API e a herança do tema bslib.
- Prefira parâmetros explícitos e padrões neutros para tornar os componentes reutilizáveis.
- Toda nova função que produza UI deve usar classes `sdp-*` e reutilizar ou definir estilos SCSS externos ao código R. É proibido introduzir `style=`, `tags$style()`, strings CSS em R ou valores visuais hardcoded no markup próprio do pacote. Saídas internas de dependências e literais estruturais seguem o contrato de CSS da skill de componentes.
- Cores, tipografia, espaçamento, raios, sombras, movimento e camadas dos componentes devem vir dos tokens centralizados `--sdp-*`. A divisão entre presets bslib, fundamentos Sass e tokens semânticos está definida no contrato de CSS; altere a fonte correspondente, nunca replique a identidade em componentes.
- Funções R puras sem markup ou efeito visual não devem criar arquivos de estilo vazios.
- Não edite `NAMESPACE` ou arquivos `.Rd` manualmente; regenere-os com Roxygen.
- Use `pacote::funcao()` para dependências externas no código do pacote e mantenha `DESCRIPTION` coerente com o uso real.
- Após aprovação explícita de uma tarefa pelo usuário e cumprimento dos critérios de aceite, execute o commit e o push dessa tarefa conforme `TASKS.md`; essa aprovação é a autorização para ambas as ações, sem nova confirmação. Fora desse fluxo, não execute commit ou push sem solicitação explícita. Publicação e release continuam exigindo solicitação específica.

## Skills do repositório

Carregue somente as skills aplicáveis à tarefa. As regras específicas deste projeto prevalecem sobre exemplos e recomendações genéricas das skills, respeitando as instruções do usuário.

| Tarefa | Skill |
| --- | --- |
| Alterar API, código R, dependências, documentação, testes, metadados ou CI | `r-package-development` |
| Criar, revisar ou validar UI, layout, tema, reatividade, acessibilidade, assets ou integração Shiny/Rhino | `shiny-component-development`, inclusive para toda função que produza UI |
| Criar, organizar ou revisar testes de comportamento | `testing-r-packages` |
| Deprecar, renomear ou substituir API pública | `lifecycle` |
| Compor layouts ou usar recursos específicos do bslib | `shiny-bslib` |
| Criar ou reformular uma direção visual | `frontend-design`, respeitando os presets existentes |
| Criar ou integrar identidade via `_brand.yml` | `brand-yml` |
| Fazer revisão crítica de código ou PR | `critical-code-reviewer` |

Em tarefas que cruzem domínios, aplique primeiro as decisões de arquitetura do pacote, depois as de componente e por fim as de apresentação. Consulte os detalhes e referências nas respectivas skills, sem carregar todas por padrão.

## Exemplos e temas

Durante a padronização atual, trabalhe somente no designer `executivo` e em `examples/exemplo_executivo.R`. Faça e valide as melhorias diretamente no Shiny, uma por vez; Figma não é requisito nem fonte obrigatória nesta fase. Não desenvolva variações nem replique cada ajuste nos outros exemplos até o usuário aprovar a base e solicitar essa expansão. Preserve os temas, exemplos e APIs existentes por compatibilidade. O procedimento de implementação e validação pertence à skill `shiny-component-development`.

## Tarefas

### Economia de contexto e tokens

- Trate ajustes pequenos do usuário como revisões da task em andamento, sem criar outra task para cada cor, medida ou espaçamento.
- Reutilize instruções, caminhos e resultados já conhecidos na conversa. Não releia arquivos ou skills sem necessidade; consulte apenas os trechos afetados ou quando houver indício de mudança.
- Para ajustes visuais pontuais, faça a edição, compile o Sass uma vez após a rodada e confira o diff dos arquivos afetados. Não execute a suíte completa, documentação ou check do pacote por uma simples mudança de token sem alteração de API ou comportamento. Amplie a verificação quando o risco ou uma falha justificar.
- Não faça inspeção visual nem abra o navegador sem solicitação. Verifique o servidor apenas quando precisar iniciá-lo, reiniciá-lo ou confirmar sua disponibilidade para entrega.
- Atualize os detalhes e a análise de cumprimento em `TASKS.md` na entrega da task para aprovação, após uma rodada de ajustes ou quando houver mudança de escopo ou impedimento. Não acumule relatos repetidos de cada microajuste; consolide o resultado atual e preserve aprovações e evidências relevantes.
- Use uma atualização breve antes de editar e uma entrega curta com resultado, verificações relevantes e link local quando aplicável. Não repita planos, listas de regras ou resultados inalterados.
- Economia de tokens não dispensa testes necessários, critérios de aceite, aprovação do usuário ou o fluxo de commit e push autorizado.

Use `TASKS.md` como registro de tarefas, critérios de aceite, andamento e validação. Cadastrar uma tarefa não autoriza iniciá-la automaticamente; execute conforme a solicitação do usuário e mantenha o registro atualizado. Preserve identificadores e histórico. Planeje tarefas de baixo esforço estimado em tokens e contexto; decomponha demandas maiores conforme os critérios de `TASKS.md`, incluindo a verificação no esforço previsto.

## Verificação

Para cada tarefa, registre em `TASKS.md` a análise de cumprimento por critério de aceite, as evidências obtidas e as aprovações exigidas. Não marque como concluída uma tarefa com critérios pendentes, não verificados ou sem comprovação suficiente.

Valide em proporção ao risco. Para mudanças públicas, execute documentação, testes e `R CMD check` quando o ambiente permitir. A validação visual é responsabilidade do usuário. Não faça inspeção visual no navegador, capturas de tela, comparação de imagens ou varreduras de larguras e estados por iniciativa própria; realize essas ações somente quando o usuário solicitar explicitamente. Mantenha as verificações técnicas proporcionais ao risco. Informe claramente o que foi executado, o que falhou e o que não pôde ser verificado.
- Ao inserir uma nova funcionalidade Shiny ou realizar qualquer alteração visual, como cores, tipografia, espaçamentos, layout, componentes, estados ou responsividade, execute localmente o exemplo correspondente, mantenha o servidor ativo e aguarde a validação visual e funcional do usuário antes de considerar a tarefa concluída. Testes automatizados não substituem essa validação.
- Na entrega para validação, informe URL local, comando de execução, exemplo e designer ativos, cenários verificados e pendências. Até a confirmação do usuário, registre o estado como “aguardando validação do usuário”. Se o ambiente impedir a execução, informe o impedimento e não declare a validação concluída. Alterações apenas nas instruções ou na documentação, sem efeito visual ou funcional Shiny, não exigem servidor.
