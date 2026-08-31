# Acessibilidade e verificação visual

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
| Tema | claro, escuro, tema consumidor |
| Dados | normal, vazio, longo, inválido |
| Interação | repouso, hover, foco, ativo, desabilitado |
| Processo | carregando, sucesso, erro |

## Procedimento

1. Execute o exemplo ou app mínimo que isola o componente.
2. Inspecione a árvore de tags e mensagens do console antes da avaliação estética.
3. Navegue somente por teclado e confirme ordem, foco, ativação e retorno de overlays.
4. Capture ou inspecione as larguras e estados materiais.
5. Verifique contraste com ferramenta, não por estimativa visual.
6. Corrija a causa no componente ou token compartilhado e repita os estados afetados.
7. Registre o que foi inspecionado e qualquer lacuna que dependa de teste manual externo.

Fonte normativa: https://www.w3.org/TR/WCAG22/
