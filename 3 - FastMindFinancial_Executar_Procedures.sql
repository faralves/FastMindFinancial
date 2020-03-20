USE [FastMindFinancial]
GO

---------------Executar Procedures----------------
------ Listar todos os clientes do estado de SP que tenham mais de 60% das parcelas pagas.
exec STO_TB_CLIENTE_SP_COM_MAIS_60_PORCENTO
------ Listar os primeiros 4 clientes que tenham alguma parcela com mais de 05 dias atrasadas (Data Vencimento maior que data atual E data pagamento nula)
exec STO_TB_CLIENTE_TOP4_COM_MAIS_5_DIAS_ATRASO
------ Listar todos os clientes que já atrasaram em algum momento duas ou mais parcelas em mais de 10 dias, e que o valor do financiamento seja maior que R$ 10.000,00.
exec STO_TB_CLIENTE_INADIPLENTES_ACIMA_10_MIL
