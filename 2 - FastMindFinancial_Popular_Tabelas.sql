USE [FastMindFinancial]
GO

--------------Tipo Financiamento---------------------
INSERT Tb_TipoFinanciamento (Descricao) VALUES ('Crédito Consignado')
INSERT Tb_TipoFinanciamento (Descricao) VALUES ('Crédito Direto')
INSERT Tb_TipoFinanciamento (Descricao) VALUES ('Crédito Pessoa Fisica')
INSERT Tb_TipoFinanciamento (Descricao) VALUES ('Crédito Pessoa Juridica')
INSERT Tb_TipoFinanciamento (Descricao) VALUES ('Crédito Imobiliario')
go

--------------Cliente---------------------
INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Fernando Augusto', 'SP', '(11)97980-9215')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Michelle Saunitti', 'SP', '(11)97980-9211')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Felipe', 'SP', '(11)97980-9212')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Jose', 'SP', '(11)97980-9213')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Marcia', 'SP', '(11)97980-9214')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Willian', 'SP', '(11)97980-9216')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Karla', 'SP', '(11)97980-9217')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Rafaella', 'SP', '(11)97980-9218')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Guilherme', 'SP', '(11)97980-9219')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Pedro', 'SP', '(11)97980-9210')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Igor', 'SP', '(11)97980-9225')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Tatiana', 'SP', '(11)97980-9221')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Kauann', 'SP', '(11)97980-9222')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Davy', 'SP', '(11)97980-9223')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Fabio', 'SP', '(11)97980-9224')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Daniela', 'SP', '(11)97980-9225')
GO

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Augusto', 'RJ', '(11)97981-9215')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Andrea', 'MG', '(11)97982-9211')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Adriano', 'SC', '(11)97983-9212')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Jessica', 'PR', '(11)97984-9213')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Fabiana', 'AC', '(11)97985-9214')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Jason', 'CE', '(11)97986-9216')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Weber', 'AM', '(11)97987-9217')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Talita', 'RS', '(11)97988-9218')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Erik', 'PE', '(11)97989-9219')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Clayton', 'RJ', '(11)97990-9210')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Cesar', 'MG', '(11)97991-9225')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Rafael', 'SC', '(11)97992-9221')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Murilo', 'PR', '(11)97993-9222')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Thiago', 'CE', '(11)97994-9223')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Viviane', 'AM', '(11)97995-9224')

INSERT Tb_Cliente (NOME, UF, CELULAR) VALUES ('Pamela', 'RJ', '(11)97996-9225')
GO

--------------Financiamento---------------------
INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (1, 4, 30000.00, '2021-03-04')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1,  2500.00, '2020-04-04', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2,  2500.00, '2020-05-04', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 3,  2500.00, '2020-06-04', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 4,  2500.00, '2020-07-04', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 5,  2500.00, '2020-08-04', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 6,  2500.00, '2020-09-04', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 7,  2500.00, '2020-10-04', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 8,  2500.00, '2020-11-04', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 9,  2500.00, '2020-12-04', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 10, 2500.00, '2021-01-04', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 11, 2500.00, '2021-02-04', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 12, 2500.00, '2021-03-04', NULL)

go

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (2, 1, 7500.00, '2020-06-04')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1,  2500.00, '2020-04-04', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2,  2500.00, '2020-05-04', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 3,  2500.00, '2020-06-04', NULL)

go

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (3, 3, 600.00, '2020-06-05')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1,  200.00, '2020-04-05', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2,  200.00, '2020-05-05', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 3,  200.00, '2020-06-05', NULL)

go

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (4, 2, 6000.00, '2020-03-05')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1,  200.00, '2020-01-05', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2,  200.00, '2020-02-05', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 3,  200.00, '2020-03-05', NULL)

go


INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (5, 5, 8800.00, '2020-04-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1,  2200.00, '2020-01-06', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2,  2200.00, '2020-02-06', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 3,  2200.00, '2020-03-06', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 4,  2200.00, '2020-04-06', NULL)

go


INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (6, 5, 8880.00, '2020-04-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 2220.00, '2020-01-06', '2020-01-06')
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 2220.00, '2020-02-06', '2020-02-06')
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 3, 2220.00, '2020-03-06', '2020-03-06')
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 4, 2220.00, '2020-04-06', NULL)

go

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (7, 5, 8888.88, '2020-04-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 2222.22, '2020-01-06', '2020-01-06')
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 2222.22, '2020-02-06', '2020-02-06')
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 3, 2222.22, '2020-03-06', '2020-03-06')
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 4, 2222.22, '2020-04-06', NULL)

go

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (8, 5, 8888.88, '2020-02-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 4444.44, '2020-01-06', '2020-01-06')
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 4444.44, '2020-02-06', '2020-02-06')

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (9, 5, 10000.88, '2020-02-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 5000.44, '2020-01-06', '2020-01-06')
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 5000.44, '2020-02-06', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (10, 5, 12000.88, '2020-02-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 6000.44, '2020-01-06', '2020-01-06')
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 6000.44, '2020-02-06', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (11, 5, 14000.00, '2020-04-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 7000.00, '2020-03-06', '2020-03-06')
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 7000.00, '2020-04-06', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (12, 1, 16000.00, '2020-04-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 8000.00, '2020-03-06', '2020-03-06')
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 8000.00, '2020-04-06', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (13, 1, 18000.00, '2020-04-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 9000.00, '2020-03-06', '2020-03-06')
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 9000.00, '2020-04-06', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (14, 1, 20000.00, '2020-04-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 10000.00, '2020-03-06', '2020-03-06')
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 10000.00, '2020-04-06', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (15, 1, 24000.00, '2020-04-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 12000.00, '2020-03-06', '2020-03-06')
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 12000.00, '2020-04-06', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (16, 1, 26000.00, '2020-04-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 13000.00, '2020-03-06', '2020-03-06')
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 13000.00, '2020-04-06', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (17, 2, 28000.00, '2020-03-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 14000.00, '2020-02-06', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 14000.00, '2020-03-06', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (18, 2, 30000.00, '2020-03-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 15000.00, '2020-02-06', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 15000.00, '2020-03-06', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (19, 2, 32000.00, '2020-03-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 16000.00, '2020-02-06', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 16000.00, '2020-03-06', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (20, 2, 34000.00, '2020-03-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 17000.00, '2020-02-06', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 17000.00, '2020-03-06', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (21, 2, 36000.00, '2020-03-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 18000.00, '2020-02-06', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 18000.00, '2020-03-06', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (22, 2, 38000.00, '2020-03-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 19000.00, '2020-02-06', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 19000.00, '2020-03-06', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (23, 3, 40000.00, '2020-03-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 20000.00, '2020-02-06', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 20000.00, '2020-03-06', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (24, 3, 400.00, '2020-03-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 200.00, '2020-02-06', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 200.00, '2020-03-06', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (25, 3, 600.00, '2020-03-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 300.00, '2020-02-06', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 300.00, '2020-03-06', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (26, 3, 800.00, '2020-03-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 400.00, '2020-02-06', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 400.00, '2020-03-06', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (27, 3, 1000.00, '2020-03-06')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 500.00, '2020-02-06', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 500.00, '2020-03-06', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (28, 1, 1200.00, '2020-03-08')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 600.00, '2020-02-08', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 600.00, '2020-03-08', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (29, 1, 1400.00, '2020-03-08')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 700.00, '2020-02-08', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 700.00, '2020-03-08', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (30, 1, 1600.00, '2020-03-08')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 800.00, '2020-02-08', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 800.00, '2020-03-08', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (31, 1, 1800.00, '2020-03-08')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 900.00, '2020-02-08', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 900.00, '2020-03-08', NULL)

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (32, 1, 2000.00, '2020-03-08')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 1000.00, '2020-02-08', NULL)
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 1000.00, '2020-03-08', NULL)

GO


-----------------------------------MAIS DE UM FINANCIAMENTO PARA A MESMA PESSOA-------------------------
INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (28, 1, 200.00, '2020-03-08')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 100.00, '2020-02-08', '2020-03-08')
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 100.00, '2020-03-08', '2020-03-08')

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (29, 1, 400.00, '2020-03-08')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 200.00, '2020-02-08', '2020-03-08')
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 200.00, '2020-03-08', '2020-03-08')

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (30, 1, 600.00, '2020-03-08')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 300.00, '2020-02-08', '2020-03-08')
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 300.00, '2020-03-08', '2020-03-08')

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (31, 1, 800.00, '2020-03-08')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 400.00, '2020-02-08', '2020-03-08')
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 400.00, '2020-03-08', '2020-03-08')

GO

INSERT Tb_Financiamento (IdCliente, IdTipoFinanciamento, ValorTotal, DataVencimento) VALUES (32, 1, 1000.00, '2020-03-08')

declare @IdFinanciamento int = @@IDENTITY

INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 1, 500.00, '2020-02-08', '2020-03-08')
INSERT TB_DetalhesFinanciamento (IdFinanciamento, NumeroParcela, ValorParcela, DataVencimento, DataPagamento) VALUES (@IdFinanciamento, 2, 500.00, '2020-03-08', '2020-03-08')

GO

