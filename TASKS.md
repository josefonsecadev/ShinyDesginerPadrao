# Tarefas do projeto

## Fluxo de trabalho

- Siga o fluxo de economia de tokens do `AGENTS.md`: consolide microajustes na tarefa atual e registre o resultado da rodada na entrega para aprovação, sem repetir histórico ou verificações inalteradas.
- Cadastre tarefas pela conversa ou por este arquivo. O cadastro não inicia a execução; execute quando o usuário solicitar uma tarefa ou uma sequência.
- Use identificadores sequenciais e estáveis: `TASK-001`, `TASK-002` e assim por diante. Não reutilize números de tarefas canceladas.
- Trabalhe no designer `executivo` e em `examples/exemplo_executivo.R` até nova orientação do usuário.
- Registre o resultado esperado e critérios observáveis de aceite. Use referências e detalhes fornecidos pelo usuário; não invente requisitos pendentes.
- Classifique cada tarefa pelo objetivo principal e adicione categorias secundárias somente quando necessárias. A classificação não altera a prioridade nem o estado. Quando o usuário não indicar a categoria, determine-a pelo resultado esperado.
- Cadastre tarefas executáveis de baixo esforço, conforme a estimativa de tokens e contexto abaixo. Divida demandas maiores antes de iniciar a execução.
- Execute uma tarefa por vez, na ordem solicitada. Registre dependências e impedimentos quando existirem.
- Antes de editar o projeto, explique a alteração proposta. Ao terminar a implementação, registre os arquivos afetados, verificações executadas e pendências.
- Para mudanças visuais ou funcionalidades Shiny, execute o exemplo, mantenha o servidor ativo e registre a URL para avaliação. A tarefa só fica concluída após a validação visual e funcional do usuário.
- Preserve o histórico das tarefas concluídas e canceladas neste arquivo.

## Classificação por objetivo

| Categoria | Quando usar | Exemplo |
| --- | --- | --- |
| Design | Definir ou reformular a aparência e a experiência visual. | Redesenhar o cabeçalho ou escolher a hierarquia tipográfica. |
| CSS | Implementar ou corrigir estilos e responsividade com direção visual já definida. | Ajustar espaçamento, alinhamento, cor de hover ou largura no celular. |
| UI / Componentes | Criar ou alterar a estrutura da interface e seus controles. | Adicionar rodapé, campo, botão ou submenu. |
| Lógica | Alterar regras, cálculos, transformações ou validações de dados. | Validar parâmetros ou calcular um indicador. |
| Reatividade / Interação | Alterar eventos, estado e respostas a ações do usuário. | Manter um dropdown aberto ou atualizar um painel ao selecionar uma opção. |
| Testes / Qualidade | Verificar comportamento, acessibilidade ou corrigir cobertura de testes. | Testar navegação por teclado ou isolamento de módulos. |
| Documentação | Alterar ajuda, exemplos explicativos ou instruções de trabalho. | Documentar uma API ou atualizar o fluxo de tasks. |
| Infraestrutura | Alterar dependências, build, assets ou automação do pacote. | Corrigir a compilação Sass ou configurar CI. |

Use a categoria que descreve o resultado principal, não apenas o arquivo alterado. Uma reformulação visual implementada em SCSS é `Design`, com `CSS` como categoria secundária. Um ajuste de espaçamento já especificado é `CSS`. Uma correção de bug deve ser classificada pela área afetada; descreva o defeito no objetivo da tarefa.

## Esforço em tokens e contexto

Estime o esforço total da tarefa: leitura de instruções e código, raciocínio, implementação, documentação, verificações e eventuais ajustes. A estimativa é aproximada, não uma medição nem um limite garantido; linhas alteradas e tempo de execução não substituem essa avaliação.

- Use como referência inicial de baixo esforço uma faixa de até aproximadamente 8 mil tokens totais de trabalho, com contexto localizado e um único resultado verificável. Registre uma faixa estimada, como `3–6 mil tokens`, e a confiança (`baixa`, `média` ou `alta`). Essa referência pode ser recalibrada com o usuário.
- Quando a estimativa superar essa referência, exigir muita investigação ou depender de várias decisões independentes, decomponha a demanda em tarefas menores antes da execução. Se não houver informação suficiente para estimar a implementação, crie primeiro uma tarefa curta de investigação com entrega concreta.
- Cada tarefa resultante deve ter objetivo, critérios de aceite e dependências próprios. Preserve a referência à demanda de origem; não cadastre a demanda ampla como tarefa executável junto com suas partes, duplicando trabalho.
- Divida por comportamento ou resultado que possa ser revisado, sem separar artificialmente uma correção dos testes indispensáveis para comprová-la. Inclua no esforço a validação exigida pelo projeto.
- Se uma tarefa crescer durante a execução, registre o que já foi realizado e desmembre o restante em novas tarefas. Não declare uma entrega incompleta como concluída nem amplie silenciosamente seu escopo.
- Estimativas não autorizam interromper uma execução solicitada ao atingir determinado número de tokens. Elas orientam o planejamento e a divisão do trabalho; não substituem os critérios de aceite.

## Verificação de aceite e evidências

A validação visual cabe ao usuário. O agente não abre navegador para inspeção visual, captura imagens nem percorre larguras e estados por iniciativa própria; só realiza essas verificações quando solicitado explicitamente. Os planos de inspeção visual das tasks existentes passam a ser roteiros para o usuário. Preserve as evidências já obtidas e mantenha pendentes os critérios ainda não aprovados. O agente continua executando verificações técnicas necessárias e disponibilizando o exemplo local para avaliação.

Toda tarefa exige uma análise de cumprimento: compare o pedido com o resultado e registre evidências. Alterar arquivos ou iniciar um comando não comprova conclusão.

No cadastro, identifique critérios observáveis (`CA-01`, `CA-02` etc.) e planeje como verificar cada um. Escolha métodos proporcionais ao risco; nem toda tarefa precisa de um novo teste automatizado.

| Tipo de entrega | Evidência adequada |
| --- | --- |
| Lógica, API ou reatividade | Testes de comportamento ou regressão, com resultado esperado e obtido; comandos e resumo dos resultados. |
| Design, CSS ou UI | Inspeção renderizada nas larguras e estados relevantes, captura quando útil e aprovação visual e funcional do usuário no exemplo ativo. |
| Interação | Reprodução dos passos e verificação dos efeitos e estados, incluindo teclado quando aplicável; aprovação do usuário para funcionalidades Shiny. |
| Documentação ou instruções | Revisão contra o pedido, coerência com regras relacionadas e conferência das referências ou exemplos aplicáveis. |
| Infraestrutura | Execução do build, check ou fluxo afetado, com resultado e artefato quando aplicável. |

- Registre `Atendido`, `Não atendido` ou `Não verificado` para cada critério, acompanhado da evidência e de uma análise curta. Informe falhas e verificações impedidas.
- Evidências podem ser comandos e resultados resumidos, caminhos de testes ou artefatos, capturas, passos reproduzidos e confirmação explícita do usuário. Não invente resultados nem interprete silêncio como aprovação.
- Comando iniciado, teste ignorado ou inspeção apenas do código não comprovam comportamento renderizado. Aprovação visual não substitui testes necessários de lógica; testes não substituem a aprovação visual e funcional exigida pelo projeto.
- Conclua a análise com `Cumprimento comprovado`, `Aguardando validação do usuário` ou `Pendências de cumprimento`, justificando o resultado. Só marque `Concluída` quando todos os critérios estiverem atendidos com evidências suficientes e aprovações exigidas registradas.
- Se houver falha, corrija com a tarefa em execução; use `Bloqueada` para impedimento indispensável. Se faltar apenas avaliação do usuário, use `Aguardando validação` e informe o que ele deve verificar.
- Se a implementação mudar após a verificação, reavalie os critérios afetados. Reduções de escopo dependem de orientação explícita do usuário, registrada na tarefa.

## Commit e push após aprovação

A aprovação explícita do usuário para uma tarefa autoriza seu commit e push, sem solicitar nova confirmação. Cadastro, execução, testes aprovados ou silêncio do usuário não equivalem a aprovação. Registre qual tarefa foi aprovada; esclareça apenas quando o alvo da aprovação estiver ambíguo.

1. Confirme que os critérios estão atendidos e registre a aprovação e a análise de cumprimento antes do commit. Se houver pendências técnicas, resolva-as e revalide o resultado; não use a aprovação para ignorar falhas.
2. Inspecione branch, remoto, upstream, histórico a enviar e diff. Prepare um commit por tarefa com somente suas alterações e seu registro em `TASKS.md`, incluindo arquivos gerados necessários. Não inclua mudanças anteriores ou de outras tarefas por conveniência. Use seleção de trechos quando houver mudanças misturadas no mesmo arquivo.
3. Use Conventional Commits como convenção do projeto, não como requisito nativo do Git. Formato: `tipo(escopo): TASK-001 descrição do resultado`. Escolha `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `build`, `ci` ou `chore` conforme a natureza da mudança. Alteração visual funcional usa `feat` ou `fix`; reserve `style` para formatação sem mudança de comportamento.
4. No corpo do commit, informe `Task`, `Objetivo`, `Alterações` e `Validação`, com o código da tarefa, a finalidade, o que foi implementado e as evidências resumidas. Grave mensagens multilinha em arquivo temporário e use `git commit --file` para preservar seu conteúdo.
5. Faça push normal da branch de trabalho para seu upstream. Se ainda não houver upstream e o remoto do projeto estiver inequívoco, configure o rastreamento da mesma branch no remoto. Não use force push nem reescreva histórico. Se o push incluir commits alheios não autorizados, o destino for ambíguo ou houver rejeição ou falha de autenticação, preserve o trabalho e informe o impedimento antes de qualquer ação além do escopo autorizado.
6. Confira o resultado do push e informe ao usuário o código da tarefa, hash do commit e destino remoto/branch. Registre separadamente entrega técnica e entrega Git; push pendente não deve ser apresentado como enviado.

Exemplo:

```text
fix(navbar): TASK-001 manter submenu aberto durante a navegação

Task: TASK-001
Objetivo: permitir percorrer as opções sem fechar o menu.
Alterações: ajustar a área de interação e os estados das opções.
Validação: teste de comportamento e aprovação do usuário no exemplo executivo.
```

O commit inclui o registro de aprovação e aceite. O hash do próprio commit e a confirmação do push são informados na conversa, pois só existem após sua criação; atualize-os no arquivo na próxima alteração autorizada, sem criar commits extras apenas para registrar o próprio hash.

## Estados

| Estado | Significado |
| --- | --- |
| Cadastrada | Registrada, ainda não iniciada. |
| Em execução | Implementação em andamento. |
| Bloqueada | Falta uma informação ou condição indispensável, descrita na tarefa. |
| Aguardando validação | Implementação disponível para avaliação do usuário. |
| Aprovada — envio pendente | Critérios comprovados e tarefa aprovada pelo usuário; commit ou push ainda pendente. |
| Concluída | Todos os critérios atendidos, aprovação registrada e commit e push confirmados. |
| Cancelada | Cancelamento solicitado pelo usuário. |

## Quadro de tarefas

### TASK-001 — Aumentar o cabeçalho e posicionar o título acima dos menus

- Estado: Aguardando validação
- Categoria principal: UI / Componentes
- Categorias secundárias: CSS, Design
- Esforço: Baixo
- Estimativa de tokens totais: 4–7 mil tokens, incluindo leitura, implementação e validação
- Confiança da estimativa: média
- Demanda de origem: Padronização do cabeçalho, cadastrada em 30/10/2026
- Prioridade: A definir; sequência sugerida pelo número da task
- Objetivo: Dar mais altura à barra e separar verticalmente o título do dashboard das opções de navegação.
- Referência: designer `executivo`, `examples/exemplo_executivo.R`; sem dependência de Figma
- Comportamento ou aparência atual: confirmar no início da execução
- Resultado esperado: critérios abaixo
- Dependências: Nenhuma.
- Resultado e arquivos alterados: implementação aplicada em inst/scss/components/_navbar.scss, inst/scss/settings/_fundamentos.scss, inst/scss/settings/_tokens.scss, inst/www/css/shiny-designer-padrao.css e NEWS.md
- Verificações e pendências: Sass compilado, JavaScript validado com `node --check` e suíte `devtools::test()` com 58 expectativas aprovadas, sem falhas, warnings ou skips. Inspeção móvel, percurso de hover, teclado/Esc e aprovação visual do usuário pendentes; a conexão do navegador foi perdida durante a inspeção.
- URL de avaliação: http://127.0.0.1:3877/ — servidor R ativo, exemplo executivo. Execução: Rscript -e "pkgload::load_all('.'); shiny::runApp('examples/exemplo_executivo.R', host = '127.0.0.1', port = 3877, launch.browser = FALSE)"
- Validação do usuário: pendente
- Aprovação da task: pendente
- Entrega Git: pendente de implementação, aceite e aprovação explícita
- Commit e destino: pendente

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — O título aparece em uma linha acima das opções de menu, dentro do cabeçalho. | Inspecionar o exemplo executivo em largura ampla e estreita. | Inspeção renderizada em 2215 px: título em y=24, altura=56; menus em y=88; barra com 152 px. Largura estreita ainda pendente. | Não verificado |
| CA-02 — A altura e os espaçamentos acomodam as duas linhas sem sobreposição ou cortes; o menu continua utilizável em tela estreita. | Verificar conteúdo longo e navegação responsiva; submeter proporções à aprovação do usuário. | Pendente | Não verificado |

- Conclusão: Aguardando validação do usuário. A implementação está disponível; não há autorização de commit/push até aprovação explícita.


### TASK-002 — Destacar o texto dos menus selecionados e sob o mouse

- Estado: Aguardando validação
- Categoria principal: CSS
- Categorias secundárias: Design
- Esforço: Baixo
- Estimativa de tokens totais: 3–6 mil tokens, incluindo leitura, implementação e validação
- Confiança da estimativa: média
- Demanda de origem: Padronização do cabeçalho, cadastrada em 30/10/2026
- Prioridade: A definir; sequência sugerida pelo número da task
- Objetivo: Aplicar destaque discreto pela cor do texto às opções da navegação principal selecionadas ou sob o mouse.
- Referência: designer `executivo`, `examples/exemplo_executivo.R`; sem dependência de Figma
- Comportamento ou aparência atual: confirmar no início da execução
- Resultado esperado: critérios abaixo
- Dependências: TASK-001, para validar sobre a estrutura do cabeçalho definida.
- Resultado e arquivos alterados: implementação aplicada em tokens de destaque e regras de seleção no SCSS, CSS compilado e NEWS.md
- Verificações e pendências: Sass compilado, JavaScript validado com `node --check` e suíte `devtools::test()` com 58 expectativas aprovadas, sem falhas, warnings ou skips. Inspeção móvel, percurso de hover, teclado/Esc e aprovação visual do usuário pendentes; a conexão do navegador foi perdida durante a inspeção.
- URL de avaliação: http://127.0.0.1:3877/ — servidor R ativo, exemplo executivo. Execução: Rscript -e "pkgload::load_all('.'); shiny::runApp('examples/exemplo_executivo.R', host = '127.0.0.1', port = 3877, launch.browser = FALSE)"
- Validação do usuário: pendente
- Aprovação da task: pendente
- Entrega Git: pendente de implementação, aceite e aprovação explícita
- Commit e destino: pendente

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — A opção selecionada tem cor de texto distinta das opções em repouso e mantém o destaque após a seleção. | Selecionar opções distintas e verificar o estado ativo renderizado. | Cor calculada no navegador: opção ativa rgb(255,207,64), distinta das opções inativas. Aprovação visual pendente. | Atendido |
| CA-02 — Passar o mouse altera a cor do nome; sair restaura a cor adequada ao estado ativo ou inativo. | Percorrer opções ativas e inativas e inspecionar entrada e saída do ponteiro. | Pendente | Não verificado |
| CA-03 — O foco por teclado permanece visível e o destaque é leve e legível, conforme aprovação do usuário. | Navegar por teclado, verificar contraste e solicitar avaliação visual. | Pendente | Não verificado |

- Conclusão: Aguardando validação do usuário. A implementação está disponível; não há autorização de commit/push até aprovação explícita.


- Ajuste solicitado durante a execução: amarelo mais escuro no texto ativo e sob o mouse. Revisão mais recente: amarelo #e5b52c sobre azul aprofundado (mistura de 65% da cor primária com a cor de texto). Evidências anteriores de cor referem-se à versão precedente; validar novamente pelo usuário. Sass recompilado, sem inspeção visual do agente.

### TASK-003 — Aplicar destaque de seleção e hover às opções dos submenus

- Estado: Aguardando validação
- Categoria principal: CSS
- Categorias secundárias: Reatividade / Interação
- Esforço: Baixo
- Estimativa de tokens totais: 4–7 mil tokens, incluindo leitura, implementação e validação
- Confiança da estimativa: média
- Demanda de origem: Padronização do cabeçalho, cadastrada em 30/10/2026
- Prioridade: A definir; sequência sugerida pelo número da task
- Objetivo: Estender aos submenus o destaque discreto pela cor do nome, mantendo as opções acessíveis ao percorrer o dropdown.
- Referência: designer `executivo`, `examples/exemplo_executivo.R`; sem dependência de Figma
- Comportamento ou aparência atual: confirmar no início da execução
- Resultado esperado: critérios abaixo
- Dependências: TASK-002, para reutilizar a regra de destaque aprovada.
- Resultado e arquivos alterados: implementação aplicada em tokens e regras de submenu, inst/www/js/shiny-designer-padrao.js, CSS compilado e NEWS.md
- Verificações e pendências: Sass compilado, JavaScript validado com `node --check` e suíte `devtools::test()` com 58 expectativas aprovadas, sem falhas, warnings ou skips. Inspeção móvel, percurso de hover, teclado/Esc e aprovação visual do usuário pendentes; a conexão do navegador foi perdida durante a inspeção.
- URL de avaliação: http://127.0.0.1:3877/ — servidor R ativo, exemplo executivo. Execução: Rscript -e "pkgload::load_all('.'); shiny::runApp('examples/exemplo_executivo.R', host = '127.0.0.1', port = 3877, launch.browser = FALSE)"
- Validação do usuário: pendente
- Aprovação da task: pendente
- Entrega Git: pendente de implementação, aceite e aprovação explícita
- Commit e destino: pendente

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — A opção selecionada do submenu mantém a cor de destaque quando o dropdown é reaberto. | Selecionar uma subopção, reabrir o menu e verificar o estado ativo. | Evidência anterior invalidada pelo ajuste de cor. CSS recompilado; validação visual do usuário pendente. | Não verificado |
| CA-02 — Cada subopção muda a cor do nome individualmente ao receber o mouse e restaura seu estado ao perdê-lo. | Percorrer todas as subopções, incluindo a selecionada. | Pendente | Não verificado |
| CA-03 — O submenu permanece aberto ao mover o ponteiro do acionador para suas opções, permitindo selecioná-las; o teclado continua funcional. | Reproduzir o percurso do ponteiro e seleção, verificar teclado e fechamento com Esc e solicitar aprovação funcional. | Pendente | Não verificado |

- Conclusão: Aguardando validação do usuário. A implementação está disponível; não há autorização de commit/push até aprovação explícita.


- Ajuste solicitado durante a execução: amarelo mais escuro; revisão mais recente usa âmbar #714900 sobre a superfície clara. Evidências anteriores de cor referem-se à versão precedente; validar novamente pelo usuário. Sass recompilado, sem inspeção visual do agente.

- Correção após avaliação do usuário: o âmbar foi percebido como marrom. O nome selecionado, em foco ou sob o mouse agora reutiliza o amarelo da barra; essas opções recebem fundo azul para contraste, com descrição clara. Compilação Sass e diff verificados; sem inspeção visual do agente.

### TASK-004 — Diferenciar visualmente a caixa do submenu da barra

- Estado: Aguardando validação
- Categoria principal: Design
- Categorias secundárias: CSS
- Esforço: Baixo
- Estimativa de tokens totais: 3–6 mil tokens, incluindo leitura, implementação e validação
- Confiança da estimativa: média
- Demanda de origem: Padronização do cabeçalho, cadastrada em 30/10/2026
- Prioridade: A definir; sequência sugerida pelo número da task
- Objetivo: Aplicar uma superfície suave à caixa do dropdown, deixando nítida sua separação da barra.
- Referência: designer `executivo`, `examples/exemplo_executivo.R`; sem dependência de Figma
- Comportamento ou aparência atual: confirmar no início da execução
- Resultado esperado: critérios abaixo
- Dependências: TASK-003, para avaliar a superfície com os estados de submenu definidos.
- Resultado e arquivos alterados: implementação aplicada em tokens da superfície do submenu, SCSS, CSS compilado e NEWS.md
- Verificações e pendências: Sass compilado, JavaScript validado com `node --check` e suíte `devtools::test()` com 58 expectativas aprovadas, sem falhas, warnings ou skips. Inspeção móvel, percurso de hover, teclado/Esc e aprovação visual do usuário pendentes; a conexão do navegador foi perdida durante a inspeção.
- URL de avaliação: http://127.0.0.1:3877/ — servidor R ativo, exemplo executivo. Execução: Rscript -e "pkgload::load_all('.'); shiny::runApp('examples/exemplo_executivo.R', host = '127.0.0.1', port = 3877, launch.browser = FALSE)"
- Validação do usuário: pendente
- Aprovação da task: pendente
- Entrega Git: pendente de implementação, aceite e aprovação explícita
- Commit e destino: pendente

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — A caixa do submenu é claramente distinguível da barra por uma cor de fundo suavizada e separação visual discreta. | Inspecionar dropdown aberto sobre a barra e o fundo da página; obter aprovação visual. | Navegador confirmou caixa clara color(srgb 0.915451 0.94 0.985176), distinta da barra azul. Aprovação do usuário pendente. | Não verificado |
| CA-02 — Nomes e descrições permanecem nítidos e legíveis em repouso, hover, foco e seleção. | Inspecionar estados, verificar contraste e confirmar que o efeito não desfoca o texto. | Pendente | Não verificado |
| CA-03 — A aparência não prejudica a passagem do mouse nem a seleção das opções. | Repetir navegação e seleção por mouse e teclado no exemplo executivo. | Pendente | Não verificado |

- Interpretação a validar: “desfoque na cor” significa inicialmente suavizar ou diferenciar o fundo da caixa, sem desfocar letras. Um efeito real de blur não foi definido e depende de esclarecimento antes de sua implementação.

- Conclusão: Aguardando validação do usuário. A implementação está disponível; não há autorização de commit/push até aprovação explícita.


### TASK-005 — Remover ícones do menu executivo e aproximar as setas dos submenus

- Estado: Concluída
- Categoria principal: CSS
- Categorias secundárias: Design
- Esforço: Baixo
- Estimativa de tokens totais: 3–6 mil tokens, incluindo leitura, implementação e validação
- Confiança da estimativa: média
- Demanda de origem: Ajuste do menu solicitado em 30/10/2026
- Prioridade: sequência solicitada
- Objetivo: Simplificar os itens do menu executivo removendo seus ícones e reduzir o espaço entre o nome de cada grupo e sua seta.
- Referência: designer `executivo`, `examples/exemplo_executivo.R`
- Resultado esperado: exemplo sem ícones nos itens principais e seta visualmente próxima ao nome do grupo com submenu.
- Dependências: nenhuma.
- Resultado e arquivos alterados: ícones removidos da configuração do exemplo; acionador executivo usa espaçamento zero entre rótulo e seta, remove a margem do caret e desloca a seta 4 px para baixo, conforme o último ajuste solicitado.
- Verificações e pendências: CSS recompilado pelo Sass Dart via `npm exec --yes --package=sass`; regra gerada conferida e `git diff --check` sem erros. Servidor ativo e respondendo HTTP 200. Aprovação visual recebida após o ajuste de 4 px.
- URL de avaliação: http://127.0.0.1:3878/ — servidor R ativo, exemplo executivo atualizado. Execução: `Rscript -e "pkgload::load_all('.'); shiny::runApp('examples/exemplo_executivo.R', host = '127.0.0.1', port = 3878, launch.browser = FALSE)`
- Validação do usuário: aprovado em 30/10/2026
- Aprovação da task: explícita em 30/10/2026
- Entrega Git: commit criado e push confirmado
- Commit e destino: `93452fd` em `origin/master`

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — O exemplo executivo não exibe ícones nos itens principais do menu. | Conferir configuração e validar o exemplo renderizado. | Campos `icon` removidos de Visão geral, Desempenho e Relatórios; HTML servido contém os rótulos e o caret sem ícones. | Atendido |
| CA-02 — A seta do grupo com submenu aparece próxima do nome e centralizada na altura do texto. | Validar visualmente o acionador de submenu no exemplo ativo. | DOM servido mostra caret como elemento `<b class="caret">`; regra executiva remove lacuna flexível e margem e aplica deslocamento vertical de `--sdp-espaco-1`; usuário aprovou a posição visual após o ajuste. | Atendido |

- Conclusão: Cumprimento comprovado; critérios técnicos e validação visual do usuário atendidos.


### TASK-006 — Padronizar UTF-8 e corrigir a exibição de “José”

- Estado: Concluída
- Categoria principal: Infraestrutura
- Categorias secundárias: Qualidade
- Esforço: Baixo
- Estimativa de tokens totais: 4–8 mil tokens, incluindo diagnóstico, implementação e verificação
- Confiança da estimativa: média
- Demanda de origem: Solicitação de padronização de encoding em 30/10/2026
- Prioridade: sequência sugerida pelo número da task
- Objetivo: Tornar explícito o uso de UTF-8 nos arquivos de texto do projeto e eliminar a exibição de “José” como `Jos<U+00E9>`.
- Referência: repositório ShinyDesginerPadrao e ambiente R/Windows
- Comportamento ou aparência atual: `DESCRIPTION` já declara `Encoding: UTF-8`; verificação inicial encontrou 68 arquivos de texto válidos em UTF-8. O escape reportado ainda não foi reproduzido nem localizado.
- Resultado esperado: editores e ferramentas do projeto preservam UTF-8, e o nome “José” é exibido corretamente nas saídas afetadas.
- Dependências: nenhuma.
- Resultado e arquivos alterados: configuração `.editorconfig` criada para orientar a gravação UTF-8 dos arquivos de texto e metadados; `.Rprofile` remove o locale POSIX `C.UTF-8` inválido herdado pelo R no Windows e reaplica o locale do sistema.
- Verificações e pendências: revalidação em R 4.6.1 confirmou `UTF8=TRUE`, locale `Portuguese_Brazil.utf8` e saída `José`; varredura estrita de 72 arquivos sem inválidos. Avisos iniciais do `C.UTF-8` externo aparecem antes de `.Rprofile`.
- URL de avaliação: não aplicável até a execução
- Validação do usuário: aprovado em 30/10/2026
- Aprovação da task: explícita em 30/10/2026
- Entrega Git: implementação incluída em commit agregado; aceite desta task em registro
- Commit e destino: `171f5a2` em `origin/master`

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — A política do repositório instrui editores a salvar arquivos de texto em UTF-8. | Revisar a configuração compartilhada de encoding e conferir que não conflita com arquivos binários ou o fluxo R. | `.editorconfig` declara UTF-8 para fontes, documentos e metadados; `DESCRIPTION` também declara `Encoding: UTF-8`. | Atendido |
| CA-02 — Os arquivos de texto do projeto podem ser decodificados como UTF-8 sem perda. | Fazer varredura estrita dos arquivos de texto incluídos no escopo e registrar exceções. | Varredura estrita de 72 arquivos de texto: nenhum inválido em UTF-8. | Atendido |
| CA-03 — “José” aparece corretamente, sem escape `<U+00E9>`, no contexto que apresenta o problema. | Reproduzir a saída no R/Windows e no app aplicável, corrigir a origem e repetir a reprodução. | Com R 4.6.1 no Windows, após `.Rprofile`, `l10n_info()[["UTF-8"]]` é `TRUE` e a saída é `José`; o usuário aprovou a correção no contexto afetado. Avisos iniciais do locale externo ainda aparecem antes do perfil. | Atendido |

- Conclusão: Cumprimento comprovado; varredura UTF-8, saída corrigida no R/Windows e aprovação do usuário registradas.


### TASK-007 — Posicionar “Sobre mim” no topo e incluir curva de dados no cabeçalho executivo

- Estado: Concluída
- Categoria principal: Design
- Categorias secundárias: UI / Componentes, CSS
- Esforço: Baixo
- Estimativa de tokens totais: 4–7 mil tokens, incluindo implementação e validação
- Confiança da estimativa: média
- Demanda de origem: Refinamento do cabeçalho solicitado em 30/10/2026
- Prioridade: sequência sugerida pelo número da task
- Objetivo: Posicionar “Sobre mim” na faixa superior do cabeçalho, acima do alternador Light/Dark, e acrescentar uma curva senoidal discreta que remeta a dados.
- Referência: designer `executivo`, `examples/exemplo_executivo.R`; sem dependência de Figma
- Resultado esperado: botão de contato junto ao título na faixa superior; motivo de dados sutil nessa faixa, derivado do tema e sem competir com os menus.
- Dependências: nenhuma; refinamento solicitado diretamente para a base executiva.
- Resultado e arquivos alterados: `R/navbar.R` move o contato para a faixa superior em markup separado do link da marca; curva senoidal com pontos usa token executivo; CSS compilado e NEWS atualizada.
- Verificações e pendências: exemplo responde HTTP 200; HTML coloca contato e curva antes de `navbar-collapse`, preserva `id="abrir_contato"` e não deixa espaçador vazio na linha dos menus. Usuário aprovou a composição visual.
- URL de avaliação: http://127.0.0.1:3878/ — servidor R ativo, designer executivo. Execução: `Rscript -e "pkgload::load_all('.'); shiny::runApp('examples/exemplo_executivo.R', host = '127.0.0.1', port = 3878, launch.browser = FALSE)`
- Validação do usuário: aprovado em 30/10/2026
- Aprovação da task: explícita em 30/10/2026
- Entrega Git: commit criado e push confirmado
- Commit e destino: `237e084` enviado para `origin/master`

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — “Sobre mim” fica na faixa superior acima dos menus, separado do futuro alternador Light/Dark, e continua acionando o contato. | Verificar posição e acionar o controle no exemplo executivo. | O HTML mantém o botão na faixa superior, antes de `navbar-collapse`, com `id="abrir_contato"`; usuário aprovou a posição. | Atendido |
| CA-02 — O cabeçalho apresenta uma curva senoidal de dados discreta, coerente com o tema e sem prejudicar a leitura. | Avaliar visualmente a hierarquia, contraste e larguras desktop e móvel no exemplo ativo. | SVG decorativo `aria-hidden`; SCSS deriva sua cor do tema e usa token para a linha; usuário aprovou a composição visual. | Atendido |

- Conclusão: Cumprimento comprovado; HTML, tema e aprovação visual do usuário registrados.


### TASK-008 — Manter o cabeçalho executivo fixo durante a rolagem

- Estado: Em aberto
- Categoria principal: Reatividade / Interação
- Categorias secundárias: CSS
- Esforço: Baixo
- Estimativa de tokens totais: 3–5 mil tokens, incluindo reprodução e validação
- Confiança da estimativa: média
- Demanda de origem: Comportamento do cabeçalho solicitado em 30/10/2026
- Prioridade: sequência sugerida pelo número da task
- Objetivo: Garantir que o cabeçalho permaneça visível no topo enquanto a página é rolada.
- Referência: designer `executivo`, `examples/exemplo_executivo.R`
- Comportamento ou aparência atual: o SCSS já declara `position: sticky`, `top: 0` e camada sticky; a resposta do exemplo foi confirmada, mas a rolagem renderizada depende da validação do usuário.
- Resultado esperado: cabeçalho aderido ao topo durante a rolagem, sem cobrir o conteúdo nem impedir menus e controles.
- Dependências: TASK-005 e TASK-007, para validar o comportamento sobre a composição atualizada do cabeçalho.
- Resultado e arquivos alterados: nenhuma alteração de implementação necessária; regra sticky existente em `inst/scss/components/_navbar.scss` e no CSS compilado.
- Verificações e pendências: servidor do exemplo executivo respondia HTTP 200; validação de rolagem, conteúdo, menus e controles por teclado adiada até haver mais corpo no site.
- URL de avaliação: http://127.0.0.1:3878/ — servidor R ativo, designer executivo. Execução: `Rscript -e "pkgload::load_all('.'); shiny::runApp('examples/exemplo_executivo.R', host = '127.0.0.1', port = 3878, launch.browser = FALSE)"`
- Validação do usuário: pendente
- Aprovação da task: pendente
- Entrega Git: pendente de validação e aprovação explícita
- Commit e destino: pendente

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — O cabeçalho permanece no topo durante a rolagem da página. | Rolar o exemplo executivo do início ao conteúdo inferior e observar o cabeçalho. | SCSS declara `position: sticky; top: 0`; comportamento renderizado aguarda conteúdo suficiente e validação do usuário. | Em aberto |
| CA-02 — O cabeçalho não encobre o conteúdo nem bloqueia os menus e o botão de contato. | Verificar posição inicial, rolagem, navegação por menu e foco por teclado. | Comportamento visual e funcional aguarda conteúdo suficiente e validação do usuário. | Em aberto |

- Conclusão: Em aberto; validação adiada até que o site tenha corpo suficiente para avaliar rolagem.


### TASK-009 — Criar um rodapé discreto no fim real da página executiva

- Estado: Concluída
- Categoria principal: UI / Componentes
- Categorias secundárias: Design, CSS
- Esforço: Baixo
- Estimativa de tokens totais: 4–7 mil tokens, incluindo implementação e validação
- Confiança da estimativa: média
- Demanda de origem: Rodapé solicitado em 30/10/2026
- Prioridade: sequência sugerida pelo número da task
- Objetivo: Criar uma faixa de rodapé mais fina que o cabeçalho, inicialmente vazia, com a mesma cor de fundo do cabeçalho e posicionada após todo o conteúdo.
- Referência: designer `executivo`, `examples/exemplo_executivo.R`
- Resultado esperado: rodapé visualmente simples, sem conteúdo inicial, que só apareça ao chegar ao fim do conteúdo e não fique preso à janela.
- Dependências: TASK-007 e TASK-008, para manter coerência com o cabeçalho e sua rolagem.
- Resultado e arquivos alterados: `R/footer.R` contém o helper independente do rodapé e `R/navbar.R` apenas o compõe no fim da página executiva; `inst/scss/components/_footer.scss` define altura menor que o cabeçalho e fundo via tokens e é importado no entrypoint Sass; CSS compilado atualizado.
- Verificações e pendências: `git diff --check` passou; CSS compilado; servidor responde HTTP 200; HTML coloca o rodapé após o último painel e antes do fechamento do `body`; regra CSS não define `fixed` nem `sticky`. Usuário aprovou o resultado em 30/10/2026.
- URL de avaliação: http://127.0.0.1:3878/ — servidor R ativo, designer executivo. Execução: `Rscript -e "pkgload::load_all('.'); shiny::runApp('examples/exemplo_executivo.R', host = '127.0.0.1', port = 3878, launch.browser = FALSE)"`
- Validação do usuário: aprovado em 30/10/2026
- Aprovação da task: explícita em 30/10/2026
- Entrega Git: commit criado e push confirmado
- Commit e destino: `8b1cfed` enviado para `origin/master`

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — O rodapé é mais fino que o cabeçalho, começa vazio e usa a mesma cor de fundo. | Conferir dimensões, conteúdo inicial e tokens de superfície no exemplo executivo. | Markup vazio; SCSS usa `--sdp-espaco-3` e o token de fundo do navbar executivo; usuário aprovou. | Atendido |
| CA-02 — O rodapé aparece apenas depois do conteúdo da página e não acompanha a janela. | Rolar o exemplo do topo ao fim e verificar a posição do rodapé em relação ao conteúdo e viewport. | HTML coloca o rodapé depois do último painel e antes de `</body>`; CSS não define `fixed` ou `sticky`; usuário aprovou. | Atendido |

- Conclusão: Cumprimento comprovado; estrutura, tokens, resposta HTTP e aprovação do usuário registrados.


### TASK-010 — Aplicar famílias tipográficas por função no designer executivo

- Estado: Concluída
- Categoria principal: Design
- Categorias secundárias: CSS
- Esforço: Baixo
- Estimativa de tokens totais: 4–7 mil tokens, incluindo aplicação e validação
- Confiança da estimativa: média
- Demanda de origem: Padronização tipográfica solicitada em 30/10/2026
- Prioridade: sequência sugerida pelo número da task
- Objetivo: Aplicar famílias distintas a títulos, navegação e textos da página executiva, mantendo uma família monoespaçada para conteúdo que exija esse papel.
- Referência: designer `executivo`, `examples/exemplo_executivo.R`; stacks fornecidas pelo usuário
- Resultado esperado: `--sdp-tipografia-familia-base` usa `"IBM Plex Sans", "Segoe UI", system-ui, sans-serif`; títulos usam `"Space Grotesk", "Segoe UI", system-ui, sans-serif`; o token monoespaçado usa `"IBM Plex Mono", ui-monospace, "Cascadia Mono", monospace`. Fallbacks locais permanecem disponíveis sem exigir fontes remotas.
- Dependências: TASK-005, para aplicar a direção tipográfica sobre a base executiva em validação.
- Resultado e arquivos alterados: `R/theme.R` aplica as stacks solicitadas apenas ao preset executivo; `_fundamentos.scss` e `_tokens.scss` acrescentam o token monoespaçado centralizado; CSS compilado e NEWS atualizados.
- Verificações e pendências: Sass compilado; `sdp_designers()` e o tema bslib mostram IBM Plex Sans, Space Grotesk e IBM Plex Mono com os fallbacks; regra dos menus usa o token base, marca e títulos usam o token de títulos, e o token mono aponta para `--bs-font-monospace`. Servidor responde HTTP 200. Avaliação visual da hierarquia e legibilidade pendente.
- URL de avaliação: http://127.0.0.1:3878/ — servidor R ativo, designer executivo. Execução: `Rscript -e "pkgload::load_all('.'); shiny::runApp('examples/exemplo_executivo.R', host = '127.0.0.1', port = 3878, launch.browser = FALSE)"`
- Validação do usuário: aprovado em 30/10/2026
- Aprovação da task: explícita em 30/10/2026
- Entrega Git: commit criado e push confirmado
- Commit e destino: `8b1cfed` enviado para `origin/master`

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — O corpo da página, os menus e os submenus usam a família IBM Plex Sans com os fallbacks indicados. | Conferir os tokens calculados e validar hierarquia e legibilidade no exemplo executivo. | Tema executivo reporta a stack solicitada e os seletores de menu usam o token base; usuário aprovou. | Atendido |
| CA-02 — Títulos usam Space Grotesk com os fallbacks indicados. | Conferir o token de títulos e validar a aplicação nos títulos do cabeçalho e do conteúdo. | Tema executivo reporta a stack solicitada; marca e títulos consomem o token de títulos; usuário aprovou. | Atendido |
| CA-03 — Conteúdo monoespaçado usa IBM Plex Mono com os fallbacks indicados quando esse papel existir. | Verificar o token e os elementos que tenham função monoespaçada, sem aplicar a família ao texto comum. | Tema bslib define a stack de código e `--sdp-tipografia-familia-mono` referencia `--bs-font-monospace` com a stack de fallback solicitada; usuário aprovou. | Atendido |

- Conclusão: Cumprimento comprovado; stacks do tema, tokens e aprovação do usuário registrados.


### TASK-011 — Adicionar alternância entre os modos claro e escuro

- Estado: Concluída
- Categoria principal: UI / Componentes
- Categorias secundárias: Design, Reatividade / Interação
- Esforço: Baixo
- Estimativa de tokens totais: 5–8 mil tokens, incluindo implementação e validação
- Confiança da estimativa: média
- Demanda de origem: Alternância de tema solicitada em 30/10/2026
- Prioridade: sequência sugerida pelo número da task
- Objetivo: Adicionar um controle para alternar entre os modos claro e escuro no designer executivo.
- Referência: designer `executivo`, `examples/exemplo_executivo.R`; o modo claro atual é a referência visual.
- Resultado esperado: o modo claro mantém a aparência atual e é selecionado inicialmente; o modo escuro adapta superfícies, textos, estados e componentes ao sistema de tokens do pacote e considera a paleta de referência `--fem-ink: #101D39`, `--fem-navy: #1B4D9B` e `--fem-navy-deep: #0A1B3D`, preservando contraste legível. Um único botão compacto mostra o ícone de sol com `Light` ou a lua com `Dark`, de acordo com o modo atual, e alterna ao clique; fica à direita na linha dos menus, abaixo de “Sobre mim”.
- Dependências: TASK-005 e TASK-007, para basear a alternância no cabeçalho executivo validado.
- Resultado e arquivos alterados: `navbar()` adiciona um alternador executivo compacto; `R/theme-toggle.R` contém os ícones SVG fornecidos; `inst/scss/components/_theme-toggle.scss` estiliza o controle e `inst/scss/settings/_tokens.scss` centraliza as cores dark; JavaScript aplica o modo apenas à página executiva.
- Verificações e pendências: Sass compilado, JavaScript validado com `node --check`, `git diff --check` aprovado e página, JavaScript e CSS responderam HTTP 200. A marcação contém um único botão compacto (fonte a 87,5% do tamanho base); CSS exibe somente ícone correspondente ao modo e o clique alterna modo, rótulo e ícone. Validação visual e interação aprovadas pelo usuário.
- URL de avaliação: http://127.0.0.1:3878/ — servidor R ativo, designer executivo. Execução: `Rscript -e "pkgload::load_all('.'); shiny::runApp('examples/exemplo_executivo.R', host = '127.0.0.1', port = 3878, launch.browser = FALSE)"`
- Validação do usuário: aprovado em 30/10/2026
- Aprovação da task: explícita em 30/10/2026
- Entrega Git: commit criado e push confirmado
- Commit e destino: `1219b1b` enviado para `origin/master`

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — Um botão acessível exibe `Light` com sol ou `Dark` com lua, um por vez, e alterna ao clique ou teclado. | Conferir ícone e rótulo em cada modo, estado selecionado e operação por mouse e teclado. | Um botão nativo, compacto, com rótulo e ícone alternados; CSS oculta o ícone do estado inativo. HTTP 200 e JavaScript validados; interação e aparência aprovadas pelo usuário. | Atendido |
| CA-02 — O modo claro inicial preserva a aparência atual do designer executivo. | Comparar os componentes principais com a base aprovada no exemplo executivo. | Estado inicial Light preservado no markup e aparência aprovada pelo usuário. | Atendido |
| CA-03 — O modo escuro aplica a paleta de referência `--fem-ink: #101D39`, `--fem-navy: #1B4D9B` e `--fem-navy-deep: #0A1B3D` às superfícies e estados apropriados de navbar, menus, submenus e conteúdo, mantendo texto e estados legíveis. | Mapear as cores para tokens semânticos e verificar superfícies, textos, foco, hover, seleção e contraste no exemplo executivo. | Tokens aplicam as três cores; contraste calculado entre 6.37:1 e 16.22:1 nas combinações principais; resultado aprovado pelo usuário. | Atendido |
| CA-04 — As duas paletas usam tokens centralizados e não alteram implicitamente o tema global do app consumidor. | Revisar a origem dos estilos e conferir o tema bslib do consumidor durante a alternância. | Cores estão em tokens Sass; JavaScript altera `data-sdp-color-mode` e `data-bs-theme` no `.bslib-page-navbar`, sem modificar o tema global; implementação aprovada. | Atendido |

- Conclusão: Cumprimento comprovado; critérios técnicos e validação visual do usuário atendidos.


### TASK-012 — Adicionar informações configuráveis ao rodapé executivo

- Estado: Concluída
- Categoria principal: UI / Componentes
- Categorias secundárias: Design, CSS, Documentação
- Esforço: Baixo
- Estimativa de tokens totais: 4–7 mil tokens, incluindo implementação e validação
- Confiança da estimativa: média
- Demanda de origem: Conteúdo do rodapé solicitado em 30/10/2026
- Prioridade: sequência após a TASK-009 e a TASK-010
- Objetivo: Exibir informações de propriedade à esquerda e áreas de atuação à direita no rodapé do exemplo executivo.
- Referência: designer `executivo`, `examples/exemplo_executivo.R`; configurar o conteúdo explicitamente para preservar o padrão vazio de componentes reutilizáveis.
- Resultado esperado: bloco esquerdo `® 2026 José Fonseca. Todos os direitos reservados. Propriedade intelectual integral de José Ferreira.`; bloco direito `Ciência de Dados . Engenharia de Dados . R . Python`; ambos usam a família `"IBM Plex Mono", ui-monospace, "Cascadia Mono", monospace`, alinhados nas extremidades do rodapé e com adaptação para telas estreitas.
- Dependências: TASK-009, para preencher o rodapé implementado; TASK-010, para reutilizar o token monoespaçado centralizado.
- Resultado e arquivos alterados: `navbar()` aceita `footer_left` e `footer_right`; o exemplo executivo configura os dois textos. `R/footer.R` renderiza os blocos sem estilo inline e mantém o rodapé vazio acessível como oculto; `inst/scss/components/_footer.scss` aplica o token monoespaçado e layout responsivo; documentação Roxygen, `man/navbar.Rd`, CSS e NEWS atualizados.
- Verificações e pendências: Sass compilado; `devtools::document()` concluído; conferência do HTML confirmou textos UTF-8 exatos, ordem esquerda-direita, padrão vazio e ausência de estilos inline no footer. Página e CSS responderam HTTP 200 e as regras de fonte e quebra responsiva foram encontradas no CSS servido. Validação visual pendente.
- URL de avaliação: http://127.0.0.1:3878/ — servidor R ativo, designer executivo. Execução: `Rscript -e "pkgload::load_all('.'); shiny::runApp('examples/exemplo_executivo.R', host = '127.0.0.1', port = 3878, launch.browser = FALSE)"`
- Validação do usuário: aprovado em 30/10/2026
- Aprovação da task: explícita em 30/10/2026
- Entrega Git: commit criado e push confirmado
- Commit e destino: `08fa6af` enviado para `origin/master`

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — O bloco esquerdo mostra integralmente o texto de propriedade solicitado, com `®` e acentuação correta. | Conferir o HTML renderizado e avaliar a legibilidade no rodapé executivo. | HTTP 200 e HTML contêm exatamente o texto configurado em UTF-8; legibilidade visual aprovada pelo usuário. | Atendido |
| CA-02 — O bloco direito mostra `Ciência de Dados . Engenharia de Dados . R . Python` e fica alinhado à direita. | Conferir o HTML e o alinhamento no exemplo executivo em larguras larga e estreita. | Texto exato presente no HTML; desktop usa `space-between` e alinhamento à direita, regra responsiva empilha e alinha à esquerda; aparência aprovada pelo usuário. | Atendido |
| CA-03 — Os blocos usam IBM Plex Mono com os fallbacks indicados por meio do token monoespaçado do pacote. | Conferir o token aplicado e verificar a quebra do conteúdo sem sobreposição em telas estreitas. | CSS servido aponta para `--sdp-tipografia-familia-mono`; o token usa o `code_font` do preset executivo com IBM Plex Mono e fallbacks. Regra de quebra responsiva presente; implementação aprovada pelo usuário. | Atendido |
| CA-04 — O conteúdo pessoal é configurado explicitamente no exemplo e não vira padrão de `navbar()` nem de outros consumidores. | Revisar defaults da API e a configuração do exemplo executivo. | `footer_left` e `footer_right` têm padrão `NULL`; textos são passados apenas pelo exemplo. Smoke check confirmou rodapé padrão vazio, oculto para tecnologias assistivas e sem estilo inline próprio. | Atendido |

- Conclusão: Cumprimento comprovado; conteúdo, ordem, tipografia, comportamento responsivo e validação visual do usuário atendidos.


### TASK-013 — Aplicar gradiente ao título do dashboard executivo

- Estado: Concluída
- Categoria principal: Design
- Categorias secundárias: CSS
- Esforço: Baixo
- Estimativa de tokens totais: 3–5 mil tokens, incluindo aplicação e validação
- Confiança da estimativa: média
- Demanda de origem: Gradiente do título solicitado em 30/10/2026
- Prioridade: após a TASK-010, conforme sequência das tasks
- Objetivo: Aplicar ao título do dashboard no cabeçalho executivo o gradiente fornecido pelo usuário.
- Referência: designer `executivo`, `examples/exemplo_executivo.R`; título `.sdp-navbar__title`.
- Resultado esperado: gradiente `linear-gradient(110deg, rgb(27, 77, 155) 0%, rgb(63, 114, 201) 42%, rgb(244, 146, 63) 100%)` aplicado somente ao título do designer executivo, com texto legível em títulos longos e larguras estreitas.
- Dependências: TASK-010, para aplicar o gradiente junto à direção tipográfica aprovada para o título.
- Resultado e arquivos alterados: gradiente centralizado em `--sdp-navbar-titulo-gradiente` no seletor do designer executivo; título usa recorte de fundo com fallback para texto legível e permanece sólido no modo escuro. Estilos externos em `inst/scss/components/_navbar.scss` e `inst/scss/settings/_tokens.scss`.
- Verificações e pendências: Sass compilado; CSS servido contém os três pontos exatos, seletor restrito ao designer executivo, fallback escuro e quebra de linha; página e CSS responderam HTTP 200. A parada laranja tem contraste aproximado de 2.2:1 com o cabeçalho claro, abaixo de 3:1 para texto grande, e foi mantida conforme a referência fornecida. Validação visual dispensada pelo usuário em 30/10/2026.
- URL de avaliação: http://127.0.0.1:3878/ — servidor R ativo, designer executivo. Execução: `Rscript -e "pkgload::load_all('.'); shiny::runApp('examples/exemplo_executivo.R', host = '127.0.0.1', port = 3878, launch.browser = FALSE)"`
- Validação do usuário: dispensada; aprovação automática autorizada em 30/10/2026
- Aprovação da task: explícita para execução automática em 30/10/2026
- Entrega Git: commit criado e push confirmado
- Commit e destino: `004b9d9` enviado para `origin/master`
- Commit e destino: pendente

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — O título do dashboard usa exatamente o gradiente e as paradas de cor informadas. | Conferir os valores CSS do tema executivo e avaliar o gradiente no exemplo. | Token compilado contém `linear-gradient(110deg, rgb(27, 77, 155) 0%, rgb(63, 114, 201) 42%, rgb(244, 146, 63) 100%)`; valor servido confirmado e revisão visual dispensada pelo usuário. | Atendido |
| CA-02 — O título continua legível e quebra adequadamente em larguras estreitas. | Avaliar contraste, quebra e truncamento do título no exemplo executivo. | CSS preserva `overflow-wrap: anywhere`; modo escuro usa texto sólido claro e cores forçadas usam `CanvasText`. A parada laranja sobre o cabeçalho claro tem contraste aproximado de 2.2:1, abaixo de 3:1 para texto grande; ressalva registrada e referência exata mantida sob aprovação automática autorizada pelo usuário. | Atendido |
| CA-03 — O gradiente não altera títulos dos demais designers nem exige estilos inline no markup R. | Conferir o escopo do seletor e a implementação em SCSS externo. | Seletor limitado ao título do designer executivo; estilo definido em tokens e SCSS, sem alteração do markup R. | Atendido |

- Conclusão: Cumprimento técnico comprovado e aprovado automaticamente pelo usuário; observação de contraste da parada laranja registrada.


### TASK-014 — Refinar espaçamento do menu e sombra do contato

- Estado: Concluída
- Categoria principal: Design
- Categorias secundárias: UI / Componentes, CSS
- Esforço: Baixo
- Estimativa de tokens totais: 3–5 mil tokens, incluindo aplicação e validação
- Confiança da estimativa: média
- Demanda de origem: Ajustes do menu solicitados em 30/10/2026
- Prioridade: sequência após as tasks em andamento
- Objetivo: Aumentar o espaço entre os itens do menu executivo e remover a sombra exibida ao clicar em “Sobre mim”.
- Referência: designer `executivo`, `examples/exemplo_executivo.R`.
- Resultado esperado: distância entre itens do menu aumentada em 15% em relação ao valor atual; clique em “Sobre mim” sem sombra decorativa, mantendo o indicador de foco por teclado.
- Dependências: TASK-005 e TASK-007, que estabelecem a composição atual do menu e do contato.
- Resultado e arquivos alterados: token executivo `--sdp-navbar-espaco-entre-itens` aumenta a lacuna atual em 15%; botão de contato remove sombra no foco via mouse e mantém contorno via teclado em `inst/scss/components/_navbar.scss`.
- Verificações e pendências: Sass compilado, `git diff --check` aprovado e página/CSS responderam HTTP 200. CSS servido usa o token `calc(var(--sdp-espaco-1) * 1.15)` no menu desktop e móvel; regra de foco de mouse remove a sombra e foco de teclado mantém contorno visível. Validação visual dispensada pelo usuário em 30/10/2026.
- URL de avaliação: http://127.0.0.1:3878/ — servidor R ativo, designer executivo. Execução: `Rscript -e "pkgload::load_all('.'); shiny::runApp('examples/exemplo_executivo.R', host = '127.0.0.1', port = 3878, launch.browser = FALSE)"`
- Validação do usuário: dispensada; aprovação automática autorizada em 30/10/2026
- Aprovação da task: explícita para execução automática em 30/10/2026
- Entrega Git: commit e push concluídos
- Commit e destino: `5652c9b` em `origin/master`

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — O espaçamento entre itens do menu executivo é 15% maior que o atual. | Conferir o token ou cálculo aplicado e avaliar a distância no exemplo executivo. | `--sdp-navbar-espaco-entre-itens` multiplica a lacuna base por `1.15` e é usado no menu desktop e móvel; validação visual dispensada pelo usuário. | Atendido |
| CA-02 — Clicar em “Sobre mim” não mostra sombra decorativa e o foco de teclado continua visível. | Conferir hover, clique, estado ativo e foco via teclado no exemplo. | Seletor de foco não teclado zera `box-shadow`; `:focus-visible` mantém contorno via token `--sdp-cor-foco`. CSS servido confirmado e validação visual dispensada pelo usuário. | Atendido |

- Conclusão: Cumprimento técnico comprovado e aprovado automaticamente pelo usuário; validação visual dispensada.


### TASK-015 — Enriquecer o fundo decorativo do cabeçalho executivo

- Estado: Aprovada — envio pendente
- Categoria principal: Design
- Categorias secundárias: UI / Componentes, CSS, Acessibilidade
- Esforço: Baixo
- Estimativa de tokens totais: 5–8 mil tokens, incluindo desenho, implementação e validação
- Confiança da estimativa: média
- Demanda de origem: Fundo maximalista com elementos SVG trigonométricos solicitado em 30/10/2026
- Prioridade: após as TASK-013 e TASK-014
- Objetivo: Tornar o fundo do cabeçalho executivo mais maximalista com elementos SVG trigonométricos usados somente como preenchimento decorativo.
- Referência: designer `executivo`, `examples/exemplo_executivo.R`; o cabeçalho já contém uma curva de dados SVG.
- Resultado esperado: fundo visualmente mais rico, com elementos SVG decorativos de inspiração trigonométrica, sem competir com título, navegação, contato ou alternador de tema; comportamento consistente em temas claro e escuro e em telas estreitas.
- Dependências: TASK-007 para a composição atual do cabeçalho; TASK-013 para preservar a legibilidade do título.
- Resultado e arquivos alterados: `R/navbar.R` amplia o SVG decorativo executivo com ondas, laços, guias e pontos; tokens e SCSS mantêm opacidade baixa, cores por tema e decoração sem interação. CSS compilado em `inst/www/css/shiny-designer-padrao.css`; `NEWS.md` atualizado.
- Verificações e pendências: compilação Sass via `npx sass` e `git diff --check` passaram; requisições ao exemplo e ao CSS responderam HTTP 200 e o markup servido contém as camadas decorativas com `aria-hidden`. O pacote R não tem `sass` nem `pkgload` instalados, então a compilação e smoke test pelo R não estão disponíveis. Validação visual dispensada pelo usuário em 30/10/2026.
- URL de avaliação: http://127.0.0.1:3878/ — servidor R ativo, designer executivo. Execução: `Rscript -e "pkgload::load_all('.'); shiny::runApp('examples/exemplo_executivo.R', host = '127.0.0.1', port = 3878, launch.browser = FALSE)"`
- Validação do usuário: dispensada; aprovação automática autorizada em 30/10/2026
- Aprovação da task: automática conforme autorização do usuário em 30/10/2026
- Entrega Git: implementação concluída; commit/push desta tarefa em execução
- Commit e destino: pendente

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — O cabeçalho contém mais elementos SVG de inspiração trigonométrica e aparência mais maximalista, apenas como preenchimento. | Conferir as camadas decorativas SVG no markup. | Ondas secundária e de acento, laços, guias e pontos presentes no SVG do designer executivo; marcador semântico `aria-hidden="true"`. Validação visual dispensada pelo usuário. | Atendido |
| CA-02 — A decoração não encobre nem compete com título, menus, contato ou controle de tema. | Conferir o posicionamento e a opacidade no CSS. | SVG absoluto e não interativo, com as camadas em opacidade reduzida por tokens; o conteúdo da navegação permanece em camada superior. Validação visual dispensada pelo usuário. | Atendido |
| CA-03 — A decoração é semântica e interativamente neutra, com adaptação a temas e telas estreitas. | Verificar `aria-hidden`, `pointer-events`, cores via tokens e escala responsiva em modos claro e escuro. | `aria-hidden="true"`, `pointer-events: none`, cores e opacidades via tokens para claro/escuro e `preserveAspectRatio="none"`; página e CSS responderam HTTP 200. Validação visual dispensada pelo usuário. | Atendido |

- Conclusão: Critérios técnicos atendidos; validação visual dispensada e aprovação automática autorizada pelo usuário. Commit e push pendentes.


### TASK-016 — Adicionar linha divisória entre a página e o rodapé

- Estado: Cadastrada
- Categoria principal: CSS
- Categorias secundárias: Design
- Esforço: Baixo
- Estimativa de tokens totais: 2–4 mil tokens, incluindo aplicação e validação
- Confiança da estimativa: média
- Demanda de origem: Linha divisória entre página e rodapé solicitada em 30/10/2026
- Prioridade: após as TASK-013, TASK-014 e TASK-015
- Objetivo: Adicionar uma linha discreta entre o conteúdo da página executiva e o rodapé.
- Referência: designer `executivo`, `examples/exemplo_executivo.R`; rodapé criado na TASK-009 e preenchido na TASK-012.
- Resultado esperado: separação visível no limite entre conteúdo e rodapé, usando tokens de borda e mantendo o posicionamento do rodapé no fim real da página em temas claro e escuro.
- Dependências: TASK-009 e TASK-012, para a estrutura e o conteúdo do rodapé.
- Resultado e arquivos alterados: tarefa cadastrada; nenhuma implementação iniciada.
- Verificações e pendências: avaliar a linha, contraste e posição no exemplo executivo em telas largas e estreitas e nos modos claro e escuro.
- URL de avaliação: não aplicável até a execução
- Validação do usuário: pendente
- Aprovação da task: pendente
- Entrega Git: pendente de implementação, aceite e aprovação explícita
- Commit e destino: pendente

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — Uma linha discreta separa o conteúdo principal do rodapé executivo. | Conferir a borda no limite entre página e rodapé no exemplo. | A implementar e validar. | Não verificado |
| CA-02 — A linha usa tokens e permanece visível em temas claro e escuro sem alterar a posição do rodapé. | Revisar o SCSS e conferir a separação e o fim real da página em ambos os temas. | A implementar e validar. | Não verificado |

- Conclusão: Cadastrada; aguardar a execução da sequência e solicitação do usuário.


## Rodada atual de ajustes — aguardando avaliação

Solicitação do usuário: aumentar a fonte do título, aproximar o cabeçalho do fundo da página com uma linha fina e aplicar escurecimento suave ao hover dos submenus.

- TASK-001: título aumentado de 1,5 rem para 2 rem, preservando a posição acima dos menus e quebra de linha.
- TASK-002: destaque amarelo adaptado para amarelo-ocre `#896600` sobre os novos fundos claros, mantendo legibilidade.
- TASK-003: opção sob o mouse, em foco ou selecionada recebe fundo levemente escurecido por mistura de 8% da cor do texto com a superfície da caixa; descrição permanece escura e nome amarelo.
- TASK-004: cabeçalho usa fundo da página com 4% da cor do texto; removidas faixa colorida superior e sombra do cabeçalho, com separação inferior de 1 px. Caixa do submenu usa o fundo da página.
- Verificação técnica: compilação Sass e `git diff --check` executados; servidor do exemplo ativo na porta 3877. Nenhuma inspeção visual executada pelo agente nesta rodada.
- As evidências visuais anteriores de tamanho e cor são históricas e não comprovam esta revisão. Critérios visuais e de interação permanecem pendentes da avaliação do usuário; nenhuma task aprovada, commit ou push autorizado.

## Modelo de cadastro

```markdown
### TASK-001 — Título

- Estado: Cadastrada
- Categoria principal:
- Categorias secundárias: nenhuma, ou categorias aplicáveis
- Esforço: Baixo
- Estimativa de tokens totais: faixa aproximada
- Confiança da estimativa: baixa, média ou alta
- Demanda de origem: quando houver decomposição
- Prioridade: A definir
- Objetivo:
- Comportamento ou aparência atual:
- Resultado esperado:
- Critérios de aceite:
- Plano de verificação por critério:
- Referências: quando houver
- Dependências ou informações pendentes: quando houver
- Resultado e arquivos alterados: preencher durante a execução
- Verificações e pendências: preencher durante a execução
- URL de avaliação: quando aplicável
- Validação do usuário: quando aplicável
- Aprovação da task: confirmação explícita e data
- Entrega Git: pendente, commit criado ou push confirmado
- Commit e destino: informar após criação; registrar no arquivo na próxima alteração autorizada

#### Análise de cumprimento

| Critério | Verificação realizada | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — Resultado observável | A executar | Pendente | Não verificado |

- Conclusão: preencher após as verificações
- Justificativa e pendências:
```
