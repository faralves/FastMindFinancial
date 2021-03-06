Create database FastMindFinancial
go

USE [FastMindFinancial]
GO

/****** Object:  Table [dbo].[Tb_Cliente]    Script Date: 19/03/2020 22:49:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tb_Cliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](250) NOT NULL,
	[UF] [char](2) NOT NULL,
	[Celular] [nvarchar](14) NOT NULL,
 CONSTRAINT [PK_Tb_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_DetalhesFinanciamento]    Script Date: 19/03/2020 22:49:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_DetalhesFinanciamento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdFinanciamento] [int] NOT NULL,
	[NumeroParcela] [int] NOT NULL,
	[ValorParcela] [decimal](18, 2) NOT NULL,
	[DataVencimento] [date] NOT NULL,
	[DataPagamento] [date] NULL,
 CONSTRAINT [PK_TB_DetalhesFinanciamento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tb_Financiamento]    Script Date: 19/03/2020 22:49:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Financiamento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdTipoFinanciamento] [int] NOT NULL,
	[ValorTotal] [decimal](18, 2) NOT NULL,
	[DataVencimento] [date] NOT NULL,
 CONSTRAINT [PK_Tb_Financiamento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tb_TipoFinanciamento]    Script Date: 19/03/2020 22:49:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_TipoFinanciamento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Tb_TipoFinanciamento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[TB_DetalhesFinanciamento]  WITH CHECK ADD  CONSTRAINT [FK_TB_DetalhesFinanciamento_Tb_Financiamento] FOREIGN KEY([IdFinanciamento])
REFERENCES [dbo].[Tb_Financiamento] ([Id])
GO
ALTER TABLE [dbo].[TB_DetalhesFinanciamento] CHECK CONSTRAINT [FK_TB_DetalhesFinanciamento_Tb_Financiamento]
GO
ALTER TABLE [dbo].[Tb_Financiamento]  WITH CHECK ADD  CONSTRAINT [FK_Tb_Financiamento_Tb_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Tb_Cliente] ([Id])
GO
ALTER TABLE [dbo].[Tb_Financiamento] CHECK CONSTRAINT [FK_Tb_Financiamento_Tb_Cliente]
GO
ALTER TABLE [dbo].[Tb_Financiamento]  WITH CHECK ADD  CONSTRAINT [FK_Tb_Financiamento_Tb_TipoFinanciamento] FOREIGN KEY([IdTipoFinanciamento])
REFERENCES [dbo].[Tb_TipoFinanciamento] ([Id])
GO
ALTER TABLE [dbo].[Tb_Financiamento] CHECK CONSTRAINT [FK_Tb_Financiamento_Tb_TipoFinanciamento]
GO


/****** Object:  StoredProcedure [dbo].[STO_TB_CLIENTE_INADIPLENTES_ACIMA_10_MIL]    Script Date: 19/03/2020 22:49:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[STO_TB_CLIENTE_INADIPLENTES_ACIMA_10_MIL]
as

Select 
	C.Id, C.Nome, C.UF, C.Celular 
from 
	Tb_Cliente C with(nolock) 
inner join
	Tb_Financiamento F with(nolock)
on
	F.IdCliente = C.Id
inner join
	TB_DetalhesFinanciamento D with(nolock)
on 
	D.IdFinanciamento = F.Id
Where
	F.ValorTotal > 10000.00
group by
	C.Id, C.Nome, C.UF, C.Celular 
Having
	(select 
		count(D.NumeroParcela) 
	 from Tb_Cliente C 
		with(nolock) 
	 inner join 
		Tb_Financiamento F with(nolock) 
	 on 
		F.IdCliente = C.Id 
	 inner join 
		TB_DetalhesFinanciamento D with(nolock) 
	 on  
		D.IdFinanciamento = F.Id 
	 Where 
		DATEDIFF(DAY, D.DataVencimento, CAST(GETDATE() AS DATE)) > 10
	 ) >= 2
GO
/****** Object:  StoredProcedure [dbo].[STO_TB_CLIENTE_SP_COM_MAIS_60_PORCENTO]    Script Date: 19/03/2020 22:49:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[STO_TB_CLIENTE_SP_COM_MAIS_60_PORCENTO]

AS

Select 
	C.Id, C.Nome, C.UF, C.Celular, COUNT(NumeroParcela) AS QuantidadeTotalParcelas, 0 as QuantidadePaga, 0 AS PercentualPago
into 
	#tmpPorcentagem
from 
	Tb_Cliente C with(nolock) 
inner join
	Tb_Financiamento F with(nolock)
on
	F.IdCliente = C.Id
inner join
	TB_DetalhesFinanciamento D with(nolock)
on 
	D.IdFinanciamento = F.Id
Where
	UPPER(C.UF) = 'SP' 
group by 
	C.Id, C.Nome, C.UF, C.Celular 


DECLARE @id int, @quantidadeTotalParcelas int;  
  
DECLARE cliente_cursor CURSOR FOR  
SELECT id, quantidadeTotalParcelas FROM #tmpPorcentagem
  
OPEN cliente_cursor;  
  
FETCH NEXT FROM cliente_cursor  
INTO @id, @quantidadeTotalParcelas;  
  
WHILE @@FETCH_STATUS = 0  
BEGIN  

	declare @QuantidadePaga int
	Select 
		@QuantidadePaga = COUNT(D.DataVencimento) 
	from 
		Tb_Cliente C with(nolock) 
	inner join
		Tb_Financiamento F with(nolock)
	on
		F.IdCliente = C.Id
	inner join
		TB_DetalhesFinanciamento D with(nolock)
	on 
		D.IdFinanciamento = F.Id
	Where
		c.id = @id
		and D.DataPagamento is not null
	
	declare @porcentagem decimal = (@QuantidadePaga * 100) / @quantidadeTotalParcelas

	update #tmpPorcentagem set QuantidadePaga = @QuantidadePaga, PercentualPago = @porcentagem where id = @id
  
  
   FETCH NEXT FROM cliente_cursor  
   INTO @id, @quantidadeTotalParcelas;  
END  
  
CLOSE cliente_cursor;  
DEALLOCATE cliente_cursor;  

select * from #tmpPorcentagem where percentualPago > 60

GO
/****** Object:  StoredProcedure [dbo].[STO_TB_CLIENTE_TOP4_COM_MAIS_5_DIAS_ATRASO]    Script Date: 19/03/2020 22:49:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[STO_TB_CLIENTE_TOP4_COM_MAIS_5_DIAS_ATRASO]

AS

Select TOP 4
	C.Id, C.Nome, C.UF, C.Celular 
from 
	Tb_Cliente C with(nolock) 
inner join
	Tb_Financiamento F with(nolock)
on
	F.IdCliente = C.Id
inner join
	TB_DetalhesFinanciamento D with(nolock)
on 
	D.IdFinanciamento = F.Id
Where
	DATEDIFF(DAY, D.DataVencimento, CAST(GETDATE() AS DATE)) > 5
	----Seguindo o requisito do teste não faz sentido a data de vencimento ser maior que a data atual e dizer que está vencido
	----a condição acima já atende para buscar quem está vencido e a condição abaixo para dizer quem não pagou
	--- AND D.DataVencimento > CAST(GETDATE() AS DATE) 
	AND D.DataPagamento IS NULL
group by
	C.Id, C.Nome, C.UF, C.Celular 

GO