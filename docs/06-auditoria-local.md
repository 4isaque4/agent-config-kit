# Auditoria local sanitizada

Data: 2026-08-18. Nenhum valor de credencial foi lido para este relatório.

## Achados

| Item | Estado | Ação sugerida |
|---|---|---|
| Codex Desktop | Instalado; executável do app não inicia diretamente pelo terminal por restrição do pacote Windows | Use a interface; valide configurações pelo app |
| Codex plugins | Conjunto amplo habilitado | Manter os úteis; desligar integrações raras se aparecerem em contexto ou causarem ruído |
| Codex MCP | `node_repl` e um servidor remoto configurados; o remoto está habilitado | Revisar ferramentas expostas e usar allowlist quando suportado |
| Claude Desktop | Config existe e contém `desktop-commander` | Já atende ao objetivo de acesso ao computador; validar pela lista de ferramentas |
| Claude Code CLI | Não encontrado no `PATH` | Instalar somente se desejar fluxo CLI; depois executar `claude doctor` |
| Claude permissions | Leitura global de `.env` e caminhos específicos permitidos | Mantido por decisão do proprietário; evitar eco e versionamento |
| Node.js/npm | Disponíveis | Suficiente para MCPs baseados em `npx` |
| `uv` | Não encontrado | Instalar somente para MCPs Python que o exigirem |
| Docker | Não encontrado | Instalar somente para servidores que dependam de contêiner |

## Prioridades

1. Adotar o `AGENTS.md` curto de agente único nos projetos.
2. Usar as quatro skills do kit em vez de prompts longos repetidos.
3. Confirmar dentro do Claude Desktop que `desktop-commander` conecta e lista ferramentas.
4. Criar allowlists de ferramentas nos MCPs usados com frequência, quando o cliente suportar.
5. Só instalar Claude Code, `uv` ou Docker quando houver um caso concreto.

