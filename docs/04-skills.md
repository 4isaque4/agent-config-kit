# Skills: conhecimento carregado só quando necessário

Skills são o melhor lugar para checklists, formatos de saída e procedimentos extensos. O corpo é carregado ao uso; por isso, economiza contexto em comparação com colocar tudo em `CLAUDE.md` ou `AGENTS.md`.

## Kit inicial incluído

- `diagnosticar`: análise baseada em evidência, sem editar.
- `planejar-correcao`: plano completo para execução manual.
- `executar-etapa`: aplica somente uma etapa aprovada e valida.
- `extrair-com-rastreabilidade`: extração estruturada sem preencher lacunas.

Para Claude Code, copie as pastas para `.claude/skills/` do projeto ou `~/.claude/skills/` para uso pessoal. As skills de ação estão marcadas para invocação manual.

## Skills/plugins de alto retorno já disponíveis no ambiente

- `data:analyze`, `data:validate-data`, `data:sql-queries`: análise, QA e consultas.
- `documents`, `pdf`, `spreadsheets`, `presentations`: produção e leitura de arquivos.
- `github`: issues, PRs e contexto de repositório.
- `design:research-synthesis` e `design:accessibility-review`: síntese e revisão.
- `browser`, `chrome`, `computer-use`: navegação e UI quando APIs não bastam.
- `notion`, `google-drive`, `google-calendar`: fontes externas específicas.

Não deixe todas “mentalmente ativas” no prompt. Acione uma skill pelo nome quando a tarefa combinar. Para efeitos colaterais — publicar, enviar, deletar, implantar — prefira invocação somente pelo usuário.

## Quando criar uma skill nova

Crie quando o mesmo checklist foi colado duas vezes, quando um processo tem validações estáveis ou quando uma seção de instruções globais virou tutorial. Não crie uma skill para uma regra curta universal ou para fatos que o código já revela.

