# 🧾 Instrução Rigorosa para Análise de Tarefas

Preciso que você me ajude nessa tarefa com **extremo cuidado, responsabilidade e profundidade técnica**.

Analise minuciosamente todo o arquivo (ou arquivos) que serão enviados, entendendo completamente o contexto antes de propor qualquer alteração.

⚠️ Esta análise deve ser feita com o máximo de atenção, pois qualquer modificação incorreta pode impactar outros fluxos do sistema.

---

# 🎯 Compromisso com Qualidade

Essa tarefa deve ser tratada com **nível máximo de responsabilidade técnica**.

Cada modificação deve ser feita como se estivesse passando por:

- Code Review rigoroso
- Ambiente de produção sensível
- Auditoria técnica

⚠️ É fundamental tomar extremo cuidado.  
Erros aqui podem gerar impactos graves no sistema.

A entrega final deve ser:

- Simples  
- Correta  
- Sustentável  
- Segura  
- Sem impactos colaterais  
- Totalmente alinhada com o fluxo atual do sistema  

---

## 🧩 Tarefa

Analisar e implementar a correção ou melhoria solicitada com base no contexto completo do código enviado, priorizando soluções:

- Simples
- Limpas
- Coerentes com a arquitetura atual
- Seguras
- Sustentáveis
- Sem gerar regressões

---

## 📝 Descrição

Você deve analisar com muita atenção **todo o arquivo (ou arquivos) enviados**, entendendo profundamente:

- O contexto completo da funcionalidade
- O fluxo atual do código
- A responsabilidade desse arquivo dentro do sistema
- A relação com outros módulos, camadas ou funcionalidades
- As regras de negócio envolvidas
- As validações existentes
- As possíveis dependências indiretas

Antes de qualquer implementação, é obrigatório compreender qual é o **problema real (causa raiz)**.

---

# 🧠 Diretrizes Obrigatórias Antes de Codar

Antes de escrever qualquer código, você deve obrigatoriamente:

## 1️⃣ Entender profundamente o problema real

- Qual é a causa raiz?
- É erro de regra de negócio?
- É problema de validação?
- É problema de fluxo?
- É apenas comportamento de interface?
- Já existe solução parecida implementada?

Não assumir nada sem validar no código.

---

## 2️⃣ Identificar onde a correção deve ser aplicada

- Front-end?
- Back-end?
- Ambos?
- A lógica já existe em outro local?
- O erro está sendo apenas refletido nessa camada?

Evitar correções superficiais que mascaram o problema real.

---

## 3️⃣ Analisar TODAS as funções que serão modificadas

Para cada função alterada:

- Verificar onde mais ela é utilizada
- Confirmar se é reutilizada em outros módulos
- Avaliar impactos indiretos
- Garantir que não quebrará fluxos existentes
- Confirmar compatibilidade com regras atuais
- Verificar dependências internas e externas

🚨 **Nunca alterar uma função sem verificar todos os pontos onde ela é chamada.**

Se necessário, mapear as chamadas antes de modificar.

---

# 🔎 Validação de Fluxo e Regras

- ❌ Não alterar regras de negócio existentes
- ❌ Não modificar comportamento estrutural sem confirmação
- ❌ Não alterar contratos de retorno sem validar impacto

- ✅ Caso a tarefa envolva validações, ajustar apenas a camada de validação
- ✅ Garantir que o fluxo original continue funcionando exatamente como antes
- ✅ Confirmar que as modificações estão coerentes com o fluxo completo da funcionalidade

Se houver qualquer risco de impacto sistêmico:

👉 Documentar explicitamente em **Observações Técnicas**.

---

# 🛡️ Tratamento de Erros (Obrigatório)

Sempre que houver modificação ou nova implementação:

- Implementar `try/catch` quando aplicável
- No `catch`:
  - Registrar log detalhado do erro
  - Não mascarar exceções críticas
  - Garantir que o sistema não quebre silenciosamente
  - Preservar rastreabilidade do problema

⚠️ Nenhuma alteração deve deixar erro sem tratamento adequado.

---

# 🧪 Ajustes e Testes (Obrigatório)

Após implementar:

- Testar fluxo principal
- Testar fluxos alternativos
- Testar cenários negativos
- Testar chamadas reutilizadas
- Testar integrações dependentes
- Verificar possíveis efeitos colaterais
- Validar consistência de retorno de dados

Se qualquer comportamento inesperado surgir:

- Ajustar
- Refatorar
- Reavaliar a abordagem

Somente considerar concluído após validação completa.

---

# 📂 Arquivos Envolvidos

- (Listar aqui os arquivos enviados ou relacionados à tarefa)

---

# 🔍 Observações Técnicas

Caso identifique que:

- A solução não deve ser aplicada neste arquivo
- Falta contexto importante
- O problema está em outra camada
- A regra de negócio precisa ser revista
- A modificação impacta outros módulos

👉 Explicar claramente antes de escrever qualquer código.

Sempre documentar:

- Possíveis impactos
- Dependências afetadas
- Pontos sensíveis do sistema

---

# 📌 Restrições Técnicas

- ❌ Não duplicar lógica
- ❌ Não criar código desnecessário
- ❌ Não fazer overengineering
- ❌ Não alterar regras de negócio fora do escopo
- ❌ Não modificar fluxo crítico sem validação completa

- ✅ Reutilizar funções, services, helpers, hooks ou componentes existentes
- ✅ Manter padrão arquitetural atual
- ✅ Seguir princípios de código limpo
- ✅ Garantir responsabilidade única
- ✅ Priorizar estabilidade do sistema

---

# 🧷 Princípio Central

Esta tarefa deve ser executada com mentalidade de:

> Sistema em produção crítica  
> Código sob auditoria  
> Alteração com risco real de impacto sistêmico  

A prioridade absoluta é:

- Estabilidade
- Segurança
- Previsibilidade
- Manutenção do fluxo atual
- Zero regressão

---
