# 🚀 PROMPT — PADRONIZAR AMBIENTE (ENV + DOCKER) MULTI-STACK

Você é um arquiteto de software sênior especialista em Docker, DevOps e ambientes híbridos.

Sua tarefa é adaptar este projeto para rodar em DOIS MODOS:

1. LOCAL (sem Docker)
2. DOCKER (docker-compose)

## ⚠️ ATENÇÃO

- Este prompt deve funcionar para QUALQUER STACK:
  - Laravel / PHP
  - Node.js / Nest / Next / Express
  - Python / FastAPI / Flask / Django
  - Frontend (Vue / React / Vite)
  - Monorepo ou Fullstack

- NÃO assumir tecnologia fixa  
- DETECTAR automaticamente a stack  

---

## 🎯 OBJETIVO

Padronizar:

- `.env.example`
- `.env`
- `docker-compose.yml`
- `Dockerfile`

Garantindo:

✔️ Rode local  
✔️ Rode via Docker  
✔️ Sem alterar código manual  
✔️ Apenas alternando comentários no `.env`  

---

## 📦 PADRÃO .ENV

Criar `.env.example` com DOIS BLOCOS:

- Local (comentado)
- Docker (ativo)

### Exemplo (ADAPTAR para stack):

```
############################################
# APP
############################################

# Local
# APP_ENV=local
# APP_URL=http://127.0.0.1:8080

# Docker
APP_ENV=docker
APP_URL=http://localhost:8080

APP_PORT=8080

############################################
# DATABASE
############################################

# Local
# DB_HOST=127.0.0.1

# Docker
DB_HOST=postgres

############################################
# REDIS
############################################

# Local
# REDIS_HOST=127.0.0.1

# Docker
REDIS_HOST=redis
```

---

## 🐳 DOCKER

Criar ou ajustar:

- docker-compose.yml  
- Dockerfile  

### Regras:

- Usar apenas serviços necessários  
- Sincronizar com `.env`  
- Criar:
  - app  
  - db (se necessário)  
  - redis (se necessário)  
  - worker (se necessário)  
  - scheduler (se necessário)  

---

## ⚙️ DOCKERFILE

Criar conforme stack:

- PHP → php + composer + node  
- Node → node image  
- Python → python image  
- Frontend → node + build  

---

## 🧠 REGRAS IMPORTANTES

- NÃO hardcodar nada  
- Tudo via `.env`  
- Adaptar para stack detectada  
- Reaproveitar estrutura existente  
- Melhorar se já existir docker/env  

---

## 🧪 VALIDAÇÃO

✔️ docker compose up funciona  
✔️ execução local funciona  
✔️ banco conecta  
✔️ redis conecta  
✔️ serviços funcionam  

---

## 🎯 RESULTADO

Você deve entregar:

- `.env.example`  
- `.env`  
- `docker-compose.yml`  
- `Dockerfile`  

Tudo funcional e adaptado à stack detectada.
