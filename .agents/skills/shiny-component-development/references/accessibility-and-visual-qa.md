# Acessibilidade e verificação visual

Por orientação do usuário, a validação visual e a inspeção manual da interface cabem a ele. O procedimento de inspeção abaixo serve como roteiro para o usuário; o agente só o executa no navegador quando solicitado explicitamente. Verificações técnicas, compilação, testes pertinentes e disponibilização do servidor continuam sob responsabilidade do agente. Não faça capturas ou inspeções de larguras e estados por iniciativa própria.

## Critérios mínimos

- Busque WCAG 2.2 nível AA para componentes públicos.
- Contraste de texto normal: pelo menos 4.5:1; texto grande: pelo menos 3:1.
- Contraste de elementos gráficos e indicadores necessários para interação: pelo menos 3:1 contra cores adjacentes.
- Toda funcionalidade deve operar por teclado sem armadilha de foco.
- O foco deve permanecer visível e não ser totalmente ocultado por conteúdo criado pelo autor.
- Não dependa apenas de cor, posição ou forma para comunicar estado.
- Alvos de ponteiro devem alcançar 24 por 24 pixels CSS ou satisfazer as exceções e o espaçamento definidos pela WCAG 2.2.

## Matriz de inspeção

Para cada componente alterado, examine somente as combinações aplicáveis:

| Dimensão | Casos |
| --- | --- |
| Largura | estreita, larga |
| Tema | designer de referência definido no AGENTS.md; tema consumidor quando a herança for afetada |
| Dados | normal, vazio, longo, inválido |
| Interação | repouso, hover, foco, ativo, desabilitado |
| Processo | carregando, sucesso, erro |

## Procedimento

1. Execute `examples/exemplo_executivo.R`, a referência única durante a padronização definida no `AGENTS.md`. Inspecione as alterações nessa mesma versão a cada rodada, sem replicar melhorias nos demais exemplos até solicitação do usuário. Um app temporário de diagnóstico não substitui o exemplo de referência.
2. Inspecione a árvore de tags e mensagens do console antes da avaliação estética.
3. Navegue somente por teclado e confirme ordem, foco, ativação e retorno de overlays.
4. Capture ou inspecione as larguras e estados materiais.
5. Verifique contraste com ferramenta, não por estimativa visual.
6. Corrija a causa no componente ou token compartilhado e repita os estados afetados.
7. Registre o que foi inspecionado e qualquer lacuna que dependa de teste manual externo.

## Entrega para validação do usuário

Para nova funcionalidade Shiny ou alteração visual, mantenha o servidor local ativo e informe a URL, o comando de execução, o arquivo de exemplo, o designer ativo e os cenários a validar. Registre os resultados automatizados e os estados e larguras já inspecionados.

Enquanto não houver confirmação visual e funcional do usuário, registre “aguardando validação do usuário”; não declare a tarefa concluída. Se a execução falhar ou o ambiente não permitir manter o servidor, informe o impedimento e as verificações pendentes. Não trate a ausência de resposta como aprovação. Na retomada, confirme que o servidor e o exemplo ainda estão disponíveis antes de continuar a validação.

Alterações exclusivamente documentais ou de instruções, sem efeito visual ou funcional Shiny, não exigem servidor nem validação visual.

Fonte normativa: https://www.w3.org/TR/WCAG22/
