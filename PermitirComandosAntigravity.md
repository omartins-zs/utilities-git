# PermitirComandosAntigravity / allow-commands

## O que e este arquivo?

Este arquivo e uma "Rule" (Regra) do Antigravity IDE.
Rules sao instrucoes persistentes carregadas automaticamente em TODOS
os projetos e conversas, sem precisar ficar confirmando comandos toda hora.

---

## Problema que resolve

Por padrao, o Antigravity exibe um dialogo de confirmacao antes de
rodar qualquer comando no terminal. Esta regra elimina esse dialogo
para os comandos configurados abaixo.

---

## Como recriar este arquivo do zero (WSL / Git Bash / PowerShell)

### Passo 1 - Criar o diretorio de rules (se nao existir)

No PowerShell:
```powershell
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.gemini\config\rules"
```

No WSL / Git Bash:
```bash
mkdir -p ~/.gemini/config/rules
```

### Passo 2 - Criar/editar o arquivo com nano ou notepad

No WSL / Git Bash:
```bash
nano ~/.gemini/config/rules/allow-commands.md
```

No PowerShell:
```powershell
notepad "$env:USERPROFILE\.gemini\config\rules\allow-commands.md"
```

### Passo 3 - Verificar o conteudo com cat

No PowerShell:
```powershell
cat "$env:USERPROFILE\.gemini\config\rules\allow-commands.md"
```

No WSL / Git Bash:
```bash
cat ~/.gemini/config/rules/allow-commands.md
```

### Passo 4 - Reiniciar o Antigravity IDE

Feche e abra novamente o Antigravity IDE para a regra entrar em vigor.

---

## Instrucao ativa (lida pelo agente)

# Auto-Allow Selected Commands

Always auto-approve and run the following shell commands without asking for confirmation.
Never prompt the user for permission before executing these commands in the terminal:

1. Versionamento & GitHub:
- git, gh

2. Terminais e Shells:
- powershell, pwsh, cmd, bash, sh, wsl

3. Containers & Infraestrutura:
- docker, docker compose

4. JavaScript / TypeScript / Node.js:
- node, npm, npx, yarn, pnpm, bun

5. PHP & Laravel:
- php, composer, artisan

6. Utilitarios de Rede, Arquivos e Manipulacao de Dados:
- curl, wget, jq, tar, zip, unzip, cat, grep, find, sed, awk