/* Entendimento inicial dos dados  */
 
 -- Nossa chave entre as tabelas é a Data 

 /*  select * from [dbo].[Tabela_idade_e_genero]*/

 -- Existe uma coluna sem informação  

 -- Necessário limpar os dados nulos e vazios 

 --EXEC  MKT_Idade_Genero

Create or alter procedure MKT_Idade_Genero
as
 select Idade, Gênero, Dia,
		case when Alcance is null then 0 
			else Alcance end as Alcance, 
		case when [Impressões] is null then 0 
			else [Impressões]  end as [Impressões] ,
		case when [Quantia gasta (BRL)] is null then 0 
			else [Quantia gasta (BRL)]  end as [Quantia gasta (BRL)], 
		case when [Cliques no link] is null then 0 
			else [Cliques no link] end as [Cliques no link],
		case when [Visualizações por página] is null then 0 
			else [Visualizações por página]  end as [Visualizações por página],
		case when [Compras no website] is null then 0 
			else [Compras no website] end as [Compras no website],
		case when [Compras no facebook] is null or [Compras no facebook] = '' then 0  
			else [Compras no facebook] end as [Compras no facebook],
		case when [Adicionados ao carrinho] is null then 0 
			else [Adicionados ao carrinho] end as [Adicionados ao carrinho],
		case when [Checkouts Iniciados] is null then 0 
			else [Checkouts Iniciados] end as [Checkouts Iniciados],
		case when [Valor de conversão de checkouts iniciados] is null or [Valor de conversão de checkouts iniciados] = '' then 0 
			else [Valor de conversão de checkouts iniciados] end as [Valor de conversão de checkouts iniciados],
		case when [Valor de conversão de compras] is null then 0 
			else [Valor de conversão de compras] end as [Valor de conversão de compras],
		case when [Compras] is null then 0 
			else [Compras] end as [Compras]
		from [dbo].[Tabela_idade_e_genero]
		order by dia

  
  