# Método de trabalho: um agente, quatro fases

## 1. Entender

Reformular objetivo, limites, definição de pronto e ações autorizadas. Perguntar somente quando uma escolha muda materialmente o resultado; caso contrário, declarar uma suposição reversível e avançar.

## 2. Investigar

Buscar da evidência mais barata para a mais cara: erro exato, status, diff, configuração, símbolos citados, testes relacionados e só então exploração ampla. A saída deve separar:

- fatos observados;
- inferências sustentadas;
- hipóteses ainda não testadas;
- causa raiz, quando demonstrável.

## 3. Planejar

O plano não é um resumo. Ele é um roteiro que outra pessoa consegue executar sem redescobrir decisões. Cada etapa contém local, alteração, comando, resultado esperado, aceite e rollback. Uma etapa fica `em andamento`; as demais ficam pendentes.

## 4. Executar

Executar a menor unidade verificável. Conferir o estado antes, editar, testar proporcionalmente ao risco e atualizar o plano. Se a evidência contradizer o diagnóstico, parar e revisar o plano em vez de acumular correções especulativas.

## Quando quebrar o padrão de agente único

Somente mediante pedido explícito ou quando o usuário decidir que isolamento de contexto/latência vale o custo. Bons casos: revisão independente de segurança, pesquisas realmente independentes ou exploração que encheria o contexto principal. Paralelizar tarefas dependentes geralmente duplica leitura e reconciliação.

