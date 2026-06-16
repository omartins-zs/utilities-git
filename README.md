## 👨‍💻 🐙 GitHub

- [Git: desfazendo commits](https://brorlandi.github.io/git-desfazendo-commits)  
- [Modificar repositório remoto no Git](https://wallacemaxters.com.br/blog/50/como-modificar-o-repositorio-remoto-no-git)  
- [Diferença entre `git add --all`, `git add .` e `git add -u`](https://pt.stackoverflow.com/questions/326160/diferen%c3%a7a-entre-git-add-all-git-add-e-git-add-u)  
- [13 comandos Git mais usados (Geekhunter)](https://blog.geekhunter.com.br/comandos-git-mais-utilizados/#Git_add)  
- Desfazer o último commit e remover do stage area:  
  ```bash
  git reset HEAD~1        # volta 1 commit
  git reset HEAD~2        # volta 2 commits
  ```  
- Desfazer o último commit e manter no stage area:  
  ```bash
  git reset --soft HEAD~1
  ```  
- Fusão sem verificar históricos:  
  ```bash
  git pull origin master --allow-unrelated-histories
  ```  
- [Resolver "fatal: refusing to merge unrelated histories"](https://community.umbler.com/br/t/resolvendo-o-erro-fatal-refusing-to-merge-unrelated-histories-no-git/657)

<details>
  <summary>🔧 Como mudar username &amp; email dos commits já feitos</summary>

  ```bash
  git filter-branch --env-filter '
    EMAIL_ANTIGO="seu-email-antigo@example.com"
    NOME_CORRETO="Nome correto"
    EMAIL_CORRETO="seu-email-correto@example.com"
    if [ "$GIT_COMMITTER_EMAIL" = "$EMAIL_ANTIGO" ]; then
      export GIT_COMMITTER_NAME="$NOME_CORRETO"
      export GIT_COMMITTER_EMAIL="$EMAIL_CORRETO"
    fi
    if [ "$GIT_AUTHOR_EMAIL" = "$EMAIL_ANTIGO" ]; then
      export GIT_AUTHOR_NAME="$NOME_CORRETO"
      export GIT_AUTHOR_EMAIL="$EMAIL_CORRETO"
    fi
  ' --tag-name-filter cat -- --branches --tags
  ```
</details>

<details>
  <summary>✏️ Alterando a mensagem de commits específicos</summary>

  1. `git rebase -i HEAD~n` (substitua `n` pelo número de commits)  
  2. No editor, troque `pick` por `reword` no commit desejado  
  3. Edite a mensagem quando o Git abrir o editor novamente  
  4. Resolva conflitos (se houver) e execute:
     ```bash
     git rebase --continue
     ```  
  5. Force o push:
     ```bash
     git push --force
     ```
</details>

<details>
  <summary>🔀 Alterando commits após detached HEAD</summary>

  Se você criou novos commits em detached HEAD e quer reaplicar na sua branch:

  ```bash
  # forçar a branch principal para o HEAD atual
  git branch -f nome-da-branch HEAD
  # voltar para a branch principal
  git checkout nome-da-branch
  # push forçado para o remoto
  git push origin HEAD:nome-da-branch --force
  ```
</details>

---

## 📚 Arquivos do Repositório

Este repositório contém diversos arquivos úteis para padronização e automatização com IA:

### 🧩 Prompts para Inteligência Artificial (Cursor / Copilot / ChatGPT)
- 🚀 [**Prompt_Como_Executar_Projeto.md**](./Prompt_Como_Executar_Projeto.md) - Instruções para IA gerar a documentação de infraestrutura (`COMO_EXECUTAR.md`).
- 🔐 [**Prompt_Gerar_Acessos_Testes.md**](./Prompt_Gerar_Acessos_Testes.md) - Instruções para IA analisar seeders e listar os logins/rotas de teste.
- 📋 [**Prompt_Gerar_Plano_Implementacao.md**](./Prompt_Gerar_Plano_Implementacao.md) - Instruções para IA gerar um checklist de implementação.
- 🐳 [**Prompt_Docker_Local_Env.md**](./Prompt_Docker_Local_Env.md) - Prompt para configuração de ambiente Docker.
- ⚡ [**Prompt_Performance_Otimizacao_Docker.md**](./Prompt_Performance_Otimizacao_Docker.md) - Prompt de otimização para Docker.
- 🤖 [**Prompt_Tarefas_Cursor.md**](./Prompt_Tarefas_Cursor.md) e [**Prompt_Rigoroso_Tarefas_Cursor.md**](./Prompt_Rigoroso_Tarefas_Cursor.md) - Diretrizes gerais de código para o Cursor.

### 📝 Pull Requests e Commits
- 📋 [**Analise_commits.md**](./Analise_commits.md) - Padrão oficial para análise de commits (tipos, emojis, exemplos).
- 💬 [**Mensagens_Pull_Request.md**](./Mensagens_Pull_Request.md) - Exemplos de mensagens para comunicação em Pull Requests.
- 📄 [**Template_pull_requests.md**](./Template_pull_requests.md) - Template completo com checklist.
- 📁 **Templates_PR/**
  - [**Prompt_Gerar_Descricao_PR.md**](./Templates_PR/Prompt_Gerar_Descricao_PR.md) - Prompt para a IA gerar descrições de PR.
  - [**Prompt_Template_Descricao_do_Pull_Request.md**](./Templates_PR/Prompt_Template_Descricao_do_Pull_Request.md) - Esqueleto base em markdown.

---

