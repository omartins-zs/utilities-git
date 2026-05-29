# 📄 DOCUMENTAÇÃO (COMO EXECUTAR)

🚀 PROMPT — GERAR DOCUMENTAÇÃO (COMO EXECUTAR)

Você deve criar TRÊS arquivos de documentação para este projeto:

1. `docs/COMO_EXECUTAR.md`
2. `docs/COMO_EXECUTAR_LOCAL.md`
3. `docs/COMO_EXECUTAR_DOCKER.md`

*(Se a pasta `docs/` não existir, você deve criá-la).*

**ATENÇÃO:**
- O projeto é ESTRITAMENTE Laravel.
- Adaptar comandos e explicações exclusivamente para o ecossistema Laravel (Artisan, Composer, NPM, etc).
- **ALÉM DE CRIAR A DOCUMENTAÇÃO, você deve configurar/ajustar o projeto para executar via Docker.** O ambiente local é padrão (apenas `php artisan serve` na porta 8000), mas para o Docker você deve:
  - Criar ou ajustar o arquivo `docker-compose.yml` (ou `compose.yml`) e o `Dockerfile`.
  - Configurar o container web/nginx na porta `8080:80`.
  - Configurar o container do banco de dados (MySQL/PostgreSQL) na porta `3308:3306` (ou `5432`).
  - **Sempre** incluir o container do **PHPMyAdmin** mapeado na porta `8085:80`.

---

# 📙 COMO_EXECUTAR.md

O arquivo `docs/COMO_EXECUTAR.md` será o guia principal e deve seguir estritamente o template abaixo (ajustando apenas o nome do projeto e substituindo os comentários pelas informações reais da aplicação):

```markdown
# Como Executar — [Nome do Projeto]

Escolha **um** guia conforme seu ambiente:

| Guia | Quando usar |
| --- | --- |
| **[COMO_EXECUTAR_LOCAL.md](COMO_EXECUTAR_LOCAL.md)** | Laragon, XAMPP ou `php artisan serve` (SQLite, sem Docker) |
| **[COMO_EXECUTAR_DOCKER.md](COMO_EXECUTAR_DOCKER.md)** | Docker Desktop (MySQL + Redis, performance otimizada) |
| [ACESSOS_TESTES.md](ACESSOS_TESTES.md) | Logins demo, URLs e fluxos de teste |

---

## Início rápido

### Local (Laragon)

```bash
cp .env.example .env
touch database/database.sqlite
composer install && npm install
php artisan key:generate && php artisan migrate --seed
npm run build && php artisan serve
```

→ http://127.0.0.1:8000

### Docker

```bash
cp .env.docker.example .env
docker compose up -d --build
docker compose exec app composer install
docker compose exec app php artisan key:generate
docker compose exec app php artisan migrate --seed
docker compose exec app npm install && npm run build
```

→ http://localhost:8080

---

## Logins demo

*(ATENÇÃO IA: Analise os seeders e configurações do projeto e preencha a tabela abaixo com os acessos demo reais. Crie as linhas necessárias para cada perfil.)*

| Perfil | E-mail | Senha |
| --- | --- | --- |
| [Nome Perfil 1] | [email 1] | [senha 1] |
| [Nome Perfil 2] | [email 2] | [senha 2] |

---

## Outros documentos

- [PLANO_IMPLEMENTACAO_CHECKLIST.md](PLANO_IMPLEMENTACAO_CHECKLIST.md) — Checklist do projeto
```

---

# 📘 COMO_EXECUTAR_DOCKER.md

O arquivo focado em Docker deve seguir a estrutura abaixo, utilizando as informações do projeto em que você está inserido. Use o modelo a seguir como referência obrigatória para as seções que devem existir:

## Stack e Containers

*(Exemplo de como você deve descrever: O ambiente Docker foi preparado para navegação local estável no Windows. Liste os containers disponíveis no `docker-compose.yml`, como `nginx` na porta `8080`, `app` rodando Laravel em PHP-FPM, `mysql` com volume persistente, `worker`, `scheduler`, etc. Explique se há mapeamento de volumes para `storage`, etc.)*

## 1) Preparar ambiente

- Instruir a copiar `.env.example` para `.env`
- Explicar sobre a necessidade de ativar o bloco de Conexão Docker no arquivo `.env` e comentar a parte Local, exemplificando a separação desta forma:

```env

APP_LOCALE=pt_BR
APP_FALLBACK_LOCALE=pt_BR
APP_FAKER_LOCALE=pt_BR

# DOCKER
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3308
DB_DATABASE=nome-do-database-db
DB_USERNAME=root_docker
DB_PASSWORD=password

# LOCAL
# DB_CONNECTION=mysql
# DB_HOST=127.0.0.1
# DB_PORT=3307
# DB_DATABASE=nome-do-database-db
# DB_USERNAME=root
# DB_PASSWORD=
```

## 2) Subir Containers

- Comando para subir a infraestrutura (ex: `docker compose up -d --build`).
- Comando para verificar o status (`docker compose ps`).

## 3) Inicialização e Migrations

- Como instalar dependências via container (ex: `docker compose exec app composer install`).
- Como gerar a chave (`php artisan key:generate`).
- Como rodar migrations e seeds (`php artisan migrate:fresh --seed`).
- Como instalar e buildar dependências de front-end (`npm install`, `npm run build`).
- Como fazer link do storage (`php artisan storage:link`). (Caso tenha)

## 4) Desenvolvimento e Cache

- Comandos para limpar cache no container (ex: `docker compose exec app php artisan optimize:clear`).

## 5) Acessos

- Detectar e listar os acessos reais do projeto (ex: URL da aplicação base, painéis, banco de dados, etc).
- Caso o sistema possua seeders que criam usuários de teste ou desenvolvedor, crie um bloco de texto listando as credenciais iniciais usando o formato abaixo:

```txt
Painel [Nome do Painel ou Perfil]
URL de login: [URL]
E-mail: [E-mail]
Senha: [Senha]
```

- Adicione sempre à lista de acessos do Docker o link do banco de dados:
`| PHPMyAdmin | http://localhost:8085 |`

## 6) Logs e Diagnóstico

- Como ver logs de todos os containers (`docker compose logs -f`).
- Como ver logs apenas da aplicação (`docker compose logs -f app`).
- Como ver o estado do Laravel (`docker compose exec app php artisan about`).

---

# 📗 COMO_EXECUTAR_LOCAL.md

O arquivo focado na execução local deve seguir uma estrutura semelhante, mas sem Docker:

## 1) Preparar ambiente

- Copiar `.env.example` para `.env`
- Configurar o banco de dados para acesso local (ex: Laragon na porta 3307).

## 2) Instalar dependências

- Executar `composer install` e `npm install`.

## 3) Inicialização e Migrations

- Gerar a chave (`php artisan key:generate`).
- Rodar banco de dados (`php artisan migrate:fresh --seed`).
- Link de storage e build (`php artisan storage:link`, `npm run build`). (Caso tenha)

## 4) Rodar aplicação

- Comandos do servidor embutido (`php artisan serve`) e frontend (`npm run dev`).

## 5) Filas / Workers (se existir)

- Comando para workers locais (`php artisan queue:work`).

## 6) Acessos

- Listar as URLs baseadas no ambiente local (geralmente porta 8000).
- Replicar a caixa `.txt` com os usuários e senhas de testes.

---

# ⚡ REGRAS FINAIS

- Explicar de forma simples e profissional.
- Os 3 arquivos devem obrigatoriamente estar dentro da pasta `docs/`.
- Foco absoluto em Laravel. Não adicionar comandos de outras linguagens.
