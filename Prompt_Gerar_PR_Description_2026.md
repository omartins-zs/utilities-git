# 🧾 Instrução para Gerar Descrição de Pull Request

Poderia, por favor, gerar a descrição do Pull Request utilizando **exatamente** o template abaixo?

## Regras importantes

- **NÃO incluir trechos de código**
- Descrever apenas o **problema**, as **melhorias**, os **ajustes realizados** e o **impacto da mudança**
- Ser **claro, objetivo e técnico**, evitando textos genéricos
- Escrever como um **PR de produção**
- Preencher **apenas as seções que façam sentido** para esta tarefa
- Quando algo não se aplicar, indicar explicitamente (ex.: *“Não se aplica”*)
- Caso a mudança tenha **impacto em outras funcionalidades**, mencionar explicitamente em **Observações Técnicas**
- A seção **Contexto** deve explicar o cenário geral da tarefa
- A seção **Problema** deve explicar **onde** e **por que** o erro acontecia
- A seção **Solução** deve explicar **como** o problema foi resolvido (em alto nível, sem código)

---

## 📌 Template de Descrição do Pull Request

### 📌 Descrição do Pull Request

## 🎯 Título da tarefa
<!-- Titulo da Tarefa no ClickUp? -->

### 🔗 Link para a tarefa no ClickUp  
- [Task no ClickUp](https://app.clickup.com/t/linkID)

---

## 📖 Contexto  
Descrever o cenário geral da tarefa, incluindo regras de negócio, fluxo afetado e motivação da mudança.

---

## ❌ Problema  
Descrever claramente:
- O comportamento incorreto observado  
- Em que fluxo/ponto do sistema o problema ocorria  
- Onde o problema estava localizado (ex.: arquivo, camada ou etapa do fluxo — **sem código**)  
- Impacto do problema para o usuário ou sistema  

---

## 🛠 Solução  
Descrever a abordagem adotada para corrigir o problema, incluindo:
- Estratégia aplicada  
- Ajustes estruturais ou de validação realizados  
- Como a solução garante que o problema não volte a ocorrer  

---

## ✅ O que foi feito  
Listar objetivamente as melhorias, ajustes e implementações realizadas (sem código).

---

## 🧪 Como testar  

### Opção 1 – Validação do fluxo principal  
- Criar um cenário válido em **staging** relacionado à funcionalidade alterada  
- Executar o fluxo principal impactado por esta mudança  
- Verificar se o comportamento ocorre conforme o esperado, sem erros ou efeitos colaterais  

### Opção 2 – Validação de cenário de erro / regressão  
- Simular um cenário que anteriormente gerava erro ou comportamento incorreto  
- Executar a ação afetada (ex.: criação, edição, exclusão ou processamento de dados)  
- Confirmar que o erro não ocorre mais e que o sistema responde de forma consistente  

> Observação: os cenários devem ser criados especificamente para teste, sem reutilizar dados de produção.

---

## 🚀 Resultado esperado  
Descrever o comportamento esperado após a aplicação da mudança.

---

## 🖼 Screenshots / evidências (se aplicável)  
*(Não se aplica – alteração somente em backend/performance)*  

---

## 📝 Arquivos modificados  
Listar os arquivos afetados pela mudança.

---

## 🔍 Observações Técnicas  
Incluir detalhes técnicos relevantes, decisões tomadas, riscos conhecidos e impactos em outras funcionalidades do sistema.

---

## Tipo de mudança

- [ ] 🐛 Bug fix
- [ ] ✨ Nova feature
- [ ] ♻️ Refatoração
- [ ] ⚡ Performance
- [ ] 🔧 Infraestrutura / configuração
- [ ] 📝 Documentação

---

## Checklist

### Geral
- [ ] Testes unitários passando (`php vendor/bin/pest --configuration phpunit.ci.xml`)
- [ ] Sem código de debug esquecido (`dd`, `dump`, `var_dump`)
- [ ] CHANGELOG.md atualizado (se relevante)

### Se alterou `CACHE_DRIVER`, `SESSION_DRIVER` ou drivers de infra
- [ ] Revisados middlewares que dependem de cache (throttle, locks)
- [ ] `TrustProxies` verificado
- [ ] Teste de carga executado em staging (`tests/load/appointments-resume.js`)
- [ ] Redis/cache acessível pelas instâncias (Security Group, TLS)

### Se alterou middlewares ou rotas
- [ ] Ordem dos middlewares revisada
- [ ] `php artisan route:cache` funciona sem erros
- [ ] Endpoints públicos têm proteção adequada

### Se tem migrations
- [ ] Testada em staging antes deste PR
- [ ] Tabelas grandes (>1M linhas): agendada fora do horário comercial
- [ ] Rollback documentado

### Se tem variáveis de ambiente novas
- [ ] Adicionadas em staging
- [ ] Adicionadas em produção (ou documentadas para adicionar no deploy)
