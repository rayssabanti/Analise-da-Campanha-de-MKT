
/* Entendimento inicial dos dados  */
 
 -- Nossa chave entre as tabelas � a daa

 /*  select * from [dbo].[Tabela_dispositivos]*/

 -- Existem campos nullos e vazio necess�rio validar 

 -- Necess�rio corrigir o nome da Plataforma do dispositivo, Coloca��o, Plataforma 


 --exec MKT_Dispositivos 

create or alter procedure MKT_Dispositivos 

as 
select Dia, 
		Case [Plataforma do dispositivo] when 'mobile_app' Then 'Mobile App'
			when 'mobile_web' Then 'Mobile Web'
			when 'desktop' Then 'Desktop'
			when 'All' Then 'Todas' end as [Plataforma do dispositivo],
		Case [Coloca��o] when 'All' then 'Todas'
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
			when 'video_feeds' then 'Video Feeds' end as [Coloca��o],
		Case Plataforma when 'All' then 'Todas'
			when 'audience_network' then 'Audience Network'
			when 'facebook' then 'Facebook'
			when 'instagram' then 'Instagram'
			when 'messenger' then 'Messenger' end as Plataforma,
		Case when Alcance is null then 0 else Alcance end as Alcance, 
		Case when [Impress�es] is null then 0 else [Impress�es] end as [Impress�es],
		Case when [Quantia gasta (BRL)] is null then 0 else [Quantia gasta (BRL)] end as [Quantia gasta (BRL)], 
		Case when [Cliques em links] is null then 0 else [Cliques em links] end as [Cliques em links], 
		Case when [Visualiza��es por p�gina] is null then 0 else [Visualiza��es por p�gina] end as [Visualiza��es por p�gina], 
		Case when [Compras no website] is null then 0 else [Compras no website] end as [Compras no website], 
		Case when [Compras no facebook] is null or [Compras no facebook] = '' then 0 
			else [Compras no facebook] end as [Compras no facebook],
		Case when [Adicionados ao carrinho] is null then 0 else [Adicionados ao carrinho] end as [Adicionados ao carrinho], 
		Case when [Valor de convers�o adicionado ao carrinho] is null then 0 else [Valor de convers�o adicionado ao carrinho] end as [Valor de convers�o adicionado ao carrinho], 
		Case when [Checkouts Iniciados] is null then 0 else [Checkouts Iniciados] end as [Checkouts Iniciados], 
		Case when  [Valor de convers�o de checkouts iniciados] is null or [Valor de convers�o de checkouts iniciados] = '' then 0 
			else [Valor de convers�o de checkouts iniciados] end as [Valor de convers�o de checkouts iniciados],
		Case when [Valor de convers�o de compras] is null then 0 else  [Valor de convers�o de compras] end as  [Valor de convers�o de compras], 
		Case when [Compras]  is null then 0 else  [Compras] end as  [Compras]
	from [dbo].[Tabela_dispositivos]
	Order by dia desc