# Padrões de Log e Response — Laravel / Lumen

Referência rápida de padrões usados em projetos de microserviços.

---

## Logs com Emojis (Laravel Log)

Padrão visual para facilitar leitura nos logs. Use emojis como prefixo para identificar rapidamente o tipo e status da operação.

### Referência de Emojis por Contexto

| Emoji | Significado           |
|-------|-----------------------|
| 🟢    | Entrada / início OK   |
| 🟡    | Processamento / aviso |
| 🔴    | Erro de validação     |
| ❌    | Erro / exceção        |
| ✅    | Sucesso               |
| 📄    | Arquivo / documento   |
| 📦    | Dados / payload       |
| 🔁    | Retry / reprocessamento |
| 🚀    | Envio / disparo       |

---

## Padrão 1 — Controller com Log de entrada e erro

```php
public function store(ExemploRequest $request): JsonResponse
{
    Log::info('🟢 ExemploController@store recebido', $request->all());

    try {
        $result = $this->exemploService->processar($request);

        return response()->json([
            'status'  => 'success',
            'message' => 'Operação realizada com sucesso.',
            'data'    => $result,
        ]);
    } catch (\Exception $e) {
        Log::error('❌ ExemploController@store erro', [
            'message' => $e->getMessage(),
            'trace'   => $e->getTraceAsString(),
        ]);

        return response()->json([
            'status'  => 'error',
            'message' => 'Erro ao processar: ' . $e->getMessage(),
        ], 500);
    }
}
```

---

## Padrão 2 — Log sequencial em fluxo de validação/processamento

Útil para rastrear passo a passo dentro de um service ou helper.

```php
Log::info('🟡 Validando arquivos...');

// após validação
Log::error('🔴 Erro na validação', ['erro' => $validatedData['error']]);

// ao receber arquivo
Log::info("📄 Arquivo recebido: {$originalName} -> Formatado: {$formattedName}");

// após salvar no storage
Log::info('✅ Arquivo salvo no S3 com sucesso.', ['url' => $url]);
```

---

## Padrão 3 — Log em chamadas HTTP externas (APIs de terceiros)

Ideal para helpers que consomem APIs externas (OCR, pagamentos, etc.).

```php
try {
    $response = Http::asMultipart()
        ->withHeaders(['api-key' => $apiKey])
        ->timeout(120)
        ->post($apiUrl, $payload);
} catch (\Throwable $e) {
    Log::error('[NomeHelper] Exceção ao chamar API externa', [
        'exception' => $e->getMessage(),
        'trace'     => $e->getTraceAsString(),
    ]);
    throw new RuntimeException('Erro de comunicação com a API externa.');
}

if (! $response->successful()) {
    Log::error('[NomeHelper] Resposta não bem-sucedida da API', [
        'status' => $response->status(),
        'body'   => $response->body(),
    ]);
    throw new RuntimeException("API retornou erro HTTP {$response->status()}.");
}

$json = $response->json();

if (! isset($json['data']) || ! is_array($json['data'])) {
    Log::warning('[NomeHelper] Resposta sem campo "data" ou formato incorreto', [
        'json' => $json,
    ]);
    throw new RuntimeException('Resposta da API inválida ou sem dados.');
}
```

> **Convenção de prefixo:** use `[NomeDoHelper]` ou `[NomeDoService]` no início da mensagem para filtrar logs facilmente com `grep` ou no Laravel Telescope.

---

## Padrão 4 — Log em Jobs / Queue

```php
public function handle(): void
{
    Log::info('🚀 [ExemploJob] Iniciando processamento', ['id' => $this->modelId]);

    try {
        // lógica do job

        Log::info('✅ [ExemploJob] Processamento concluído', ['id' => $this->modelId]);
    } catch (\Exception $e) {
        Log::error('❌ [ExemploJob] Falha no processamento', [
            'id'      => $this->modelId,
            'message' => $e->getMessage(),
            'trace'   => $e->getTraceAsString(),
        ]);

        throw $e; // relança para o queue worker registrar a falha
    }
}
```

---

## Padrão de Response JSON — Microserviços

Padrão consistente para todas as respostas da API, facilitando o consumo pelos frontends e outras APIs.

### Estrutura base

```php
return response()->json([
    'status'  => 'success' | 'error',
    'message' => 'Descrição legível da operação.',
    'data'    => $dados, // null quando não há dados a retornar
]);
```

### Sucesso com dados

```php
return response()->json([
    'status'  => 'success',
    'message' => 'Lista retornada com sucesso.',
    'data'    => $items,
]);
```

### Sucesso sem dados (ex: delete)

```php
return response()->json([
    'status'  => 'success',
    'message' => 'Registro removido com sucesso.',
    'data'    => null,
]);
```

### Erro de validação (422)

```php
return response()->json([
    'status'  => 'error',
    'message' => 'Dados inválidos.',
    'data'    => $validator->errors(),
], 422);
```

### Erro interno (500)

```php
return response()->json([
    'status'  => 'error',
    'message' => 'Erro ao processar: ' . $e->getMessage(),
    'data'    => null,
], 500);
```

### Não encontrado (404)

```php
return response()->json([
    'status'  => 'error',
    'message' => 'Registro não encontrado.',
    'data'    => null,
], 404);
```

---

## Dicas Rápidas

- **Nunca logue dados sensíveis** (senhas, tokens, CPF completo) diretamente — mascare antes.
- Use `Log::channel('slack')->error(...)` para alertas críticos em produção.
- Prefixe logs de helpers/services com `[NomeClasse]` para facilitar `grep` no arquivo de log.
- Mantenha o campo `data` sempre presente no response, mesmo que `null` — o frontend não precisa verificar se a chave existe.
