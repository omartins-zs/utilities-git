# Padrão de Análise de Commits

---

# 🔹 ANÁLISE 1 — Análise Simples de Commits

Este documento define o **padrão oficial para análise simples de commits** do projeto.

O objetivo é:

- Analisar **todos os arquivos modificados**
- Identificar corretamente o **tipo de alteração**
- Gerar **mensagens de commit padronizadas**
- Organizar tudo em um único arquivo para revisão antes da aplicação dos commits

---

## ⚠️ Regra Importante — Uso de Emoji

Cada commit deve usar **APENAS 1 emoji** no início da mensagem.

⚠️ **IMPORTANTE (COMPATIBILIDADE):**

Alguns editores, terminais ou ambientes podem apresentar erro ao usar emoji visual.

👉 Portanto, **SEMPRE utilizar o formato com nome do emoji (`:nome:`)**

---

### ✅ Formato obrigatório (recomendado)

```text
:bug: fix: corrigindo validação de login
:wrench: chore: ajustando configuração
:sparkles: feat: adicionando funcionalidade
```

---

### ⚠️ Formato alternativo (evitar se possível)

```text
🐛 fix: corrigindo validação de login
```

---

### ❌ Errado (nunca usar)

```text
🐛 :bug: fix: corrigindo erro
```

---

## Fluxo de Trabalho

1. Analisar todos os arquivos alterados  
2. Descrever claramente o que mudou em cada arquivo  
3. Classificar a mudança (simples ou complexa)  
4. Sugerir o commit adequado seguindo o padrão abaixo  
5. Consolidar tudo neste arquivo para validação  
6. Gerar ao final uma **lista com todos os commits sugeridos**  
7. Informar no final a **quantidade total de commits sugeridos**

---

## Padrão de Commits (iuricode)

Referência oficial:

https://github.com/iuricode/padroes-de-commits

---

## Tipos de Commit e Emojis

| Tipo | Emoji (usar este) | Keyword |
|-----|------------------|--------|
| Bugfix | `:bug:` | `fix` |
| Novo recurso | `:sparkles:` | `feat` |
| Refatoração | `:recycle:` | `refactor` |
| Performance | `:zap:` | `perf` |
| Configuração | `:wrench:` | `chore` |
| Dependências | `:package:` | `build` |
| Documentação | `:books:` | `docs` |
| Testes | `:test_tube:` | `test` |
| Limpeza de código | `:broom:` | `cleanup` |
| Mover/Renomear | `:truck:` | `chore` |
| Remover arquivo | `:wastebasket:` | `remove` |
| Deploy | `:rocket:` | `deploy` |
| Segurança | `:lock:` | `security` |
| Infraestrutura / CI | `:bricks:` | `ci` |
| Dados | `:card_file_box:` | `data` |
| Commit inicial | `:tada:` | `init` |

---

## Regras para Mensagens de Commit

- Máximo de **50 caracteres** na mensagem principal  
- Usar verbo no infinitivo  
- Evitar mensagens genéricas  
- Um commit por responsabilidade  
- Sempre usar **1 emoji (formato `:nome:`)**  
- Consolidar os commits sugeridos em uma **lista final**  
- Informar no final a **quantidade total de commits**

Formato recomendado:

```text
:emoji: tipo: descrição
```

Exemplo:

```text
:bug: fix: corrigindo erro na validação
:sparkles: feat: adicionando sistema de convites
:recycle: refactor: simplificando controller
```

---

## Estrutura Padrão da Análise

Cada item analisado deve seguir este formato:

### Arquivo
caminho/do/arquivo.ext

### Análise
Descrição objetiva do que foi alterado no arquivo.

### Classificação
- Simples  
- Complexa  

### Commit sugerido
:emoji: tipo: descrição

---

## Exemplos Práticos

### Arquivo
database/seeders/PartidaSeeder.php

**Análise:**  
Criação de seeder responsável por popular a tabela de partidas.

**Classificação:**  
Simples

**Commit sugerido:**  
:sparkles: feat: criando seeder de partidas

---

### Arquivo
database/migrations/add_quadro_numero_partidas.php

**Análise:**  
Adição da coluna `quadro_numero`.

**Classificação:**  
Simples

**Commit sugerido:**  
:card_file_box: data: adicionando coluna quadro_numero

---

### Arquivo
app/Models/Atleta.php

**Análise:**  
Criação do model Atleta.

**Classificação:**  
Simples

**Commit sugerido:**  
:sparkles: feat: criando model Atleta

---

## Consolidação Final

### Lista final de commits sugeridos

```text
1. :sparkles: feat: criando seeder de partidas
2. :card_file_box: data: adicionando coluna quadro_numero
3. :sparkles: feat: criando model Atleta
```

### Quantidade total de commits

```text
Total de commits sugeridos: 3
```

---

# 🔹 ANÁLISE 2 — Análise Profunda de Commits

Esta análise é utilizada quando se deseja um nível mais avançado de entendimento do código, geralmente ao trabalhar com IA ou refatorações maiores.

Aqui não basta apenas descrever mudanças, é necessário **entender o impacto real no sistema**.

---

## Quando usar

- Quando estiver usando IA para gerar código  
- Quando houver muitas alterações complexas  
- Quando envolver regra de negócio  
- Quando houver refatorações grandes  
- Quando precisar de maior precisão nos commits  

---

## Fluxo da Análise Profunda

1. Ler completamente o conteúdo de cada arquivo alterado  
2. Entender o propósito do código (não apenas a mudança)  
3. Identificar impacto no sistema (regra de negócio, fluxo, arquitetura)  
4. Agrupar alterações relacionadas em commits coerentes  
5. Separar responsabilidades corretamente  
6. Evitar commits genéricos ou mal definidos  
7. Criar mensagens mais descritivas e técnicas quando necessário  
8. Validar se os commits contam uma história clara do que foi feito  

---

## Regras da Análise Profunda

- Os commits serão **executados manualmente**  
- Ajustes finos poderão ser feitos nas mensagens  
- Commits simples podem usar apenas `chore`  
- Commits complexos devem ter descrição mais técnica  
- Pode agrupar arquivos quando fizer sentido lógico  
- Deve priorizar clareza e organização do histórico  

---

## Boas práticas

- Alterações pequenas devem gerar commits pequenos  
- Evitar misturar migration, model e regra de negócio no mesmo commit  
- Clareza > quantidade  
- Commits contam a história do projeto  
- Pensar como outro dev entenderia o commit depois  

---

## Diferença entre Análise 1 e Análise 2

| Tipo | Foco |
|-----|------|
| Análise 1 | Mudança direta no arquivo |
| Análise 2 | Entendimento profundo do código |

---

📌 **Este documento define dois níveis de análise:**
- Simples (rápida e direta)
- Profunda (técnica e orientada ao sistema)

👉 **Sempre priorizar uso de `:emoji:` para evitar erros em terminais e editores.**
