## REGRA PRINCIPAL — ENTREGAR SEMPRE A SOLUÇÃO MAIS SIMPLES

Faça toda a análise técnica necessária nos arquivos, configurações, Docker, portas, firewall, frontend, backend, Vite, Nginx, Apache, WSL e rede local.

Porém, depois da análise, entregue sempre a solução mais simples possível para que eu consiga acessar o projeto pelo celular.

Não complique a resposta com configurações, instalações ou alterações que não sejam realmente necessárias.

### Regras obrigatórias

1. Analise primeiro todo o projeto.
2. Identifique exatamente o que está impedindo o acesso pelo celular.
3. Escolha a solução com menos alterações possível.
4. Apresente as instruções em formato de passo a passo.
5. Envie comandos prontos para copiar e colar.
6. Informe claramente quando o terminal precisar ser executado como Administrador.
7. Não recomende instalar ferramentas quando um comando ou uma pequena configuração já resolver.
8. Não altere Docker, código, `.env`, Nginx ou Firewall sem necessidade.
9. Não apresente várias alternativas quando já existir uma solução correta e simples.
10. Não entregue explicações longas antes da solução principal.
11. Mostre primeiro o que eu realmente preciso executar.
12. Depois, apresente somente uma explicação curta do motivo.
13. Caso seja necessário testar o resultado, forneça um único teste simples.
14. Caso o primeiro passo dependa de um resultado, pare naquele passo e peça para eu enviar o retorno antes de continuar.
15. Não mande dez comandos de diagnóstico quando apenas um comando resolver.

### Exemplo de comportamento esperado

Caso o projeto já esteja configurado corretamente no Docker, o Nginx esteja publicado na porta `80` e o único problema seja o Firewall do Windows, não apresente alterações no Docker, no Nginx ou no código.

Responda desta maneira:

### Solução

Para o acesso móvel funcionar, basta abrir a porta `80` no Firewall do Windows.

#### Passo 1 — Abra o terminal como Administrador

Abra o PowerShell ou Prompt de Comando utilizando a opção:

```text
Executar como Administrador
```

#### Passo 2 — Execute o comando

```powershell
netsh advfirewall firewall add rule name="Docker Nginx Port 80" dir=in action=allow protocol=TCP localport=80
```

#### Passo 3 — Acesse pelo celular

Descubra o IPv4 do computador:

```powershell
ipconfig
```

Depois, acesse no celular:

```text
http://IP-DO-COMPUTADOR
```

Exemplo:

```text
http://192.168.1.105
```

### Teste

Confirme que o computador e o celular estão conectados à mesma rede Wi-Fi.

### Importante

Não faça nenhuma outra alteração, pois o Docker e o Nginx já estão configurados corretamente.

---

### Outro exemplo

Caso o único problema seja que o Laravel está escutando apenas em `localhost`, responda somente com os passos necessários:

### Solução

O projeto está correto, mas o Laravel precisa aceitar conexões da rede local.

#### Passo 1 — Pare o servidor atual

No terminal onde o Laravel está sendo executado, pressione:

```text
Ctrl + C
```

#### Passo 2 — Inicie o Laravel aceitando conexões da rede

```powershell
php artisan serve --host=0.0.0.0 --port=8000
```

#### Passo 3 — Descubra o IP do computador

```powershell
ipconfig
```

#### Passo 4 — Abra no celular

```text
http://IP-DO-COMPUTADOR:8000
```

Exemplo:

```text
http://192.168.1.105:8000
```

Não recomende Docker, Ngrok, Tailscale, Cloudflare Tunnel ou alterações no código se isso não for necessário.

---

### Outro exemplo com Docker

Caso a porta do Docker esteja publicada assim:

```yaml
ports:
  - "8080:80"
```

Explique de forma direta:

### Solução

O projeto já está publicado pelo Docker na porta `8080` do computador.

#### Passo 1 — Confirme que os containers estão ativos

```powershell
docker compose ps
```

#### Passo 2 — Descubra o IP do computador

```powershell
ipconfig
```

#### Passo 3 — Acesse no celular

```text
http://IP-DO-COMPUTADOR:8080
```

Exemplo:

```text
http://192.168.1.105:8080
```

Caso a porta `8080` esteja bloqueada no Firewall, execute como Administrador:

```powershell
netsh advfirewall firewall add rule name="Projeto Docker Port 8080" dir=in action=allow protocol=TCP localport=8080
```

Não altere a porta interna `80` do container, pois ela já está correta.

---

## Ordem obrigatória da resposta

Depois de analisar o projeto, responda sempre nesta ordem:

### Diagnóstico

Explique em no máximo três frases o que encontrou.

### Solução mais simples

Informe exatamente o que precisa ser feito.

### Passo 1

Primeira ação ou comando.

### Passo 2

Segunda ação ou comando, somente quando necessário.

### Passo 3

URL que deverá ser aberta no celular.

### Teste

Um teste simples para confirmar o funcionamento.

### Somente se não funcionar

Apresente no máximo dois testes adicionais diretamente relacionados ao problema encontrado.

---

## Comportamentos que devem ser evitados

Não faça o seguinte:

* Recomendar instalar programas sem necessidade;
* Recomendar Ngrok ou Cloudflare quando o acesso será somente na mesma rede;
* Recomendar Tailscale quando o celular e o computador estão na mesma rede;
* Mandar desativar completamente o Firewall;
* Alterar várias configurações ao mesmo tempo;
* Trocar portas sem existir conflito;
* Alterar o Docker Compose quando a porta já está publicada;
* Alterar Nginx quando ele já está funcionando;
* Substituir todos os `localhost` sem analisar onde cada um é utilizado;
* Mandar apagar containers, imagens ou volumes;
* Mandar executar `docker compose down -v`;
* Mandar reconstruir imagens sem necessidade;
* Apresentar comandos de Linux quando o ambiente identificado for Windows;
* Apresentar comandos genéricos sem considerar o projeto analisado;
* Mostrar alternativas demais e deixar que eu descubra qual utilizar.

## Resultado esperado

Faça uma análise completa internamente, mas apresente para mim somente:

1. O problema real encontrado;
2. A solução mais simples;
3. Os comandos prontos;
4. A ordem correta de execução;
5. A URL exata que devo abrir no celular;
6. Um teste simples para confirmar.

Caso apenas uma regra no Firewall resolva, envie apenas essa regra, o comando para descobrir o IP e a URL final.

Caso nenhuma alteração seja necessária, apenas informe como iniciar o projeto e qual endereço abrir no celular.
