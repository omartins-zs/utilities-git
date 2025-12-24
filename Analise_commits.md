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

## Padrões de emojis/Tipos de Commit 💈

<table>
  <thead>
    <tr>
      <th>Tipo do commit</th>
      <th>Emoji</th>
      <th>Palavra-chave</th>
    </tr>
  </thead>
 <tbody>
    <tr>
      <td>Acessibilidade</td>
      <td>♿ <code>:wheelchair:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Adicionando um teste</td>
      <td>✅ <code>:white_check_mark:</code></td>
      <td><code>test</code></td>
    </tr>
    <tr>
      <td>Atualizando a versão de um submódulo</td>
      <td>⬆️ <code>:arrow_up:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Retrocedendo a versão de um submódulo</td>
      <td>⬇️ <code>:arrow_down:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Adicionando uma dependência</td>
      <td>➕ <code>:heavy_plus_sign:</code></td>
      <td><code>build</code></td>
    </tr>
    <tr>
      <td>Alterações de revisão de código</td>
      <td>👌 <code>:ok_hand:</code></td>
      <td><code>style</code></td>
    </tr>
    <tr>
      <td>Animações e transições</td>
      <td>💫 <code>:dizzy:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Bugfix</td>
      <td>🐛 <code>:bug:</code></td>
      <td><code>fix</code></td>
    </tr>
    <tr>
      <td>Comentários</td>
      <td>💡 <code>:bulb:</code></td>
      <td><code>docs</code></td>
    </tr>
    <tr>
      <td>Commit inicial</td>
      <td>🎉 <code>:tada:</code></td>
      <td><code>init</code></td>
    </tr>
    <tr>
      <td>Configuração</td>
      <td>🔧 <code>:wrench:</code></td>
      <td><code>chore</code></td>
    </tr>
    <tr>
      <td>Deploy</td>
      <td>🚀 <code>:rocket:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Documentação</td>
      <td>📚 <code>:books:</code></td>
      <td><code>docs</code></td>
    </tr>
    <tr>
      <td>Em progresso</td>
      <td>🚧 <code>:construction:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Estilização de interface</td>
      <td>💄 <code>:lipstick:</code></td>
      <td><code>feat</code></td>
    </tr>
    <tr>
      <td>Infraestrutura</td>
      <td>🧱 <code>:bricks:</code></td>
      <td><code>ci</code></td>
    </tr>
    <tr>
      <td>Lista de ideias (tasks)</td>
      <td>🔜 <code> :soon: </code></td>
      <td></td>
    </tr>
    <tr>
      <td>Mover/Renomear</td>
      <td>🚚 <code>:truck:</code></td>
      <td><code>chore</code></td>
    </tr>
    <tr>
      <td>Novo recurso</td>
      <td>✨ <code>:sparkles:</code></td>
      <td><code>feat</code></td>
    </tr>
    <tr>
      <td>Package.json em JS</td>
      <td>📦 <code>:package:</code></td>
      <td><code>build</code></td>
    </tr>
    <tr>
      <td>Performance</td>
      <td>⚡ <code>:zap:</code></td>
      <td><code>perf</code></td>
    </tr>
    <tr>
        <td>Refatoração</td>
        <td>♻️ <code>:recycle:</code></td>
        <td><code>refactor</code></td>
    </tr>
    <tr>
      <td>Limpeza de Código</td>
      <td>🧹 <code>:broom:</code></td>
      <td><code>cleanup</code></td>
    </tr>
    <tr>
      <td>Removendo um arquivo</td>
      <td>🗑️ <code>:wastebasket:</code></td>
      <td><code>remove</code></td>
    </tr>
    <tr>
      <td>Removendo uma dependência</td>
      <td>➖ <code>:heavy_minus_sign:</code></td>
      <td><code>build</code></td>
    </tr>
    <tr>
      <td>Responsividade</td>
      <td>📱 <code>:iphone:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Revertendo mudanças</td>
      <td>💥 <code>:boom:</code></td>
      <td><code>fix</code></td>
    </tr>
    <tr>
      <td>Segurança</td>
      <td>🔒️ <code>:lock:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>SEO</td>
      <td>🔍️ <code>:mag:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Tag de versão</td>
      <td>🔖 <code>:bookmark:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Teste de aprovação</td>
      <td>✔️ <code>:heavy_check_mark:</code></td>
      <td><code>test</code></td>
    </tr>
    <tr>
      <td>Testes</td>
      <td>🧪 <code>:test_tube:</code></td>
      <td><code>test</code></td>
    </tr>
    <tr>
      <td>Texto</td>
      <td>📝 <code>:pencil:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Tipagem</td>
      <td>🏷️ <code>:label:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Tratamento de erros</td>
      <td>🥅 <code>:goal_net:</code></td>
      <td></td>
    </tr>
    <tr>
      <td>Dados</td>
      <td>🗃️ <code>:card_file_box:</code></td>
      <td><code>raw</code></td>
    </tr>
  </tbody>
</table>

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

