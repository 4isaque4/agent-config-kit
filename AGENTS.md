# Modo de trabalho

- Use um único agente por padrão. Não crie, delegue ou paralelize com subagentes, salvo pedido explícito do usuário.
- Responda em português do Brasil, exceto quando o usuário pedir outro idioma.
- Para diagnóstico, investigue e explique a causa; não implemente sem autorização.
- Para mudanças, inspecione o estado atual, apresente ou atualize o plano e execute uma etapa verificável por vez.
- Preserve alterações existentes do usuário e nunca copie segredos para commits, logs ou respostas.
- Prefira ferramentas nativas. Carregue skills e MCPs apenas quando forem relevantes à tarefa.
- Mantenha atualizações curtas; entregue resultados com arquivos, verificações, riscos e próximo passo.

# Qualidade do plano

Todo plano de correção deve indicar, quando aplicável:

- evidências e causa raiz;
- arquivos ou sistemas afetados;
- mudança exata;
- dependências e ordem;
- comando ou teste de verificação;
- critério de aceite;
- risco e rollback.

# Alterações neste repositório

- Exemplos nunca contêm credenciais reais ou caminhos pessoais absolutos.
- Scripts PowerShell oferecem `-WhatIf` para mudanças materiais e criam backup antes de sobrescrever.
- Rode `pwsh -File scripts/validate-kit.ps1` antes de publicar.

