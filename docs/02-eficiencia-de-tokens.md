# Eficiência de tokens sem perder qualidade

## Ordem de maior impacto

1. **Menos contexto sempre ativo.** Mantenha `AGENTS.md`/`CLAUDE.md` curtos e coloque procedimentos em skills.
2. **Ferramentas sob demanda.** Não conecte um MCP só porque ele existe.
3. **Busca direcionada.** Índices, `rg`, manifests, stack traces e símbolos antes de ler árvores inteiras.
4. **Artefatos persistentes.** Salve diagnóstico e plano em arquivo quando a tarefa for longa; isso reduz reexplicação após compactação.
5. **Uma fase por vez.** Diagnóstico sem implementação evita diffs descartados; execução por etapa reduz retrabalho.
6. **Saída proporcional.** Atualizações curtas, plano detalhado, entrega focada em resultados.

## Onde cada informação deve morar

| Informação | Local | Custo de contexto |
|---|---|---|
| Preferências universais e curtas | `AGENTS.md` / `CLAUDE.md` | Sempre |
| Regra para um tipo de arquivo | regra com escopo de caminho | Quando aplicável |
| Procedimento repetível | skill | Sob demanda |
| Dados externos | MCP/conector | Quando consultado |
| Descoberta daquela tarefa | plano/relatório no projeto | Relida quando necessário |
| Segredo | ambiente/gerenciador local | Nunca no prompt ou Git |

## Limites úteis

- A documentação do Claude recomenda `CLAUDE.md` com menos de 200 linhas; arquivos longos consomem contexto e pioram aderência.
- O Codex limita por padrão a soma de instruções de projeto a 32 KiB.
- Descrições de skills também têm custo. Use nomes específicos e descrições curtas, sem várias skills sobrepostas.
- Em Claude, `disable-model-invocation: true` deixa uma skill manual invisível até ser chamada e evita acionamento acidental.

## Heurística para MCP

Habilite se: a tarefa precisa de dados externos atualizados, uma ação autenticada ou uma interface não coberta nativamente. Desabilite se: duplica shell/arquivos/web, é usado raramente ou expõe dezenas de ferramentas irrelevantes. Quando possível, limite `enabled_tools` a leitura e busca e mantenha ações destrutivas sob aprovação.

