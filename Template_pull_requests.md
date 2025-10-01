## Para o solicitante<br>
É necessário que o revisor reproduza algum teste?<br>
O que essa PR faz?<br>
Quando você pretende fazer o deploy?<br>
- [ ] Esse PR envolve alguma query?
-     Se sim, anexe um print do explain.

## Para o revisor
**Lembre - se de analisar:**<br>
- [ ] Há queries com valor filtrado inteiro em que o tipo da coluna não seja inteiro? (Ex. select * shipments where id = 2;)
- [ ] Há queries que podem ser otimizadas através da seleção de colunas? (ao invés de usar * para trazer tudo definir as colunas necessárias)
- [ ] Faltou algum try catch?
- [ ] Faltou algum isset() em alguma propriedade?
- [ ] Faltou isset em alguma propriedade nova em uma coluna do tipo json?
- [ ] Há queries que fazem filtro em uma coluna não indexada?


**Caso se trate de uma migration lembre-se de revisar os seguintes pontos:**<br>
- [ ] Dessa tabela quais colunas serão filtradas?
- [ ]  Algum %_at será filtrado?
- Liste como cada campo será usado

## O que foi feito

Continuação do Item 6 da tarefa do Jira [LOG-5401], agora com foco na aplicação de filtros e ajustes em relatórios com versionamento de rotas.

Foram criados novos filtros por **Código Identificador** (`driver_code`) nas views versionadas de várias seções do sistema.  
Isso permite que os usuários busquem motoristas tanto pelo nome quanto pelo código interno, seguindo o novo padrão.

---

## Filtro por Código Identificador (`driver_code`)

Agora é possível buscar motoristas pelo código ou nome nas seguintes **novas rotas**:

**Pedidos > Todos os pedidos**  
`/all_shipments_v7`

**Pedidos > Atualizar Status em Massa**  
`/massive_status_updateV2`

**Torre de Controle > Operações**
`/operation-v5`

**Torre de Controle > Fechamento de Coletas**
`/closing/collects_v12`

**Torre de Controle > Rotas**  
`/routes/dashboardV3`

**Torre de controle > Motoristas**  
`/day/shipment/v8 `

**Torre de controle > Status canal**  
`/shipments_status_canal_v4`

**Relatórios > Histórico Motoristas**  
`/carriers/update-driver_v2`

**Financeiro > Movimentações**  
`/financials/current-account/v2`

**Financeiro > Pagamentos**  
`/financials/paymentsv2`


Ao digitar, por exemplo, `#10024`, o sistema exibirá o motorista no formato:

> `#10024 João da Silva`



> **Para popular os motoristas retroativos com o código interno**, execute:
> ```bash
> php artisan update:driver_code
> ```


---


## O que foi feito:

Ajuste feito para movimentações do grupo de transportadoras

Identificamos e corrigimos o problema: quando um motorista pertence a outra transportadora do mesmo grupo, agora o driver_id (Código do motorista) é salvo na movimentação (mantemos a observação informando que o cadastro é de outra transportadora). Para motoristas de transportadoras fora do grupo, continua apenas a observação (sem salvar driver_id).

Além disso, foi ajustada a funcionalidade de Storage para refletir essa lógica e tudo foi versionado na versão v3.

- Adicionadas duas novas colunas na view: "Quantidade" e "Diferença", para exibir os valores presentes no relatório sintético.
- Ajustado o processo de geração do relatório para incluir a quantidade extraída do arquivo sintético.


> **Observação:**  
> Foi criado um command para atualizar todos os registros com user_type = "motorista" foi utilizado no banco de stage para os testes e desenvolvimento se quiser observa a estrutura e funcionamento.


---

## Referências
- [LOG-5401](https://log-manager.atlassian.net/browse/LOG-5401)
- [LOG-5804](https://log-manager.atlassian.net/browse/LOG-5804)
- [SUP-164](https://log-manager.atlassian.net/browse/SUP-164)
- [SUP-487](https://log-manager.atlassian.net/browse/SUP-487)


> **Observação:** Esse ajuste também contempla e corrige o problema descrito na tarefa [SUP-190](https://log-manager.atlassian.net/browse/SUP-190)


---

**Pontos importantes:**  
O início do deploy é de responsabilidade do solicitante.

🕒 **Horários para deploy:**  
- Segunda à quinta: 08h às 16h  
- Sexta: 08h às 10h  

Qualquer necessidade fora desse horário precisa da aprovação prévia do @gestor.
