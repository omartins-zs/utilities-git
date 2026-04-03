# Performance_Otimizacao_Docker

## Objetivo
Criar uma auditoria e otimização completa de performance para aplicações web em Docker, com foco especial em Laravel/PHP-FPM/Nginx, ambiente local no Windows com Docker Desktop, volumes montados, cache de framework, PHP opcaches, bootstrap de containers e estabilidade do upstream.

Este prompt deve ser usado para pedir que uma IA analise o projeto atual, identifique gargalos reais e aplique otimizações seguras, práticas e reutilizáveis, sem fazer mudanças cosméticas desnecessárias.

---

## Prompt

```text
Analise profundamente a infraestrutura Docker e a performance local desta aplicação web e aplique otimizações reais e seguras.

Quero que você trate isso como uma revisão de performance de ambiente + runtime, não como simples ajuste superficial.

## Objetivo principal
Melhorar tempo de resposta entre telas, reduzir lentidão local, diminuir gargalos de bootstrap do container e tornar a navegação mais estável e rápida, principalmente em ambiente Docker Desktop no Windows.

## O que analisar primeiro
Antes de alterar qualquer coisa, faça um diagnóstico do ambiente atual e identifique:

- APP_ENV
- APP_DEBUG
- se config/routes/views/events estão cacheados ou não
- driver de sessão
- driver de cache
- driver de queue
- uso de volume montado no Windows
- existência de gargalo de php-fpm (ex.: pm.max_children baixo)
- configuração real de opcache
- realpath cache
- tempo de boot do container app
- tempo de resposta das rotas mais importantes, especialmente:
  - /
  - /login
  - dashboard autenticado
- possíveis 502 do nginx ao reiniciar ou recriar containers
- se o nginx está prendendo IP antigo do container PHP
- se o container está bloqueando startup por aquecimento excessivo de cache

## Requisitos do trabalho
Você deve:

1. analisar a estrutura Docker atual
2. identificar gargalos de runtime e cold start
3. propor e aplicar melhorias seguras
4. preservar o que já estiver melhor que o padrão
5. evitar simplificações que piorem estabilidade
6. organizar configs em estrutura reutilizável, por exemplo:
   - docker/nginx/default.conf
   - docker/php/local.ini ou php.ini
   - docker/php/fpm-performance.conf
   - docker/scripts/start-app.sh
7. documentar claramente o que foi mudado e por quê

## Diretrizes obrigatórias

- não apenas diga o que fazer; aplique as mudanças
- não destrua o ambiente existente sem necessidade
- se já houver uma configuração melhor que o padrão simples, preserve e refine
- trate o problema como performance real de ambiente, não apenas de código
- se houver Docker Desktop no Windows com bind mount, considere isso explicitamente
- priorize estabilidade final do ambiente, não só benchmark artificial

## Pontos que você deve revisar e otimizar

### 1. Laravel / App runtime
Verifique e ajuste quando fizer sentido:
- APP_DEBUG=false para navegação local mais estável
- config cache
- route cache
- view cache quando apropriado
- limpeza e reaquecimento consciente de cache
- locale e timezone corretos
- evitar que config de ambiente local contamine ambiente de teste

### 2. Sessão e cache
Analise se o driver atual de sessão está gerando I/O excessivo.
Considere:
- file
- cookie
- redis
- database

Escolha a alternativa mais adequada para performance local e explique a decisão.
Se a extensão Redis não estiver instalada, não force solução quebrada.

### 3. PHP-FPM
Revise e otimize:
- pm
- pm.max_children
- pm.start_servers
- pm.min_spare_servers
- pm.max_spare_servers
- pm.max_requests
- request_terminate_timeout
- process idle timeout

Se houver logs como “server reached pm.max_children”, trate isso como gargalo real.

### 4. PHP ini / runtime
Revise e ajuste:
- memory_limit
- max_execution_time
- post_max_size
- upload_max_filesize
- error_reporting
- display_errors
- log_errors
- date.timezone
- realpath_cache_size
- realpath_cache_ttl
- opcache.enable
- opcache.enable_cli
- opcache.memory_consumption
- opcache.max_accelerated_files
- opcache.validate_timestamps
- opcache.revalidate_freq

Se o ambiente for local com Docker no Windows, considere desligar validate_timestamps se isso fizer sentido para performance, deixando claro que reinício do container pode ser necessário após mudanças em PHP/backend.

### 5. Nginx
Revise e ajuste:
- upstream fastcgi para app:9000
- fastcgi_param SCRIPT_FILENAME
- logs
- root correto do Laravel
- try_files
- resolver do Docker
- resolver_timeout
- prevenção de 502 após recreate do app

Não volte para uma config simplista se ela piorar estabilidade.
Se o resolver dinâmico for necessário para evitar nginx preso em IP antigo do container, mantenha isso.

### 6. Bootstrap do container app
Revise o comando/CMD/entrypoint do container app.
Se houver script de startup, melhore para:
- esperar banco ficar pronto
- esperar tabelas mínimas quando necessário
- aquecer caches só se estiverem ausentes
- evitar bloquear o php-fpm a cada restart com rebuild completo de cache
- subir rápido e aquecer de forma inteligente

### 7. Docker Compose
Revise:
- volumes
- env_file
- environment
- depends_on
- organização entre app, queue, scheduler, nginx, postgres, redis, vite
- se há melhoria simples e segura para ambiente local

### 8. Performance prática
Depois das alterações, valide de forma objetiva:
- tempo do /login
- tempo do /
- tempo do dashboard autenticado
- status dos containers
- php artisan about
- verificação de config/routes cache
- logs do app/nginx

Se a primeira requisição após restart continuar lenta, deixe isso explícito como cold start, mas otimize ao máximo o comportamento pós-aquecimento.

## Estrutura desejada
Se necessário, crie ou ajuste arquivos como:
- docker/nginx/default.conf
- docker/php/local.ini
- docker/php/fpm-performance.conf
- docker/scripts/start-app.sh
- Dockerfile
- docker-compose.yml
- .env.example

## Resultado esperado
No final eu quero:
- ambiente Docker mais rápido
- menos lentidão entre telas
- menos risco de 502 após restart/recreate
- php-fpm mais saudável
- cache do framework bem configurado
- bootstrap mais inteligente
- configs organizadas em pastas reutilizáveis
- explicação clara do que foi mudado

## Entrega final
Quero que você entregue:
1. resumo objetivo dos gargalos encontrados
2. lista das alterações aplicadas
3. arquivos modificados
4. resultado de validação
5. observações honestas sobre limitações reais, especialmente em Docker Desktop no Windows
```

---

## Observacoes praticas para reaproveitar

Este prompt funciona especialmente bem para projetos com:
- Laravel + PHP-FPM + Nginx
- PostgreSQL ou MySQL
- Redis opcional
- Docker Compose local
- ambiente Windows com bind mount
- apps que ficam lentos ao navegar entre telas mesmo sem problema grave no frontend

### Sinais reais de gargalo que esse prompt ajuda a atacar
- navegacao entre telas levando varios segundos
- `APP_DEBUG=true` em ambiente local pesado
- `config` e `routes` sem cache
- `SESSION_DRIVER=file` ou `database` causando I/O excessivo
- `php-fpm` com poucos workers
- `nginx` com `502 Bad Gateway` apos restart do `app`
- startup do container lento porque reconstrói cache toda vez
- primeira requisicao muito lenta apos subir containers

### Adaptacao rapida para outros stacks
Se o projeto nao for Laravel, voce pode trocar no prompt:
- `php artisan about` por comandos equivalentes do framework
- `config:cache/route:cache/view:cache` por mecanismos equivalentes
- `php-fpm` por outro runtime, se aplicavel

---

## Dica de uso
Use esse prompt em projetos novos ou legados e peça sempre:
- diagnostico primeiro
- alteracoes depois
- validacao objetiva no final

Assim voce evita respostas genericas e força a IA a tratar performance como engenharia real de ambiente.
