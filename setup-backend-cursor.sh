#!/usr/bin/env bash

set -e

echo "🚀 Iniciando setup de otimização do Cursor..."

PROJECT_ROOT="$(pwd)"
DATE_SUFFIX=$(date +"%Y%m%d-%H%M%S")

# ---------------------------------------
# Helpers
# ---------------------------------------
backup_if_exists() {
  local file=$1
  if [ -f "$file" ]; then
    echo "📦 Backup criado para $file"
    mv "$file" "$file.bak-$DATE_SUFFIX"
  fi
}

# ---------------------------------------
# Detectar tipo de projeto
# ---------------------------------------
IS_LARAVEL=false

if [ -f "artisan" ] && [ -d "app" ] && [ -d "vendor" ]; then
  IS_LARAVEL=true
fi

echo "🔍 Projeto detectado:"
if [ "$IS_LARAVEL" = true ]; then
  echo "✅ Laravel (Backend)"
else
  echo "⚠️ Tipo de projeto não identificado claramente"
fi

# ---------------------------------------
# Criar .cursorignore
# ---------------------------------------
echo "📝 Criando .cursorignore..."

backup_if_exists ".cursorignore"

cat << 'EOF' > .cursorignore
# -------------------------------
# Dependências
# -------------------------------
vendor/
node_modules/

# -------------------------------
# Builds / Dist
# -------------------------------
dist/
build/
public/build/

# -------------------------------
# Logs
# -------------------------------
storage/logs/
*.log

# -------------------------------
# Cache
# -------------------------------
bootstrap/cache/
.cache/
.tmp/

# -------------------------------
# Ambiente / Temporários
# -------------------------------
.env
.env.*
*.bak
*.tmp

# -------------------------------
# Docker
# -------------------------------
Dockerfile
docker-compose.yml

# -------------------------------
# Git
# -------------------------------
.git/
.gitignore

# -------------------------------
# IDE / OS
# -------------------------------
.vscode/
.idea/
.DS_Store
Thumbs.db
EOF

echo "✅ .cursorignore criado"

# ---------------------------------------
# Criar .cursorrules
# ---------------------------------------
echo "🧠 Criando .cursorrules..."

backup_if_exists ".cursorrules"

cat << 'EOF' > .cursorrules
# ======================================
# Cursor Rules — Backend Laravel
# ======================================

## Contexto Geral
Este é um projeto backend em Laravel.
O foco principal está na regra de negócio e arquitetura,
não em código gerado automaticamente.

## Diretrizes Gerais
- Não sugerir alterações em vendor/
- Não analisar logs ou cache
- Priorizar clareza e boas práticas
- Evitar duplicação de lógica
- Preferir Services e Repositories
- Controllers devem ser finos

## Estrutura Importante
- app/Http/Controllers
- app/Services
- app/Repositories
- app/Models
- app/Jobs
- app/Policies

## Padrões
- Seguir PSR-12
- Usar tipagem sempre que possível
- Evitar lógica complexa em controllers
- Validar entradas com Form Requests

## O que evitar
- Código em helpers globais sem contexto
- Queries complexas diretamente no controller
- Duplicação de regras de negócio
- Acesso direto ao banco fora de repositories
EOF

echo "✅ .cursorrules criado"

# ---------------------------------------
# Final
# ---------------------------------------
echo ""
echo "🎉 Setup do Cursor finalizado com sucesso!"
echo ""
echo "📌 Próximos passos:"
echo "1. Abra o projeto no Cursor"
echo "2. Pressione Ctrl+Shift+P"
echo "3. Execute: Cursor: Reindex Codebase"
echo ""
echo "🚀 Cursor otimizado e pronto para uso!"
