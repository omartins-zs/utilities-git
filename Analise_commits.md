# Padrão de Análise de Commits

## 1ª Parte — Análise de Commits

Este documento define o **padrão oficial para análise de commits** do projeto.

O objetivo é:

- Analisar **todos os arquivos modificados**
- Identificar corretamente o **tipo de alteração**
- Gerar **mensagens de commit padronizadas**
- Organizar tudo em um único arquivo para revisão antes da aplicação dos commits

---

# ⚠️ Regra Importante — Uso de Emoji

Cada commit deve usar **APENAS 1 emoji** no início da mensagem.

Exemplo correto:

🐛 fix: corrigindo validação de login

ou

:bug: fix: corrigindo validação de login

⚠️ **Nunca usar dois emojis ao mesmo tempo.**

❌ Errado:

🐛 :bug: fix: corrigindo erro

✔️ Correto:

🐛 fix: corrigindo erro

ou

:bug: fix: corrigindo erro

---

# Fluxo de Trabalho

1. Analisar todos os arquivos alterados
2. Descrever claramente o que mudou em cada arquivo
3. Classificar a mudança (simples ou complexa)
4. Sugerir o commit adequado seguindo o padrão abaixo
5. Consolidar tudo neste arquivo para validação

---

# Padrão de Commits (iuricode)

Referência oficial:

https://github.com/iuricode/padroes-de-commits

---

# Tipos de Commit e Emojis

| Tipo | Emoji | Keyword |
|-----|------|------|
| Bugfix | 🐛 `:bug:` | `fix` |
| Novo recurso | ✨ `:sparkles:` | `feat` |
| Refatoração | ♻️ `:recycle:` | `refactor` |
| Performance | ⚡ `:zap:` | `perf` |
| Configuração | 🔧 `:wrench:` | `chore` |
| Dependências | 📦 `:package:` | `build` |
| Documentação | 📚 `:books:` | `docs` |
| Testes | 🧪 `:test_tube:` | `test` |
| Limpeza de código | 🧹 `:broom:` | `cleanup` |
| Mover/Renomear | 🚚 `:truck:` | `chore` |
| Remover arquivo | 🗑️ `:wastebasket:` | `remove` |
| Deploy | 🚀 `:rocket:` | `deploy` |
| Segurança | 🔒 `:lock:` | `security` |
| Infraestrutura / CI | 🧱 `:bricks:` | `ci` |
| Dados | 🗃️ `:card_file_box:` | `data` |
| Commit inicial | 🎉 `:tada:` | `init` |

---

# Regras para Mensagens de Commit

- Máximo de **50 caracteres** na mensagem principal
- Usar verbo no infinitivo
- Evitar mensagens genéricas
- Um commit por responsabilidade
- Sempre usar **1 emoji no início**

Formato recomendado:

emoji tipo: descrição

Exemplo:

🐛 fix: corrigindo erro na validação  
✨ feat: adicionando sistema de convites  
♻️ refactor: simplificando lógica do controller  

---

# Exemplos Práticos

## Criação de arquivo

Arquivo:

database/seeders/PartidaSeeder.php

Análise:

Criação de seeder responsável por popular a tabela de partidas.

Commit sugerido:

✨ feat: criando seeder de partidas

---

## Alteração simples

Arquivo:

database/migrations/add_quadro_numero_partidas.php

Análise:

Adição da coluna `quadro_numero`.

Commit sugerido:

🗃️ data: adicionando coluna quadro_numero

---

## Criação de Model

Arquivo:

app/Models/Atleta.php

Análise:

Criação do model Atleta.

Commit sugerido:

✨ feat: criando model Atleta

---

# 2ª Parte — Análise Profunda de Commits

Após a validação deste arquivo:

- Os commits serão **executados manualmente**
- Ajustes finos poderão ser feitos nas mensagens
- Commits simples podem usar apenas `chore`
- Commits complexos terão análise técnica mais detalhada

---

# Observações Finais

- Alterações pequenas devem gerar commits pequenos
- Evitar misturar migration, model e regra de negócio no mesmo commit
- Clareza > quantidade
- Commits contam a história do projeto

---

📌 **Este arquivo serve como base oficial para análise e organização dos commits do projeto.**
