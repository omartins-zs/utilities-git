# Padrão de Análise de Commits

## 1ª Parte — Análise de Commits

Este documento define o **padrão oficial para análise de commits** do projeto.

O objetivo é:
- Analisar **todos os arquivos modificados**
- Identificar corretamente o **tipo de alteração**
- Gerar **mensagens de commit padronizadas**
- Organizar tudo em um único arquivo para revisão antes da aplicação dos commits

---

## Fluxo de Trabalho

1. Analisar todos os arquivos alterados
2. Descrever claramente o que mudou em cada arquivo
3. Classificar a mudança (simples ou complexa)
4. Sugerir o commit adequado seguindo o padrão abaixo
5. Consolidar tudo neste arquivo para validação

---

## Padrão de Commits (iuricode)

Referência oficial:
- https://github.com/iuricode/padroes-de-commits

### Tipos de Commit

| Tipo | Emoji | Palavra-chave | Descrição |
|-----|------|---------------|-----------|
| Acessibilidade | ♿ | :wheelchair: | Melhorias de acessibilidade |
| Adicionando teste | ✅ | :white_check_mark: | test |
| Atualizar submódulo | ⬆️ | :arrow_up: | Atualização de versão |
| Retroceder submódulo | ⬇️ | :arrow_down: | Downgrade |
| Adicionar dependência | ➕ | :heavy_plus_sign: | build |
| Revisão de código | 👌 | :ok_hand: | style |
| Animações | 💫 | :dizzy: | UI/UX |
| Bugfix | 🐛 | :bug: | fix |
| Comentários | 💡 | :bulb: | docs |
| Commit inicial | 🎉 | :tada: | init |
| Configuração | 🔧 | :wrench: | chore |
| Deploy | 🚀 | :rocket: | deploy |
| Documentação | 📚 | :books: | docs |
| Em progresso | 🚧 | :construction: | wip |
| Estilização UI | 💄 | :lipstick: | feat |
| Infraestrutura | 🧱 | :bricks: | ci |
| Lista de ideias | 🔜 | :soon: | tasks |
| Mover/Renomear | 🚚 | :truck: | chore |
| Novo recurso | ✨ | :sparkles: | feat |
| Package.json | 📦 | :package: | build |
| Performance | ⚡ | :zap: | perf |
| Refatoração | ♻️ | :recycle: | refactor |
| Limpeza de código | 🧹 | :broom: | cleanup |
| Remover arquivo | 🗑️ | :wastebasket: | remove |
| Remover dependência | ➖ | :heavy_minus_sign: | build |
| Responsividade | 📱 | :iphone: | feat |
| Reverter mudança | 💥 | :boom: | fix |
| Segurança | 🔒 | :lock: | security |
| SEO | 🔍 | :mag: | seo |
| Tag de versão | 🔖 | :bookmark: | release |
| Teste de aprovação | ✔️ | :heavy_check_mark: | test |
| Testes | 🧪 | :test_tube: | test |
| Texto | 📝 | :pencil: | docs |
| Tipagem | 🏷️ | :label: | types |
| Tratamento de erros | 🥅 | :goal_net: | fix |
| Dados | 🗃️ | :card_file_box: | raw |

---

## Regras para Mensagens de Commit

- Máximo de **50 caracteres** na mensagem principal
- Usar verbo no infinitivo (Criar, Adicionar, Atualizar, Remover)
- Evitar mensagens genéricas
- Um commit por responsabilidade

Quando houver **muitas alterações relacionadas**, usar:

- **Mensagem curta**
- **Descrição detalhada no corpo do commit**

---

## Exemplos Práticos

### Exemplo 1 — Criação de arquivo

**Arquivo:** `database/seeders/PartidaSeeder.php`

**Análise:**
Criação de seeder responsável por popular a tabela de partidas para ambiente de desenvolvimento e testes.

**Commit sugerido:**

```
🔧 :wrench: Criando seeder de partidas
```

---

### Exemplo 2 — Alteração simples (coluna)

**Arquivo:** `database/migrations/xxxx_add_quadro_numero_partidas.php`

**Análise:**
Adição da coluna `quadro_numero` para controle interno das partidas.

**Commit sugerido:**

```
🗃️ :card_file_box: Add coluna quadro_numero em partidas
```

---

### Exemplo 3 — Criação de Model

**Arquivo:** `app/Models/Atleta.php`

**Análise:**
Criação do model Atleta para representação dos dados de atletas no sistema.

**Commit sugerido:**

```
🗃️ :card_file_box: Criando model de Atleta
```

---

## 2ª Parte — Análise Profunda de Commits

Após a validação deste arquivo:

- Os commits serão **executados manualmente**
- Ajustes finos poderão ser feitos nas mensagens
- Commits simples podem usar apenas `:chore:` ou tipo equivalente
- Commits complexos terão análise técnica mais detalhada

---

## Observações Finais

- Alterações pequenas devem gerar commits pequenos
- Evitar misturar migration, model e regra de negócio no mesmo commit
- Clareza > quantidade
- Commits contam história do projeto

---

📌 **Este arquivo serve como base oficial para análise e organização dos commits do projeto.**

