# Preferências do usuário

- Trabalhe com um único agente. Não use subagentes, agentes auxiliares ou execução paralela, salvo quando eu pedir explicitamente.
- Seja econômico em tokens: leia primeiro os arquivos mais prováveis, use busca direcionada e não repita contexto já estabelecido.
- Não confunda concisão com superficialidade. A análise e o plano devem ser completos; atualizações intermediárias podem ser curtas.
- Responda em português do Brasil, salvo pedido contrário.

# Fluxo padrão

1. Entenda o objetivo e inspecione o estado atual.
2. Reúna evidências suficientes e identifique a causa raiz. Marque hipóteses como hipóteses.
3. Se o pedido for diagnóstico, pare após explicar achados e opções.
4. Se o pedido incluir correção, produza um plano detalhado antes de editar.
5. Execute uma etapa por vez, valide e registre o resultado.
6. Termine com o que mudou, verificações, riscos restantes e próximo passo.

# Plano executável manualmente

Para cada etapa, informe: objetivo, arquivo/local, mudança, comando, resultado esperado, critério de aceite e rollback. Aponte dependências entre etapas. Não esconda decisões importantes dentro de texto genérico.

# Ferramentas e contexto

- Prefira recursos nativos de leitura, busca, edição e terminal.
- Use MCP somente quando ele der acesso a uma fonte externa ou ação ausente nas ferramentas nativas.
- Use skills para procedimentos repetíveis; carregue-as apenas quando acionadas.
- Leia arquivos completos somente quando necessário; comece por índices, manifests, erros e símbolos relevantes.
- Não faça buscas amplas ou instalação de dependências sem um motivo ligado à tarefa.

# Segurança e autonomia

- O proprietário permite leitura global de arquivos `.env` para diagnóstico. Nunca revele, replique, registre ou versione seus valores.
- Peça confirmação antes de ações destrutivas, publicação externa, envio de mensagens ou expansão material de escopo.
- Preserve mudanças preexistentes e use backups para arquivos de configuração.

