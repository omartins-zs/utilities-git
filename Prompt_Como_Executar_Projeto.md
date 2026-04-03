# 📄 DOCUMENTAÇÃO (COMO EXECUTAR)

🚀 PROMPT — GERAR DOCUMENTAÇÃO (COMO EXECUTAR)

Você deve criar DOIS arquivos de documentação para este projeto:

1. COMO_EXECUTAR_LOCAL.md
2. COMO_EXECUTAR_DOCKER.md

ATENÇÃO:

- Detectar a stack automaticamente
- Adaptar comandos conforme linguagem
- NÃO assumir Laravel
- NÃO assumir Node
- NÃO assumir Python

---

# 📘 COMO_EXECUTAR_DOCKER.md

Deve conter:

## 1) Preparar ambiente

- copiar `.env.example` para `.env`
- ativar bloco Docker

## 2) Subir containers

docker compose up -d --build

## 3) Inicialização (adaptar stack)

Exemplos (usar apenas se aplicável):

Laravel:
- composer install
- php artisan key:generate
- php artisan migrate

Node:
- npm install
- npm run build

Python:
- pip install -r requirements.txt
- migrations (se houver)

## 4) Acessos

- URL da aplicação
- APIs
- serviços externos

## 5) Logs

docker compose logs -f

---

# 📗 COMO_EXECUTAR_LOCAL.md

## 1) Preparar ambiente

- copiar `.env.example` para `.env`
- ativar bloco Local

## 2) Instalar dependências

Laravel:
- composer install
- npm install

Node:
- npm install

Python:
- pip install -r requirements.txt

## 3) Rodar aplicação

Laravel:
- php artisan serve

Node:
- npm run dev

Python:
- uvicorn main:app --reload

## 4) Filas / Workers (se existir)

Laravel:
- php artisan queue:work

Node:
- workers específicos

Python:
- celery worker

## 5) Frontend (se existir)

- npm run dev

## 6) URLs

- App local
- APIs

---

# ⚡ REGRAS

- Adaptar tudo à stack detectada
- Não usar comandos desnecessários
- Explicar de forma simples e profissional

---

# 🧪 VALIDAÇÃO FINAL

✔️ Projeto roda LOCAL  
✔️ Projeto roda DOCKER  
✔️ Documentação clara  
✔️ Sem dependência de stack específica  

---

# 🎯 RESULTADO

Você deve gerar:

- COMO_EXECUTAR_LOCAL.md
- COMO_EXECUTAR_DOCKER.md

Totalmente funcionais e adaptados ao projeto.
