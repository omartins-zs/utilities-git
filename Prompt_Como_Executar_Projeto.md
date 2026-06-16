# 📄 DOCUMENTAÇÃO — COMO EXECUTAR

## 🚀 PROMPT — GERAR E CONFIGURAR A DOCUMENTAÇÃO DE EXECUÇÃO

Você deve analisar este projeto Laravel e criar os seguintes arquivos:

1. `docs/COMO_EXECUTAR.md`
2. `docs/COMO_EXECUTAR_LOCAL.md`
3. `docs/COMO_EXECUTAR_DOCKER.md`

Se a pasta `docs/` não existir, crie-a.

---

# ⚠️ REGRAS GERAIS

- O projeto é **estritamente Laravel**.
- Utilize somente comandos relacionados ao ecossistema Laravel:
  - PHP;
  - Composer;
  - Artisan;
  - Node.js;
  - NPM;
  - Vite;
  - MySQL;
  - Redis, somente se o projeto utilizar;
  - Docker.
- Analise antes de documentar:
  - `composer.json`;
  - `package.json`;
  - `.env.example`;
  - migrations;
  - seeders;
  - rotas;
  - painéis administrativos;
  - filas;
  - storage;
  - serviços utilizados pelo projeto.
- Não invente:
  - URLs;
  - usuários;
  - senhas;
  - painéis;
  - comandos;
  - containers;
  - recursos que não existem.
- Detecte as informações reais do projeto e preencha a documentação.
- A documentação deve ser simples, visual, organizada e profissional.
- Não deixar comentários internos como `ATENÇÃO IA` nos arquivos finais.
- Não deixar textos como `[Nome do Projeto]`, `[URL]`, `[E-mail]` ou outros placeholders.
- Caso algum recurso não exista, não crie documentação falsa sobre ele.
- Use títulos, tabelas, blocos de código e divisores para deixar os arquivos fáceis de ler no Markdown.

---

# 🐳 CONFIGURAÇÃO OBRIGATÓRIA DO DOCKER

Além de criar a documentação, configure ou ajuste o projeto para executar com Docker.

Crie ou ajuste, conforme necessário:

- `Dockerfile`;
- `docker-compose.yml` ou `compose.yml`;
- configuração do Nginx;
- `.dockerignore`;
- `.env.docker.example`, caso ainda não exista.

O ambiente Docker deve possuir obrigatoriamente:

| Serviço | Configuração |
| --- | --- |
| Aplicação Laravel | PHP-FPM |
| Servidor web | Nginx |
| Aplicação no navegador | `http://localhost:8080` |
| MySQL no computador | Porta `3308` |
| MySQL dentro do Docker | Porta `3306` |
| PHPMyAdmin | `http://localhost:8085` |

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

> Dentro dos containers, o Laravel deve acessar o MySQL utilizando `DB_HOST=mysql` e `DB_PORT=3306`. A porta `3308` é utilizada somente para acessar o banco pelo computador host.

Inclua containers de `worker`, `scheduler` ou `redis` somente quando o projeto realmente utilizar esses recursos.

---

# 📙 1. COMO_EXECUTAR.md

O arquivo `docs/COMO_EXECUTAR.md` será o guia principal.

Ele deve conter obrigatoriamente as seguintes seções.

## Estrutura obrigatória

```markdown
# Como Executar — Nome Real do Projeto

Escolha **um** guia conforme seu ambiente:

| Guia | Quando usar | Requisitos no PC |
| --- | --- | --- |
| **[COMO_EXECUTAR_DOCKER.md](COMO_EXECUTAR_DOCKER.md)** | Executar o sistema utilizando containers | Docker Desktop |
| **[COMO_EXECUTAR_LOCAL.md](COMO_EXECUTAR_LOCAL.md)** | Desenvolver com Laragon, XAMPP ou Artisan | PHP, Composer, Node.js e MySQL |
| [ACESSOS_TESTES.md](ACESSOS_TESTES.md) | Logins, URLs e fluxos de teste | Apenas se o arquivo existir |

---

## Início rápido

### Local — Laragon ou XAMPP

```bash
cp .env.example .env
composer install
npm install
php artisan key:generate
php artisan migrate --seed
npm run build
php artisan serve
```

Caso o sistema utilize filas, abrir outro terminal:

```bash
php artisan queue:work
```

Aplicação:

http://127.0.0.1:8000

### Docker

```bash
cp .env.docker.example .env
docker compose up -d --build
```

Aplicação:

http://localhost:8080

---

## Logins demo

| Perfil | E-mail | Senha |
| --- | --- | --- |
| Perfil detectado | E-mail real do seeder | Senha real |

> Analise os seeders e liste os usuários de teste reais. Não invente credenciais.

---

## URLs principais

| Área | Local | Docker |
| --- | --- | --- |
| Página inicial | http://127.0.0.1:8000 | http://localhost:8080 |
| Rota encontrada | URL local real | URL Docker real |
| Painel administrativo | URL local real | URL Docker real |
| PHPMyAdmin | — | http://localhost:8085 |

> Analise as rotas e informe as principais páginas do sistema, como página pública, login, cadastro, consulta, painel administrativo ou outros módulos existentes.

---

## Outros documentos

- [PLANO_IMPLEMENTACAO_CHECKLIST.md](PLANO_IMPLEMENTACAO_CHECKLIST.md) — Checklist do projeto
- [IMPLANTACAO_EMPRESA.md](IMPLANTACAO_EMPRESA.md) — Guia de implantação
- [ACESSOS_TESTES.md](ACESSOS_TESTES.md) — Credenciais e fluxos de teste
```

Na seção **Outros documentos**, liste somente arquivos que realmente existirem dentro da pasta `docs/`.

---

# 📘 2. COMO_EXECUTAR_DOCKER.md

O arquivo `docs/COMO_EXECUTAR_DOCKER.md` deve ser focado exclusivamente na execução com Docker.

Utilize o nome real do projeto.

## Estrutura obrigatória

```markdown
# Como Executar com Docker — Nome Real do Projeto

Guia para executar o sistema utilizando Docker Desktop.

---

## Stack e containers

Criar uma tabela explicando os containers reais:

| Container | Função | Porta |
| --- | --- | --- |
| nginx | Servidor web | 8080 |
| app | Aplicação Laravel com PHP-FPM | Interna |
| mysql | Banco de dados | 3308 |
| phpmyadmin | Gerenciamento do banco | 8085 |

Adicionar `worker`, `scheduler` e `redis` somente se existirem.

---

## 1) Preparar ambiente

```bash
cp .env.docker.example .env
```

Apresentar o bloco principal do `.env` Docker:

```env
APP_URL=http://localhost:8080

APP_LOCALE=pt_BR
APP_FALLBACK_LOCALE=pt_BR
APP_FAKER_LOCALE=pt_BR

DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=nome_real_do_banco
DB_USERNAME=usuario_real_do_docker
DB_PASSWORD=senha_real_do_docker
```

> O Laravel utiliza a porta interna `3306`. A porta `3308` serve para acessar o MySQL diretamente pelo computador.

---

## 2) Subir containers

```bash
docker compose up -d --build
docker compose ps
```

---

## 3) Inicialização e migrations

Informe os comandos necessários conforme a configuração real do Docker:

```bash
docker compose exec app composer install
docker compose exec app php artisan key:generate
docker compose exec app php artisan migrate --seed
docker compose exec app npm install
docker compose exec app npm run build
```

Caso o projeto utilize arquivos públicos:

```bash
docker compose exec app php artisan storage:link
```

Caso as dependências já sejam instaladas automaticamente durante o build, explique isso e não duplique comandos desnecessários.

---

## 4) Desenvolvimento e cache

```bash
docker compose exec app php artisan optimize:clear
```

Adicione outros comandos somente se forem úteis para o projeto.

---

## 5) Acessos

Criar uma tabela com as URLs reais:

| Recurso | URL |
| --- | --- |
| Aplicação | http://localhost:8080 |
| Painel administrativo | URL real |
| PHPMyAdmin | http://localhost:8085 |

### Credenciais de teste

Criar um bloco para cada perfil encontrado nos seeders:

```txt
Nome do Painel ou Perfil
URL de login: URL real
E-mail: e-mail real
Senha: senha real
```

### Acesso ao PHPMyAdmin

```txt
URL: http://localhost:8085
Servidor: mysql
Usuário: usuário definido no Docker
Senha: senha definida no Docker
```

---

## 6) Logs e diagnóstico

```bash
docker compose logs -f
docker compose logs -f app
docker compose exec app php artisan about
```

Caso o container do Nginx, worker ou scheduler tenha outro nome, mostrar os comandos utilizando os nomes reais.

---

## 7) Parar ou reconstruir o ambiente

```bash
docker compose down
docker compose down -v
docker compose up -d --build
```

> O comando `docker compose down -v` remove os volumes e pode apagar os dados do banco.
```

---

# 📗 3. COMO_EXECUTAR_LOCAL.md

O arquivo `docs/COMO_EXECUTAR_LOCAL.md` deve seguir obrigatoriamente a estrutura abaixo.

O ambiente local deve utilizar:

- aplicação na porta `8000`;
- MySQL local na porta `3307`;
- banco MySQL;
- usuário local `root`;
- senha local vazia, salvo se o projeto informar outra configuração.

Não utilizar SQLite neste guia.

## Estrutura obrigatória

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

> Esta seção deve ser mantida exatamente com as versões acima em todos os projetos. Não detectar, substituir ou alterar o ambiente de referência.

---

## 1) Preparar ambiente

### 1.1 Clonar ou acessar o projeto

```bash
cd c:/laragon/www/nome-real-da-pasta
```

Utilize o nome real da pasta do projeto.

### 1.2 Copiar variáveis de ambiente

```bash
cp .env.example .env
```

No PowerShell:

```powershell
Copy-Item .env.example .env
```

### 1.3 Configurar banco de dados no Laragon

Utilize como nome do banco o nome real definido pelo projeto.

Crie o banco pelo HeidiSQL, PHPMyAdmin ou execute:

```sql
CREATE DATABASE nome_real_do_banco
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
```

Configure o `.env`:

```env
APP_URL=http://127.0.0.1:8000

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3307
DB_DATABASE=nome_real_do_banco
DB_USERNAME=root
DB_PASSWORD=

QUEUE_CONNECTION=database
MAIL_MAILER=log
```

> Neste projeto, o MySQL local deve ser configurado na porta **3307**, com usuário `root` e senha vazia, salvo se existir uma configuração local diferente já definida.

Caso o projeto não utilize fila com banco de dados ou não utilize `MAIL_MAILER=log`, ajuste os valores conforme a configuração real.

---

## 2) Instalar dependências

```bash
composer install
npm install
```

Caso o projeto não possua `package.json`, não incluir o comando `npm install`.

---

## 3) Inicialização e migrations

```bash
php artisan key:generate
php artisan migrate --seed
npm run build
```

Caso utilize arquivos públicos:

```bash
php artisan storage:link
```

Caso o projeto exija reconstrução completa do banco durante o desenvolvimento:

```bash
php artisan migrate:fresh --seed
```

> O comando `migrate:fresh` apaga todas as tabelas e dados existentes antes de executar novamente as migrations.

---

## 4) Rodar aplicação

```bash
php artisan serve
```

Aplicação:

http://127.0.0.1:8000

Para desenvolvimento do frontend, em outro terminal:

```bash
npm run dev
```

---

## 5) Filas e workers

Caso o projeto utilize filas:

```bash
php artisan queue:work
```

Se existir uma fila específica, informe o comando real.

Caso o projeto não utilize filas:

> Este projeto não exige um worker de filas para a execução básica.

---

## 6) Acessos

Criar uma tabela com as URLs reais encontradas nas rotas:

| Recurso | URL |
| --- | --- |
| Página inicial | http://127.0.0.1:8000 |
| Página pública principal | URL real |
| Login | URL real |
| Painel administrativo | URL real |

### Credenciais de teste

Analise os seeders e crie um bloco para cada perfil:

```txt
Painel Administrativo
URL de login: http://127.0.0.1:8000/admin
E-mail: e-mail real
Senha: senha real
```

```txt
Nome do segundo perfil
URL de login: URL real
E-mail: e-mail real
Senha: senha real
```

Não utilizar credenciais de exemplo quando elas não existirem no projeto.

---

## 7) Comandos úteis

```bash
php artisan optimize:clear
php artisan route:list
php artisan migrate:status
php artisan about
php artisan test
```

Adicionar comandos de filas, scheduler ou ferramentas específicas somente quando existirem no projeto.

---

## 8) Problemas comuns

### Erro de conexão com o banco

Verificar se o MySQL está iniciado e se o `.env` utiliza:

```env
DB_HOST=127.0.0.1
DB_PORT=3307
```

### Chave da aplicação não definida

```bash
php artisan key:generate
```

### Alterações no `.env` não foram aplicadas

```bash
php artisan optimize:clear
```

### Erro de assets ou Vite Manifest

```bash
npm install
npm run build
```

### Tabelas não encontradas

```bash
php artisan migrate --seed
```

Adicione outros problemas somente quando forem relevantes para o projeto.

---

## Próximo passo

Para executar o sistema em ambiente containerizado, consulte [COMO_EXECUTAR_DOCKER.md](COMO_EXECUTAR_DOCKER.md).
```

---

# ✅ VALIDAÇÃO FINAL

Antes de finalizar:

1. Confirmar que os três arquivos foram criados dentro de `docs/`.
2. Confirmar que o nome real do projeto foi utilizado.
3. Confirmar que não existem placeholders nos arquivos finais.
4. Confirmar que os acessos foram retirados dos seeders.
5. Confirmar que as URLs foram retiradas das rotas reais.
6. Confirmar que o ambiente local utiliza MySQL na porta `3307`.
7. Confirmar que o Docker expõe o MySQL como `3308:3306`.
8. Confirmar que o Laravel dentro do Docker utiliza `DB_PORT=3306`.
9. Confirmar que o PHPMyAdmin está disponível na porta `8085`.
10. Confirmar que a aplicação local utiliza a porta `8000`.
11. Confirmar que a aplicação Docker utiliza a porta `8080`.
12. Confirmar que o Docker foi realmente configurado, e não apenas documentado.
13. Confirmar que os comandos apresentados funcionam com os nomes reais dos containers.
14. Confirmar que o ambiente de referência foi mantido exatamente como definido neste prompt.
15. Não apagar arquivos ou configurações existentes sem necessidade.

---

# ⚡ RESULTADO ESPERADO

Ao terminar:

- crie ou atualize os três arquivos Markdown;
- configure ou ajuste o Docker;
- mantenha a documentação curta e fácil de seguir;
- não gere explicações excessivas;
- não crie recursos inexistentes;
- apresente um resumo curto dos arquivos criados e das configurações realizadas.
