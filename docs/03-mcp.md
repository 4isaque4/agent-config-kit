# MCP: acesso com intenção

MCP padroniza três coisas: recursos, prompts e ferramentas. Um servidor local roda com os privilégios do usuário; um remoto recebe os dados enviados às suas ferramentas. O objetivo não é dar “acesso total”, mas disponibilizar a menor capacidade que resolve a tarefa.

## Para o seu cenário

### Claude Desktop

O Desktop não ganha acesso amplo ao computador sozinho. O `desktop-commander` já aparece configurado no ambiente atual e fornece esse tipo de ponte. Mantenha-o se você usa o Claude Desktop para arquivos e terminal. Confirme no cliente se as ferramentas aparecem após reiniciar completamente o aplicativo.

Config no Windows: `%APPDATA%\Claude\claude_desktop_config.json`.

### Claude Code

O CLI já possui ferramentas nativas de arquivos e shell; normalmente não precisa de um MCP de filesystem. Use MCP para GitHub, Figma, bancos, observabilidade ou sistemas internos. No Windows nativo, servidores baseados em `npx` frequentemente precisam de `cmd /c`.

Comandos de diagnóstico quando o CLI estiver instalado:

```powershell
claude doctor
claude mcp list
claude mcp get NOME
```

### Codex

Configure servidores em `~/.codex/config.toml` ou no escopo do projeto confiável. Use `enabled_tools`, `default_tools_approval_mode`, timeouts e `enabled = false` para deixar integrações raras adormecidas. O exemplo está em `templates/codex-mcp.example.toml`.

## Catálogo recomendado

| Necessidade | Melhor primeira opção | Ativação |
|---|---|---|
| Arquivos e terminal local | Ferramenta nativa; Desktop Commander só no Desktop | Base |
| Repositórios, issues e PRs | App/CLI GitHub; MCP oficial se o cliente precisar | Sob demanda |
| Pesquisa web | Busca/browser nativo | Sob demanda |
| PDFs, planilhas e documentos | Skills específicas | Sob demanda |
| Figma | Conector/MCP Figma | Apenas trabalho de design |
| Notion/Drive/Calendar | Conector oficial do serviço | Apenas quando a fonte estiver lá |
| Banco de dados | Cliente somente leitura ou usuário read-only | Por projeto |
| Browser com sessão autenticada | Controle do navegador | Apenas quando necessário |

## Checklist de instalação

1. Verifique repositório, editor e comando exato do servidor.
2. Confira runtime (`node`, `uv`, Docker) e versão.
3. Faça backup da configuração.
4. Use variáveis de ambiente ou OAuth; não grave token no repositório.
5. Restrinja diretórios, ferramentas e escopos.
6. Valide JSON/TOML.
7. Rode o comando manualmente para separar erro de runtime de erro do cliente.
8. Reinicie o cliente e confirme a lista de ferramentas.
9. Faça uma chamada inofensiva de leitura.
10. Documente remoção e rollback.

## Diagnóstico rápido

- Falha ao iniciar: JSON/TOML, caminho, `cmd /c`, runtime ou pacote.
- Inicia e encerra: rode o comando manualmente e leia o primeiro erro real.
- Lista ferramentas, mas recebe 401/403: autenticação ou escopo.
- Funciona, mas custa contexto demais: limite ferramentas ou desabilite o servidor fora do perfil.
- Resultado enorme: filtre na própria ferramenta, pagine e peça somente campos necessários.

