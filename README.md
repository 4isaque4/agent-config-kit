# Agent Config Kit

Configuração pessoal, portátil e econômica em tokens para Codex e Claude.

Este kit privilegia **um único agente** trabalhando em quatro fases: entender, investigar, planejar e executar. Subagentes não são usados por padrão. MCPs, skills e material de referência entram somente quando a tarefa pede.

## Comece aqui

1. Leia [docs/01-metodo-de-trabalho.md](docs/01-metodo-de-trabalho.md).
2. Copie `templates/AGENTS.single-agent.md` para `AGENTS.md` no projeto.
3. Se usar Claude Code, copie `templates/CLAUDE.md` também.
4. Rode o diagnóstico sem alterações:

```powershell
pwsh -File scripts/audit-ai-setup.ps1
```

5. Instale os arquivos em um projeto com simulação primeiro:

```powershell
pwsh -File scripts/install-project-kit.ps1 -Target C:\caminho\do\projeto -WhatIf
pwsh -File scripts/install-project-kit.ps1 -Target C:\caminho\do\projeto
```

O instalador cria backup antes de substituir arquivos e não copia segredos.

## O que existe no repositório

- `AGENTS.md`: regras deste próprio repositório, já no estilo agente único.
- `templates/`: instruções compartilháveis, permissões e exemplos de MCP sem segredo.
- `skills/`: workflows sob demanda para análise, plano, execução manual e extração.
- `prompts/`: versões curtas para colar em qualquer modelo.
- `docs/`: método, eficiência em tokens, MCP, skills, segurança e auditoria local.
- `scripts/`: auditoria, instalação com backup e validação.

## Decisões centrais

- Um agente é o padrão; delegação só ocorre se o usuário pedir explicitamente.
- Primeiro diagnóstico, depois plano; implementação começa somente quando autorizada.
- O plano deve ser executável manualmente, com arquivos, comandos, critérios de aceite e rollback.
- Instruções globais ficam curtas. Procedimentos longos viram skills sob demanda.
- MCP não é sinônimo de “mais inteligência”: só é habilitado se fornecer dados ou ações que as ferramentas nativas não cobrem.
- Acesso amplo a `.env` é uma preferência consciente do proprietário deste kit. O auditor apenas sinaliza a exposição; não a remove.

## Estado observado em 2026-08-18

- Windows e PowerShell.
- Codex Desktop instalado e configurado.
- Claude Desktop configurado com `desktop-commander`.
- Claude Code CLI não encontrado no `PATH`.
- Node.js disponível; `uv` e Docker não encontrados.
- O Codex tem um conjunto amplo de plugins habilitados.
- O Claude possui leitura global de `.env`, mantida intencionalmente.

Veja a análise e as prioridades em [docs/06-auditoria-local.md](docs/06-auditoria-local.md).

## Segurança

Este repositório é privado, mas isso não torna seguro versionar tokens. Exemplos usam placeholders e `.gitignore`; credenciais devem ficar no gerenciador do sistema, em variáveis de ambiente ou em arquivos locais ignorados.

