No projeto FastMindFinancial, deve se alterar no arquivo "appsettings.json" a string de conexão para criar o Banco e as tabelas

No Banco de dados a api irá criar uma nova database e uma tabela, a database é FastMindFinancialApp e a tabela é PedidoCredito que contém os dados da solicitação 
PedidoCredito = {Id, TipoCredito, TipoCalculoPeriodo, ValorCredito, QuantidadeParcelas, DataPrimeiroVencimento, ValorTotalComJuros, ValorJuros}

Segue exemplo do Json para consulta via postMan, inserir o Json abaixo no body, podendo no tipoCredito inserir o valor dele como inteiro ou a string, seguir seu enum:

CreditoConsignado = 1,
CreditoDireto = 2,
CreditoPessoaFisica = 3,
CreditoPessoaJuridica = 5,
CreditoImobiliario = 9


{
  "tipoCredito": "CreditoPessoaFisica",
  "valorCredito": 50000.89,
  "quantidadeParcelas": 15,
  "dataPrimeiroVencimento": "2020-04-25"
}


{
  "tipoCredito": 3,
  "valorCredito": 50000.89,
  "quantidadeParcelas": 15,
  "dataPrimeiroVencimento": "2020-04-25"
}


Para o Teste do Banco de Dados os scripts para serem executados no BD estão na pasta Testes Banco de Dados.
