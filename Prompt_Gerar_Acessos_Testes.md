# 📄 DOCUMENTAÇÃO (ACESSOS E TESTES)

🚀 PROMPT — GERAR ACESSOS DE TESTE

Você deve criar UM arquivo de documentação registrando os acessos e dados de teste deste projeto:

1. `docs/ACESSOS_TESTES.md`

*(Se a pasta `docs/` não existir, você deve criá-la).*

**ATENÇÃO:**
- Analise os Seeders do projeto (ex: `DatabaseSeeder`, `UserSeeder`) para extrair os e-mails, senhas e perfis reais que o sistema gera para testes.
- Analise também as rotas do sistema para preencher corretamente as URLs da vitrine, painéis (ex: Filament/Nova/Jetstream) e afins.
- Remova dados fixos de exemplos como "Barbearia Pro" do template e adapte para a realidade do projeto em que você está inserido.

---

# 🔑 ACESSOS_TESTES.md

O arquivo gerado deve seguir estritamente o template abaixo, mesclando todas as informações importantes (substitua o texto entre chaves/colchetes pelos dados reais da aplicação):

```markdown
# 🔐 Acessos e Dados de Teste

Utilize as credenciais abaixo para testar as diferentes visões e permissões do sistema. Todos os usuários e registros foram gerados automaticamente via *Seeders*.

## 1. Acesso ao Sistema (Usuários de Teste)

*(ATENÇÃO IA: Analise os seeders e crie a tabela abaixo com todos os usuários de teste encontrados no código)*

| Perfil | E-mail / Usuário | Senha | Permissão / Detalhes |
| --- | --- | --- | --- |
| [Nome do Perfil 1] | `[email_1]` | `[senha_1]` | [Explicação do que esse usuário pode fazer] |
| [Nome do Perfil 2] | `[email_2]` | `[senha_2]` | [Explicação do que esse usuário pode fazer] |

## 2. URLs Principais

| Ambiente | Aplicação (Home) | Login / Painel |
| --- | --- | --- |
| **Docker** | `http://localhost:8080` | `http://localhost:8080/login` |
| **Local** (`php artisan serve`) | `http://127.0.0.1:8000` | `http://127.0.0.1:8000/login` |

## 3. Vitrine Pública / Páginas para Clientes

*(ATENÇÃO IA: Adapte, adicione as rotas públicas reais do sistema ou remova caso o sistema seja apenas um painel interno fechado)*

| Item | Link (Exemplo Docker) |
| --- | --- |
| [Ex: Landing page / Tela inicial] | `http://localhost:8080/` |
| [Ex: Sitemap para SEO] | `http://localhost:8080/sitemap.xml` |

## 4. Validação do Acesso

Validação da saúde da aplicação no ambiente de desenvolvimento:

| Verificação | Resultado Esperado |
| --- | --- |
| Containers (ex: `mysql`, `app`, `nginx`) | Saudáveis / Rodando |
| Tela de login principal | HTTP `200` |
| Login com usuário de teste gerado pelo seeder | Redirecionamento para Dashboard/Painel |

## 5. Carregar Dados de Teste

Caso o banco de dados seja apagado ou precise ser resetado, basta rodar os comandos abaixo para recriar todas essas credenciais e os registros iniciais da plataforma.

**Com Docker:**
```bash
docker compose exec app php artisan migrate:fresh --seed
```

**Rodando Localmente (Sem Docker):**
```bash
php artisan migrate:fresh --seed
```

---

### 📝 Observações:
- O banco de dados geralmente é alimentado com registros retroativos e informações simuladas vinculadas a esses usuários para facilitar a visualização, filtragem na tela de relatórios e validação dos fluxos.
- Use estas credenciais **apenas** em ambiente local ou Docker de desenvolvimento.
```

---

# ⚡ REGRAS FINAIS

- Mantenha a formatação exata das tabelas.
- Puxe os dados reais (senhas, e-mails, rotas) lendo ativamente o código-fonte Laravel atual.
- O arquivo gerado deve ser salvo obrigatoriamente no caminho `docs/ACESSOS_TESTES.md`.
