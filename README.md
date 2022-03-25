
# Portfolio - Análise da Campanha de MKT
 
## :pushpin:	 Objetivo 
Desenvolveremos um dashboard estratégico de marketing com o objetivo de monitorar uma campanha de publicidade paga durante o mês de julho de 2021. 
Apresentaremos indicadores relevantes para a validação estratégica do negócio.

## :twisted_rightwards_arrows:	 ETL 
Os dados foram disponibilizados em dois arquivos JSON (Tabela_dispositivos e Tabela_idade_e_genero).
Como prefiro analisar os dados em SQL ou Python, utilizei o DAX Studio para exportar os dados diretamente no SQL SERVER para poder realizar uma análise exploratória com uma melhor percepção e também não afetar o processamento do PowerBI com várias Etapas. 

Com os dados no banco de dados eu realizei o entendimento inicial e a limpeza dos dados com uma Stored Procedure que funcionaria para limpar os próximos meses também:
 
 **Tabela de Dispositivos** 
 * :ballot_box_with_check:	 Correção das colunas com valores nulos e vazios
 * :ballot_box_with_check:	 Alteração dos nomes com _ e inicial minúscula 
 * :ballot_box_with_check:	 Alcance, Impressões, Cliques em links, Visualizações por página, Compras no website, Adicionados ao carrinho, Checkouts iniciados e Compras - *Número inteiro*
 * :ballot_box_with_check:	 Quantia gasta (BRL), Valor de conversão adicionado ao carrinho e Valor de conversão de compras ajustado -*Moeda*

**Tabela de Idades e Gêneros** 
* :ballot_box_with_check: Exclusão da coluna sem dados 
* :ballot_box_with_check: Correção dos valores nulos e vazios 
* :ballot_box_with_check:Quantia gasta (BRL), Valor de conversão adicionado ao carrinho e Valor de conversão de compras ajustado -  Moeda
* :ballot_box_with_check: Alcance, Impressões, Quantia gasta (BRL), Cliques no link, Visualizações por página, Compras no website, Compras no facebook, Adicionados ao carrinho, Checkouts Iniciados, Valor de conversão de checkouts iniciados e Compras - *Número inteiro*

Conectado com o banco de dados e importado a procedure no PowerBI (salva na pasta também junto com os arquivos em formato csv e json). 

Criei uma tabela no PowerBI chamada Calendário para adicionar nas análises: 
| Coluna  | Fórmula |
| ------------- | ------------- |
| Data (2021 completo)  | Calendario = CALENDAR(DATE(2021, 1, 1), DATE(2021, 12, 31))  |
| Ano  | Ano = YEAR(Calendario[Data])  |
| Mês  | Mês = MONTH(Calendario[Data])  |
| Dia  | Dia = DAY(Calendario[Data])  |
| Semana  | Semana = WEEKNUM(Calendario[Data],1)  |
| Dia da Semana  | Dia da Semana = WEEKDAY(Calendario[Data])  |
| Nome do Dia  | Nome do Dia = SWITCH(Calendario[Dia da Semana],1,"Domingo",2,"Segunda",3,"Terça",4,"Quarta",5,"Quinta",6,"Sexta", 7, "Sábado")   |

### Modelo
![image](https://user-images.githubusercontent.com/61653788/160027283-e5c97c6c-e81f-406c-89ce-edbece0c6add.png)

## :bar_chart:	 Dashboard
![image](https://user-images.githubusercontent.com/61653788/160205442-2199e038-4c97-403f-bebb-7da127541161.png)

* :brain: **Qual foi o total de compras efetuadas?**

| Fórmula  | Resultado |
| ------------- | ------------- |
| Sum[Compras] | ![image](https://user-images.githubusercontent.com/61653788/160205545-688595ab-77bc-44e3-84d7-6b1cd538e0ee.png)  |

* :brain: **Qual foi o valor total investido?**

| Fórmula  | Resultado |
| ------------- | ------------- |
| Sum[Quantia Gasta (BRL)] | ![image](https://user-images.githubusercontent.com/61653788/160206469-005b2b1a-6890-414d-a96c-d8a40adb1029.png)  |

* :brain: **Qual foi o Total em Conversão de Compras?**

| Fórmula  | Resultado |
| ------------- | ------------- |
| Sum[Valor de Conversão de Compra] | ![image](https://user-images.githubusercontent.com/61653788/160206940-696fad2e-b6a1-4104-a06e-46fb9f88859a.png)  |

* :brain: **Qual foi o Custo por Clique?** 

| Fórmula  | Resultado |
| ------------- | ------------- |
| SUM('Idades e Gêneros'[Quantia gasta (BRL)])/SUM('Idades e Gêneros'[Cliques no link]) | ![image](https://user-images.githubusercontent.com/61653788/160207023-8ab48c0f-4d4c-4325-b564-b51ead3fa8a7.png) |

* :brain: **Qual foi a taxa de conversão?**

| Fórmula  | Resultado |
| ------------- | ------------- |
| SUM('Idades e Gêneros'[Compras])/SUM('Idades e Gêneros'[Visualizações por página]) * 100 | ![image](https://user-images.githubusercontent.com/61653788/160207039-218db1ae-a1f6-4fde-80aa-b1fda8f8fbc1.png)|

* :brain: **Compras por gênero**

| Fórmula  | Resultado |
| ------------- | ------------- |
| Legenda: Gênero - Valores: Compras | ![image](https://user-images.githubusercontent.com/61653788/160207057-ab561801-37c4-4b54-841c-522f0db85c96.png)|

* :brain: **Ticket médio por plataforma do dispositivo**

| Fórmula  | Resultado |
| ------------- | ------------- |
| Eixo: Plataforma do Dispositivo - Valores: Ticket Medio | ![image](https://user-images.githubusercontent.com/61653788/160207098-5086c84a-b6ba-4cbc-a7ec-9706da431d74.png)|

| Ticket Medio  | 
| ------------- | 
| SUM(Dispositivos[Quantia gasta (BRL)]) / SUM(Dispositivos[Compras]) |

* :brain: **Total de conversão de compras por dia**

| Fórmula  | Resultado |
| ------------- | ------------- |
| Eixo: Nome do dia - Valores: Total de conversão de compras | ![image](https://user-images.githubusercontent.com/61653788/160207126-a866328e-e051-4573-9e18-98064417aeb2.png)|

| Total de conversão de compras  | 
| ------------- | 
| SUM('Idades e Gêneros'[Valor de conversão de compras]) |

* :brain: **Jornada de Compra** 

| Fórmula  | Resultado |
| ------------- | ------------- |
| Valores: Visualização por página, Adicionados ao carrinho, checkouts realizados, Compras | ![image](https://user-images.githubusercontent.com/61653788/160207148-c9da2e45-dc0a-4058-ad3f-73670c20cc8a.png)|


