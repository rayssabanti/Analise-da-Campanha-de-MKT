
/* Entendimento inicial dos dados  */
 
 -- Nossa chave entre as tabelas é a daa

 /*  select * from [dbo].[Tabela_dispositivos]*/

 -- Existem campos nullos e vazio necessário validar 

 -- Necessário corrigir o nome da Plataforma do dispositivo, Colocação, Plataforma 


 --exec MKT_Dispositivos 

create or alter procedure MKT_Dispositivos 

as 
select Dia, 
		Case [Plataforma do dispositivo] when 'mobile_app' Then 'Mobile App'
			when 'mobile_web' Then 'Mobile Web'
			when 'desktop' Then 'Desktop'
			when 'All' Then 'Todas' end as [Plataforma do dispositivo],
		Case [Colocação] when 'All' then 'Todas'
			when 'an_classic' then 'Classic'
			when  'facebook_stories' then 'Facebook Stories' 
			when 'feed' then 'Feed'
			when  'instagram_explore' then 'Instagram Explore'
			when  'instagram_stories' then 'Instagram Stories'
			when  'instant_article' then 'Instant Article'
			when  'instream_video' then 'Instream Video'
			when 'marketplace' then 'Marketplace'
			when  'messenger_inbox' then 'Messenger Inbox'
			when  'messenger_stories' then 'Messenger Stories'
			when  'rewarded_video' then 'Rewarded Video'
			when 'right_hand_column' then 'Right Hand Column'
			when 'video_feeds' then 'Video Feeds' end as [Colocação],
		Case Plataforma when 'All' then 'Todas'
			when 'audience_network' then 'Audience Network'
			when 'facebook' then 'Facebook'
			when 'instagram' then 'Instagram'
			when 'messenger' then 'Messenger' end as Plataforma,
		Case when Alcance is null then 0 else Alcance end as Alcance, 
		Case when [Impressões] is null then 0 else [Impressões] end as [Impressões],
		Case when [Quantia gasta (BRL)] is null then 0 else [Quantia gasta (BRL)] end as [Quantia gasta (BRL)], 
		Case when [Cliques em links] is null then 0 else [Cliques em links] end as [Cliques em links], 
		Case when [Visualizações por página] is null then 0 else [Visualizações por página] end as [Visualizações por página], 
		Case when [Compras no website] is null then 0 else [Compras no website] end as [Compras no website], 
		Case when [Compras no facebook] is null or [Compras no facebook] = '' then 0 
			else [Compras no facebook] end as [Compras no facebook],
		Case when [Adicionados ao carrinho] is null then 0 else [Adicionados ao carrinho] end as [Adicionados ao carrinho], 
		Case when [Valor de conversão adicionado ao carrinho] is null then 0 else [Valor de conversão adicionado ao carrinho] end as [Valor de conversão adicionado ao carrinho], 
		Case when [Checkouts Iniciados] is null then 0 else [Checkouts Iniciados] end as [Checkouts Iniciados], 
		Case when  [Valor de conversão de checkouts iniciados] is null or [Valor de conversão de checkouts iniciados] = '' then 0 
			else [Valor de conversão de checkouts iniciados] end as [Valor de conversão de checkouts iniciados],
		Case when [Valor de conversão de compras] is null then 0 else  [Valor de conversão de compras] end as  [Valor de conversão de compras], 
		Case when [Compras]  is null then 0 else  [Compras] end as  [Compras]
	from [dbo].[Tabela_dispositivos]
	Order by dia desc