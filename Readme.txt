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


Para o Teste do Banco de Dados os scripts para serem executados no BD estão na pasta "virtual do VS" (Testes Banco de Dados).
1 -FastMindFinancial_Creates.sql
2 - FastMindFinancial_Popular_Tabelas.sql
3 - FastMindFinancial_Executar_Procedures.sql



ARQUITETURA

3. Questão conceitual, escreva em detalhes ou diagramas como você montaria uma arquitetura para o cenário abaixo, informando as tecnologias, arquitetura, e o que mais achar necessário.
Em tempos de expansão digital, sua empresa foi contratada para desenhar uma arquitetura moderna que sustente o crescimento digital e de vários novos canais, e também tenha formas de manter o legado funcionando.
Descreva ou desenhe o que e como você utilizaria para suportar este crescimento, tendo em vista que é necessário uma arquitetura que agregue os meios de comunicação com Mainframe, e que todos os sistemas web possam se comunicar entre eles sem a reescrita de códigos.
Todos os sistemas são extremamente críticos e de alta performance, também contando com um volume consideravelmente alto de dados sendo transacionados a todo tempo.
Comente também como você desenharia a solução para implantação deste cenário, visando que quanto menor a dependência com áreas de operação para executar a implantação na mão, mais produtivo e assertivo será a empresa.

R: Implementaria o uso de MicroServiços com Asp.Net Core utilizando o padrão DDD para manter o foco no negócio.
Conternização dos microserviços com Docker para deixar flexível o crescimento da aplicação tanto verticalmente como horizontalmente.
Caso o necessário implementaria RabbitMQ ou Kafka para mensageria.
Quanto ao banco de Dados utilizaria SQL no Azure para conseguir flexibilidade no crescimento do banco.