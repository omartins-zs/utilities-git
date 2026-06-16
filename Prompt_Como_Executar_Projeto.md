# 📄 DOCUMENTAÇÃO E AMBIENTE — LARAVEL LOCAL + DOCKER

## 🚀 PROMPT — PADRONIZAR `.ENV`, DOCKER E DOCUMENTAÇÃO DE EXECUÇÃO

Você é um arquiteto de software sênior especialista em **Laravel, Docker, DevOps e ambientes híbridos**.

Sua tarefa é analisar este projeto Laravel e deixá-lo preparado para funcionar em dois modos:

1. **LOCAL**, utilizando Laragon, XAMPP ou `php artisan serve`;
2. **DOCKER**, utilizando Docker Compose.

A troca entre os ambientes deve acontecer apenas comentando e descomentando blocos no arquivo `.env`.

Não criar verificações manuais dentro do código PHP para descobrir o ambiente.

---

# 📦 ARQUIVOS QUE DEVEM SER CRIADOS OU AJUSTADOS

## Documentação

Criar obrigatoriamente:

1. `docs/COMO_EXECUTAR.md`
2. `docs/COMO_EXECUTAR_LOCAL.md`
3. `docs/COMO_EXECUTAR_DOCKER.md`

Se a pasta `docs/` não existir, crie-a.

## Ambiente

Criar ou ajustar, conforme necessário:

- `.env.example`;
- `.env`;
- `.dockerignore`;
- `Dockerfile`;
- `docker-compose.yml` ou `compose.yml`;
- configuração do Nginx.

Não criar um segundo arquivo de ambiente somente para Docker.

O projeto deve utilizar o mesmo `.env` nos dois modos, alternando apenas os blocos **LOCAL** e **DOCKER**.

---

# ⚠️ REGRAS GERAIS

- O projeto é **estritamente Laravel**.
- Trabalhe somente com o ecossistema utilizado pelo projeto:
  - PHP;
  - Laravel;
  - Composer;
  - Artisan;
  - Node.js;
  - NPM;
  - Vite;
  - MySQL;
  - Docker;
  - Redis, filas, scheduler ou Mailpit somente quando existirem.
- Analise antes de alterar:
  - `composer.json`;
  - `package.json`;
  - `.env`;
  - `.env.example`;
  - migrations;
  - seeders;
  - rotas;
  - painéis administrativos;
  - filas;
  - scheduler;
  - cache;
  - e-mails;
  - storage;
  - arquivos Docker existentes.
- Reaproveite e melhore a estrutura existente.
- Não apagar configurações funcionais sem necessidade.
- Não alterar regras de negócio.
- Não inventar:
  - URLs;
  - usuários;
  - senhas;
  - painéis;
  - containers;
  - filas;
  - serviços;
  - comandos;
  - recursos inexistentes.
- Não deixar placeholders nos documentos finais.
- Não deixar comentários internos como `ATENÇÃO IA`.
- Preserve valores sensíveis já existentes no `.env`.
- Nunca substituir ou apagar uma `APP_KEY` válida.
- O `.env.example` não deve conter segredos reais.
- A documentação deve ser simples, profissional, visual e sem textos excessivos.

---

# 🔄 PADRÃO OBRIGATÓRIO DO `.ENV`

O `.env.example` e o `.env` devem ser organizados com dois blocos:

- `# LOCAL`;
- `# DOCKER`.

Somente um bloco pode ficar ativo por vez.

Por padrão, deixe o bloco **LOCAL ativo** e o bloco **DOCKER comentado**, pois o ambiente principal de desenvolvimento utiliza Laragon.

Não colocar muitos comentários no `.env`. Utilize somente divisões curtas e claras.

## Exemplo obrigatório — LOCAL ativo

Adapte os nomes do banco, usuários e serviços conforme o projeto real:

```env
# LOCAL
APP_URL=http://127.0.0.1:8000

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3307
DB_DATABASE=nome_real_do_banco
DB_USERNAME=root
DB_PASSWORD=

# DOCKER
# APP_URL=http://localhost:8080
#
# DB_CONNECTION=mysql
# DB_HOST=mysql
# DB_PORT=3306
# DB_DATABASE=nome_real_do_banco
# DB_USERNAME=usuario_docker
# DB_PASSWORD=senha_docker
```

## Exemplo obrigatório — DOCKER ativo

A documentação Docker deve mostrar o bloco invertido:

```env
# LOCAL
# APP_URL=http://127.0.0.1:8000
#
# DB_CONNECTION=mysql
# DB_HOST=127.0.0.1
# DB_PORT=3307
# DB_DATABASE=nome_real_do_banco
# DB_USERNAME=root
# DB_PASSWORD=

# DOCKER
APP_URL=http://localhost:8080

DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=nome_real_do_banco
DB_USERNAME=usuario_docker
DB_PASSWORD=senha_docker
```

## Regras das portas

| Ambiente | Host do banco | Porta do Laravel |
| --- | --- | --- |
| Local | `127.0.0.1` | `3307` |
| Docker | `mysql` | `3306` |

No `docker-compose.yml`, o MySQL deve ser exposto assim:

```yaml
ports:
  - "3308:3306"
```

Isso significa:

- Laravel local acessa o MySQL do Laragon pela porta `3307`;
- Laravel dentro do Docker acessa o serviço `mysql` pela porta interna `3306`;
- o computador host acessa o MySQL do Docker pela porta `3308`.

## Outros serviços

Caso existam Redis, Mailpit, filas ou outros serviços, aplique o mesmo padrão.

Exemplo:

```env
# LOCAL
CACHE_STORE=file
QUEUE_CONNECTION=database
MAIL_MAILER=log

# DOCKER
# CACHE_STORE=redis
# QUEUE_CONNECTION=redis
# REDIS_HOST=redis
# REDIS_PORT=6379
# MAIL_MAILER=smtp
# MAIL_HOST=mailpit
# MAIL_PORT=1025
```

Com Docker ativo:

```env
# LOCAL
# CACHE_STORE=file
# QUEUE_CONNECTION=database
# MAIL_MAILER=log

# DOCKER
CACHE_STORE=redis
QUEUE_CONNECTION=redis
REDIS_HOST=redis
REDIS_PORT=6379
MAIL_MAILER=smtp
MAIL_HOST=mailpit
MAIL_PORT=1025
```

Somente inclua variáveis de Redis, Mailpit, filas, cache ou outros serviços quando eles realmente forem utilizados.

Depois de alterar o bloco ativo, limpar as configurações:

### Local

```bash
php artisan optimize:clear
```

### Docker

```bash
docker compose exec app php artisan optimize:clear
```

---

# 🐳 CONFIGURAÇÃO OBRIGATÓRIA DO DOCKER

Além da documentação, configure o projeto para realmente funcionar via Docker.

## Serviços obrigatórios

| Serviço | Função | Porta no computador |
| --- | --- | --- |
| `app` | Laravel com PHP-FPM | Interna |
| `nginx` | Servidor web | `8080` |
| `mysql` | Banco de dados | `3308` |
| `phpmyadmin` | Administração do banco | `8085` |

Mapeamentos obrigatórios:

```yaml
nginx:
  ports:
    - "8080:80"

mysql:
  ports:
    - "3308:3306"

phpmyadmin:
  ports:
    - "8085:80"
```

O PHPMyAdmin deve acessar o banco utilizando:

```env
PMA_HOST=mysql
PMA_PORT=3306
```

## Serviços opcionais

Criar somente quando o projeto utilizar:

- `redis`;
- `mailpit`;
- `worker`;
- `scheduler`.

O worker e o scheduler devem reutilizar a mesma imagem do container `app`.

## Docker Compose

O Compose deve:

- utilizar o mesmo `.env` do projeto;
- utilizar `env_file: .env` quando necessário;
- evitar valores duplicados e hardcoded;
- utilizar volumes persistentes para o MySQL;
- configurar healthcheck do banco;
- iniciar serviços na ordem correta;
- sincronizar as configurações com o `.env`;
- utilizar nomes claros para os serviços;
- manter a aplicação acessível em `http://localhost:8080`;
- manter o PHPMyAdmin em `http://localhost:8085`.

## Dockerfile

O Dockerfile deve ser criado para Laravel e conter apenas o necessário:

- PHP compatível;
- extensões PHP exigidas pelo projeto;
- Composer;
- Node.js e NPM, quando necessários para os assets;
- configuração adequada de permissões para:
  - `storage`;
  - `bootstrap/cache`.

Não usar imagens ou ferramentas de outras stacks.

---

# 📙 1. `docs/COMO_EXECUTAR.md`

Este será o guia principal e deve possuir a seguinte estrutura:

```markdown
# Como Executar — Nome Real do Projeto

Escolha **um** guia conforme seu ambiente:

| Guia | Quando usar | Requisitos no PC |
| --- | --- | --- |
| **[COMO_EXECUTAR_DOCKER.md](COMO_EXECUTAR_DOCKER.md)** | Executar em qualquer máquina com containers | Docker Desktop |
| **[COMO_EXECUTAR_LOCAL.md](COMO_EXECUTAR_LOCAL.md)** | Desenvolver com Laragon, XAMPP ou Artisan | PHP, Composer, Node.js e MySQL |
| [ACESSOS_TESTES.md](ACESSOS_TESTES.md) | Logins, URLs e fluxos de teste | Somente se existir |

---

## Início rápido

### Local — Laragon ou XAMPP

Ative o bloco `LOCAL` no `.env` e execute:

```bash
cp .env.example .env
composer install
npm install
php artisan key:generate
php artisan migrate --seed
npm run build
php artisan serve
```

Caso existam filas:

```bash
php artisan queue:work
```

Aplicação:

http://127.0.0.1:8000

### Docker

Ative o bloco `DOCKER` no `.env` e execute:

```bash
cp .env.example .env
docker compose up -d --build
```

Aplicação:

http://localhost:8080

---

## Logins demo

| Perfil | E-mail | Senha |
| --- | --- | --- |
| Perfil real | E-mail real do seeder | Senha real |

> Analise os seeders e apresente somente credenciais que realmente existirem.

---

## URLs principais

| Área | Local | Docker |
| --- | --- | --- |
| Página inicial | http://127.0.0.1:8000 | http://localhost:8080 |
| Rota principal encontrada | URL local real | URL Docker real |
| Painel administrativo | URL local real | URL Docker real |
| PHPMyAdmin | — | http://localhost:8085 |

Liste as principais rotas reais do sistema.

---

## Outros documentos

- [PLANO_IMPLEMENTACAO_CHECKLIST.md](PLANO_IMPLEMENTACAO_CHECKLIST.md) — Checklist do projeto
- [IMPLANTACAO_EMPRESA.md](IMPLANTACAO_EMPRESA.md) — Guia de implantação
- [ACESSOS_TESTES.md](ACESSOS_TESTES.md) — Credenciais e fluxos de teste
```

Na seção **Outros documentos**, listar somente arquivos que realmente existirem.

---

# 📗 2. `docs/COMO_EXECUTAR_LOCAL.md`

O arquivo local deve seguir obrigatoriamente esta estrutura:

```markdown
# Como Executar Localmente — Nome Real do Projeto

Guia para rodar **sem Docker**, no **Laragon**, **XAMPP** ou com `php artisan serve`.

> **Não quer instalar PHP, Composer ou Node?** Use [COMO_EXECUTAR_DOCKER.md](COMO_EXECUTAR_DOCKER.md) — basta Docker Desktop, em qualquer Windows, Mac ou Linux.

---

## Requisitos

Para rodar localmente, você **não precisa** de uma versão específica do Laragon nem instalar o Laravel globalmente.

O essencial é **Composer** + **PHP** compatível — o framework entra no projeto com `composer install`.

Laragon, XAMPP ou `php artisan serve` são apenas formas de subir o ambiente.

| Ferramenta | Obrigatório? | Versão mínima |
| --- | --- | --- |
| **Composer** | Sim | 2.x |
| **PHP** | Sim | 8.3+ |
| **Node.js** | Sim (assets) | 18+ |
| **NPM** | Sim (assets) | 9+ |
| **MySQL** | Sim | 8.0+ |

Extensões PHP necessárias: `pdo_mysql`, `mbstring`, `openssl`, `tokenizer`, `xml`, `ctype`, `json`, `bcmath`.

### Ambiente de referência (máquina de desenvolvimento)

Stack usada na elaboração deste projeto — **não é requisito fixo**, só referência do que já foi testado:

| Ferramenta | Versão |
| --- | --- |
| **Laragon** | **6.0.0** |
| PHP (via Laragon) | 8.4.6 |
| Composer | 2.8.12 |
| Laravel (no projeto) | 13.15.0 |
| **Node.js** | **22.14.0+** |
| **NPM** | **11.4.2+** |

Para conferir no seu computador:

```bash
php -v
php artisan --version
composer --version
node -v
npm -v
```

> Manter esta seção e essas versões exatamente como estão. Não detectar, substituir ou alterar o ambiente de referência.

---

## 1) Preparar ambiente

### 1.1 Clonar ou acessar o projeto

```bash
cd c:/laragon/www/nome-real-da-pasta
```

Use o nome real da pasta.

### 1.2 Copiar variáveis de ambiente

```bash
cp .env.example .env
```

No PowerShell:

```powershell
Copy-Item .env.example .env
```

### 1.3 Ativar o ambiente local

Deixe o bloco `LOCAL` ativo e o bloco `DOCKER` comentado no `.env`.

Mostrar o bloco real do projeto seguindo este formato:

```env
# LOCAL
APP_URL=http://127.0.0.1:8000

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3307
DB_DATABASE=nome_real_do_banco
DB_USERNAME=root
DB_PASSWORD=

# DOCKER
# APP_URL=http://localhost:8080
#
# DB_CONNECTION=mysql
# DB_HOST=mysql
# DB_PORT=3306
# DB_DATABASE=nome_real_do_banco
# DB_USERNAME=usuario_docker
# DB_PASSWORD=senha_docker
```

### 1.4 Criar o banco de dados

Crie o banco pelo HeidiSQL, PHPMyAdmin ou execute:

```sql
CREATE DATABASE nome_real_do_banco
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
```

> No ambiente local, utilizar MySQL na porta **3307**, usuário `root` e senha vazia.

---

## 2) Instalar dependências

```bash
composer install
npm install
```

Não incluir `npm install` caso o projeto não possua `package.json`.

---

## 3) Inicialização e migrations

```bash
php artisan key:generate
php artisan migrate --seed
npm run build
```

Quando necessário:

```bash
php artisan storage:link
```

Para recriar todo o banco:

```bash
php artisan migrate:fresh --seed
```

> `migrate:fresh` apaga os dados existentes.

---

## 4) Rodar aplicação

```bash
php artisan serve
```

Aplicação:

http://127.0.0.1:8000

Para desenvolvimento dos assets:

```bash
npm run dev
```

---

## 5) Filas e workers

Se existirem filas:

```bash
php artisan queue:work
```

Caso não existam, informar apenas que o projeto não exige worker.

---

## 6) Acessos

| Recurso | URL |
| --- | --- |
| Página inicial | http://127.0.0.1:8000 |
| Página principal real | URL real |
| Login | URL real |
| Painel administrativo | URL real |

### Credenciais de teste

Criar um bloco para cada perfil real encontrado:

```txt
Nome do painel ou perfil
URL de login: URL real
E-mail: e-mail real
Senha: senha real
```

---

## 7) Comandos úteis

```bash
php artisan optimize:clear
php artisan route:list
php artisan migrate:status
php artisan about
php artisan test
```

---

## 8) Problemas comuns

### Banco não conecta

```env
DB_HOST=127.0.0.1
DB_PORT=3307
```

### Alterações do `.env` não foram aplicadas

```bash
php artisan optimize:clear
```

### Chave não configurada

```bash
php artisan key:generate
```

### Assets não encontrados

```bash
npm install
npm run build
```

### Tabelas não encontradas

```bash
php artisan migrate --seed
```

---

## Próximo passo

Para ambiente containerizado, consulte [COMO_EXECUTAR_DOCKER.md](COMO_EXECUTAR_DOCKER.md).
```

---

# 📘 3. `docs/COMO_EXECUTAR_DOCKER.md`

O arquivo Docker deve seguir obrigatoriamente esta estrutura:

```markdown
# Como Executar com Docker — Nome Real do Projeto

Guia para executar o sistema utilizando Docker Desktop.

---

## Stack e containers

| Container | Função | Porta |
| --- | --- | --- |
| nginx | Servidor web | 8080 |
| app | Laravel com PHP-FPM | Interna |
| mysql | Banco de dados | 3308 |
| phpmyadmin | Administração do banco | 8085 |

Adicionar Redis, Mailpit, worker ou scheduler somente quando existirem.

---

## 1) Preparar ambiente

```bash
cp .env.example .env
```

Deixe o bloco `DOCKER` ativo e o bloco `LOCAL` comentado:

```env
# LOCAL
# APP_URL=http://127.0.0.1:8000
#
# DB_CONNECTION=mysql
# DB_HOST=127.0.0.1
# DB_PORT=3307
# DB_DATABASE=nome_real_do_banco
# DB_USERNAME=root
# DB_PASSWORD=

# DOCKER
APP_URL=http://localhost:8080

DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=nome_real_do_banco
DB_USERNAME=usuario_docker
DB_PASSWORD=senha_docker
```

> Dentro do Docker, utilizar `DB_HOST=mysql` e `DB_PORT=3306`. A porta `3308` é somente para acesso pelo computador host.

---

## 2) Subir containers

```bash
docker compose up -d --build
docker compose ps
```

---

## 3) Inicialização e migrations

Caso o Dockerfile ou entrypoint ainda não execute automaticamente:

```bash
docker compose exec app composer install
docker compose exec app php artisan key:generate
docker compose exec app php artisan migrate --seed
docker compose exec app npm install
docker compose exec app npm run build
```

Quando necessário:

```bash
docker compose exec app php artisan storage:link
```

Não duplicar comandos que já sejam executados automaticamente.

---

## 4) Desenvolvimento e cache

```bash
docker compose exec app php artisan optimize:clear
```

---

## 5) Acessos

| Recurso | URL |
| --- | --- |
| Aplicação | http://localhost:8080 |
| Painel administrativo | URL real |
| PHPMyAdmin | http://localhost:8085 |

### Credenciais de teste

```txt
Nome do painel ou perfil
URL de login: URL real
E-mail: e-mail real
Senha: senha real
```

### PHPMyAdmin

```txt
URL: http://localhost:8085
Servidor: mysql
Usuário: usuário configurado no Docker
Senha: senha configurada no Docker
```

---

## 6) Logs e diagnóstico

```bash
docker compose logs -f
docker compose logs -f app
docker compose exec app php artisan about
```

Adicionar logs de Nginx, worker, scheduler ou Redis somente quando existirem.

---

## 7) Parar ou reconstruir

```bash
docker compose down
docker compose up -d --build
```

Para apagar também os volumes:

```bash
docker compose down -v
```

> O comando `docker compose down -v` pode apagar os dados do banco.
```

---

# 🧪 VALIDAÇÃO OBRIGATÓRIA

Antes de finalizar, valide:

1. Os três arquivos foram criados em `docs/`.
2. O projeto funciona localmente.
3. O projeto funciona com `docker compose up -d --build`.
4. O mesmo `.env` permite alternar entre LOCAL e DOCKER.
5. Apenas um bloco do `.env` fica ativo por vez.
6. O ambiente local utiliza:
   - `APP_URL=http://127.0.0.1:8000`;
   - `DB_HOST=127.0.0.1`;
   - `DB_PORT=3307`.
7. O ambiente Docker utiliza:
   - `APP_URL=http://localhost:8080`;
   - `DB_HOST=mysql`;
   - `DB_PORT=3306`.
8. O Compose expõe o MySQL como `3308:3306`.
9. O Nginx está disponível em `http://localhost:8080`.
10. O PHPMyAdmin está disponível em `http://localhost:8085`.
11. O banco conecta nos dois ambientes.
12. Redis, Mailpit, filas, worker e scheduler funcionam quando existirem.
13. O `.env.example` não contém segredos reais.
14. A `APP_KEY` existente não foi apagada.
15. As credenciais de teste vieram dos seeders.
16. As URLs vieram das rotas reais.
17. Não existem placeholders nos documentos finais.
18. Os nomes dos containers usados nos comandos são os nomes reais do Compose.
19. O ambiente de referência foi mantido exatamente como definido.
20. Nenhum serviço desnecessário foi criado.

Caso seja possível executar comandos no ambiente, realize as validações na prática.

Caso alguma validação não possa ser executada, informe isso claramente no resumo final, sem afirmar que foi testada.

---

# 🎯 RESULTADO ESPERADO

Ao terminar:

- criar ou atualizar `.env.example`;
- ajustar o `.env` sem apagar segredos ou a `APP_KEY`;
- criar ou ajustar `Dockerfile`;
- criar ou ajustar `docker-compose.yml` ou `compose.yml`;
- criar ou ajustar a configuração do Nginx;
- criar ou ajustar `.dockerignore`;
- criar os três arquivos em `docs/`;
- garantir alternância simples entre LOCAL e DOCKER;
- utilizar apenas serviços necessários;
- manter tudo sincronizado com o `.env`;
- apresentar um resumo curto dos arquivos alterados;
- informar os testes realmente executados;
- informar qualquer ponto que não pôde ser validado.
