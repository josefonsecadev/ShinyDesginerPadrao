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
- Entrega Git: commit e push desta task em execução
- Commit e destino: pendente

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — O exemplo executivo não exibe ícones nos itens principais do menu. | Conferir configuração e validar o exemplo renderizado. | Campos `icon` removidos de Visão geral, Desempenho e Relatórios; HTML servido contém os rótulos e o caret sem ícones. | Atendido |
| CA-02 — A seta do grupo com submenu aparece próxima do nome e centralizada na altura do texto. | Validar visualmente o acionador de submenu no exemplo ativo. | DOM servido mostra caret como elemento `<b class="caret">`; regra executiva remove lacuna flexível e margem e aplica deslocamento vertical de `--sdp-espaco-1`; usuário aprovou a posição visual após o ajuste. | Atendido |

- Conclusão: Cumprimento comprovado; critérios técnicos e validação visual do usuário atendidos.


### TASK-006 — Padronizar UTF-8 e corrigir a exibição de “José”

- Estado: Aguardando validação
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
- Verificações e pendências: `.Rprofile` confirmou locale UTF-8 e saída correta de “José”; varredura estrita sem arquivos inválidos. R ainda emite avisos antes de carregar `.Rprofile`, por causa do `C.UTF-8` externo; confirmação do usuário sobre a saída afetada pendente.
- URL de avaliação: não aplicável até a execução
- Validação do usuário: quando aplicável
- Aprovação da task: pendente
- Entrega Git: pendente de implementação, aceite e aprovação explícita
- Commit e destino: pendente

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — A política do repositório instrui editores a salvar arquivos de texto em UTF-8. | Revisar a configuração compartilhada de encoding e conferir que não conflita com arquivos binários ou o fluxo R. | `.editorconfig` declara UTF-8 para fontes, documentos e metadados; `DESCRIPTION` também declara `Encoding: UTF-8`. | Atendido |
| CA-02 — Os arquivos de texto do projeto podem ser decodificados como UTF-8 sem perda. | Fazer varredura estrita dos arquivos de texto incluídos no escopo e registrar exceções. | Varredura estrita de 72 arquivos de texto: nenhum inválido em UTF-8. | Atendido |
| CA-03 — “José” aparece corretamente, sem escape `<U+00E9>`, no contexto que apresenta o problema. | Reproduzir a saída no R/Windows e no app aplicável, corrigir a origem e repetir a reprodução. | Com R 4.6.1 no Windows, após `.Rprofile`, `l10n_info()[["UTF-8"]]` é `TRUE` e a saída é `José`; avisos iniciais do locale externo ainda aparecem antes de o perfil ser aplicado. Confirmação no contexto original pendente. | Atendido |

- Conclusão: Aguardando validação do usuário sobre a correção do escape no contexto em que ocorreu.


### TASK-007 — Alinhar “Sobre mim” ao menu e incluir curva de dados no cabeçalho executivo

- Estado: Aguardando validação
- Categoria principal: Design
- Categorias secundárias: UI / Componentes, CSS
- Esforço: Baixo
- Estimativa de tokens totais: 4–7 mil tokens, incluindo implementação e validação
- Confiança da estimativa: média
- Demanda de origem: Refinamento do cabeçalho solicitado em 30/10/2026
- Prioridade: sequência sugerida pelo número da task
- Objetivo: Alinhar “Sobre mim” à linha dos menus, no extremo direito, e acrescentar uma curva senoidal discreta que remeta a dados na faixa superior.
- Referência: designer `executivo`, `examples/exemplo_executivo.R`; sem dependência de Figma
- Resultado esperado: botão de contato na mesma linha dos menus, à direita; motivo de dados sutil na faixa superior, derivado do tema e sem competir com os menus.
- Dependências: nenhuma; refinamento solicitado diretamente para a base executiva.
- Resultado e arquivos alterados: `R/navbar.R` mantém o botão na navegação; SCSS alinha o contato à direita da linha dos menus; curva senoidal com pontos permanece na faixa superior e usa token executivo; CSS compilado e NEWS atualizada.
- Verificações e pendências: CSS compilado e `git diff --check` sem erros; exemplo atualizado responde HTTP 200; HTML coloca o contato após o espaçador da navegação e mantém a curva no cabeçalho. Interação do botão e avaliação visual desktop/móvel pendentes.
- URL de avaliação: http://127.0.0.1:3878/ — servidor R ativo, designer executivo. Execução: `Rscript -e "pkgload::load_all('.'); shiny::runApp('examples/exemplo_executivo.R', host = '127.0.0.1', port = 3878, launch.browser = FALSE)`
- Validação do usuário: pendente
- Aprovação da task: pendente
- Entrega Git: pendente de implementação, aceite e aprovação explícita
- Commit e destino: pendente

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — “Sobre mim” fica na linha dos menus, no extremo direito, e continua acionando o contato. | Verificar alinhamento e acionar o controle no exemplo executivo. | A implementar e validar. | Não verificado |
| CA-02 — O cabeçalho apresenta uma curva senoidal de dados discreta, coerente com o tema e sem prejudicar a leitura. | Avaliar visualmente a hierarquia, contraste e larguras desktop e móvel no exemplo ativo. | SVG decorativo `aria-hidden` no DOM; SCSS aplica cor derivada do tema e largura por token; avaliação visual pendente. | Não verificado |

- Conclusão: Aguardando validação visual e funcional do usuário no exemplo executivo.


### TASK-008 — Manter o cabeçalho executivo fixo durante a rolagem

- Estado: Cadastrada
- Categoria principal: Reatividade / Interação
- Categorias secundárias: CSS
- Esforço: Baixo
- Estimativa de tokens totais: 3–5 mil tokens, incluindo reprodução e validação
- Confiança da estimativa: média
- Demanda de origem: Comportamento do cabeçalho solicitado em 30/10/2026
- Prioridade: sequência sugerida pelo número da task
- Objetivo: Garantir que o cabeçalho permaneça visível no topo enquanto a página é rolada.
- Referência: designer `executivo`, `examples/exemplo_executivo.R`
- Comportamento ou aparência atual: o SCSS já declara `position: sticky` e `top: 0`; o comportamento renderizado ainda precisa ser verificado.
- Resultado esperado: cabeçalho aderido ao topo durante a rolagem, sem cobrir o conteúdo nem impedir menus e controles.
- Dependências: TASK-005 e TASK-007, para validar o comportamento sobre a composição atualizada do cabeçalho.
- Resultado e arquivos alterados: tarefa cadastrada; nenhuma implementação iniciada.
- Verificações e pendências: reproduzir rolagem no exemplo executivo e validar teclado, menus e conteúdo sob o cabeçalho.
- URL de avaliação: não aplicável até a execução
- Validação do usuário: pendente
- Aprovação da task: pendente
- Entrega Git: pendente de implementação, aceite e aprovação explícita
- Commit e destino: pendente

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — O cabeçalho permanece no topo durante a rolagem da página. | Rolar o exemplo executivo do início ao conteúdo inferior e observar o cabeçalho. | Regra `position: sticky; top: 0` existe no SCSS; efeito renderizado ainda não verificado. | Não verificado |
| CA-02 — O cabeçalho não encobre o conteúdo nem bloqueia os menus e o botão de contato. | Verificar posição inicial, rolagem, navegação por menu e foco por teclado. | A implementar e validar. | Não verificado |

- Conclusão: Cadastrada; não iniciar até solicitação do usuário.


### TASK-009 — Criar um rodapé discreto no fim real da página executiva

- Estado: Cadastrada
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
- Resultado e arquivos alterados: tarefa cadastrada; nenhuma implementação iniciada.
- Verificações e pendências: confirmar altura menor que a do cabeçalho, correspondência da superfície, ordem no documento e ausência de posicionamento fixo ou sticky.
- URL de avaliação: não aplicável até a execução
- Validação do usuário: pendente
- Aprovação da task: pendente
- Entrega Git: pendente de implementação, aceite e aprovação explícita
- Commit e destino: pendente

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — O rodapé é mais fino que o cabeçalho, começa vazio e usa a mesma cor de fundo. | Conferir dimensões, conteúdo inicial e tokens de superfície no exemplo executivo. | A implementar e validar. | Não verificado |
| CA-02 — O rodapé aparece apenas depois do conteúdo da página e não acompanha a janela. | Rolar o exemplo do topo ao fim e verificar a posição do rodapé em relação ao conteúdo e viewport. | A implementar e validar. | Não verificado |

- Conclusão: Cadastrada; não iniciar até solicitação do usuário.


### TASK-010 — Aplicar famílias tipográficas por função no designer executivo

- Estado: Cadastrada
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
- Resultado e arquivos alterados: tarefa cadastrada; nenhuma implementação iniciada.
- Verificações e pendências: conferir mapeamento de tokens para corpo, títulos, menus e submenus; validar monoespaçado em qualquer texto que o exija e avaliar hierarquia visual no exemplo executivo.
- URL de avaliação: não aplicável até a execução
- Validação do usuário: pendente
- Aprovação da task: pendente
- Entrega Git: pendente de implementação, aceite e aprovação explícita
- Commit e destino: pendente

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — O corpo da página, os menus e os submenus usam a família IBM Plex Sans com os fallbacks indicados. | Conferir os tokens calculados e validar hierarquia e legibilidade no exemplo executivo. | A implementar e validar. | Não verificado |
| CA-02 — Títulos usam Space Grotesk com os fallbacks indicados. | Conferir o token de títulos e validar a aplicação nos títulos do cabeçalho e do conteúdo. | A implementar e validar. | Não verificado |
| CA-03 — Conteúdo monoespaçado usa IBM Plex Mono com os fallbacks indicados quando esse papel existir. | Verificar o token e os elementos que tenham função monoespaçada, sem aplicar a família ao texto comum. | A implementar e validar. | Não verificado |

- Conclusão: Cadastrada; não iniciar até solicitação do usuário.


### TASK-011 — Adicionar alternância entre os modos claro e escuro

- Estado: Cadastrada
- Categoria principal: UI / Componentes
- Categorias secundárias: Design, Reatividade / Interação
- Esforço: Baixo
- Estimativa de tokens totais: 5–8 mil tokens, incluindo implementação e validação
- Confiança da estimativa: média
- Demanda de origem: Alternância de tema solicitada em 30/10/2026
- Prioridade: sequência sugerida pelo número da task
- Objetivo: Adicionar um controle para alternar entre os modos claro e escuro no designer executivo.
- Referência: designer `executivo`, `examples/exemplo_executivo.R`; o modo claro atual é a referência visual.
- Resultado esperado: o modo claro mantém a aparência atual e é selecionado inicialmente; o modo escuro usa tons pretos e adapta superfícies, textos, estados e componentes ao mesmo padrão visual e ao sistema de tokens do pacote. O controle mostra sol e rótulo `Light` para o modo claro, e lua e rótulo `Dark` para o modo escuro.
- Dependências: TASK-005 e TASK-007, para basear a alternância no cabeçalho executivo validado.
- Resultado e arquivos alterados: tarefa cadastrada; nenhuma implementação iniciada.
- Verificações e pendências: conferir alternância por interação, contraste e estados do navbar, submenus, conteúdo e contato nos dois modos; validação visual e funcional no exemplo executivo.
- URL de avaliação: não aplicável até a execução
- Validação do usuário: pendente
- Aprovação da task: pendente
- Entrega Git: pendente de implementação, aceite e aprovação explícita
- Commit e destino: pendente

#### Critérios de aceite e análise de cumprimento

| Critério / resultado esperado | Plano de verificação | Evidência e resultado | Situação |
| --- | --- | --- | --- |
| CA-01 — Um controle acessível oferece as opções `Light` com ícone de sol e `Dark` com ícone de lua. | Conferir ícones, rótulos, estado selecionado e operação por mouse e teclado. | A implementar e validar. | Não verificado |
| CA-02 — O modo claro inicial preserva a aparência atual do designer executivo. | Comparar os componentes principais com a base aprovada no exemplo executivo. | A implementar e validar. | Não verificado |
| CA-03 — O modo escuro aplica tons pretos coerentes a navbar, menus, submenus e conteúdo, mantendo texto e estados legíveis. | Verificar superfícies, textos, foco, hover, seleção e contraste no exemplo executivo. | A implementar e validar. | Não verificado |
| CA-04 — As duas paletas usam tokens centralizados e não alteram implicitamente o tema global do app consumidor. | Revisar a origem dos estilos e conferir o tema bslib do consumidor durante a alternância. | A implementar e validar. | Não verificado |

- Conclusão: Cadastrada; não iniciar até solicitação do usuário.


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
