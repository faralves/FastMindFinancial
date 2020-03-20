using FastMindFinancial.Model.Contrato;
using System;

namespace FastMindFinancial.Model
{
    public class ServicoCredito
    {
        private IFastMindFinancialRepository _repositorio;

        public ServicoCredito()
        {

        }

        public ServicoCredito(IFastMindFinancialRepository repositorio)
        {
            _repositorio = repositorio;
        }
        public PedidoCredito PedirCredito(int percentualJuros, int tipoCalculoPeriodo, int PeriodoPagamento, DateTime dataPrimeiroVencimento, double ValorEmprestimo)
        {
            double taxaJuros = (double)percentualJuros;
            double valorMaximoEmprestimo = 1000000.00;
            int quantidadeParcelaMinima = 5;
            int quantidadeParcelaMaxima = 72;
            double valorMinimoLiberadoPJ = 15000.00;
            DateTime dataMinimaPrimeiroVencimento = DateTime.Now.AddDays(15);
            DateTime dataMaximaPrimeiroVencimento = DateTime.Now.AddDays(40);

            if (ValorEmprestimo > valorMaximoEmprestimo)
                throw new PedidoCreditoNegadoException("Pedido Recusado" + Environment.NewLine + "O Valor solicitado é maior que o permitido");

            if(PeriodoPagamento < quantidadeParcelaMinima)
                throw new PedidoCreditoNegadoException("Pedido Recusado" + Environment.NewLine + "A quantidade de parcelas é menor que a quantidade miminma permitida");

            if(PeriodoPagamento > quantidadeParcelaMaxima)
                throw new PedidoCreditoNegadoException("Pedido Recusado" + Environment.NewLine + "A quantidade de parcelas é maior que a quantidade maxima permitida");

            if(taxaJuros == 5 && ValorEmprestimo < valorMinimoLiberadoPJ)
                throw new PedidoCreditoNegadoException("Pedido Recusado" + Environment.NewLine + "O Valor solicitado é menor que o permitido para Pessoa Jurídica");

            if(dataPrimeiroVencimento < dataMinimaPrimeiroVencimento)
                throw new PedidoCreditoNegadoException("Pedido Recusado" + Environment.NewLine + "A data de vencimento da primeira parcela é menor que o permitido");

            if(dataPrimeiroVencimento > dataMaximaPrimeiroVencimento)
                throw new PedidoCreditoNegadoException("Pedido Recusado" + Environment.NewLine + "A data de vencimento da primeira parcela é maior que o permitido");

            int anoOuMes = taxaJuros == 9 ? 12 : 1;

            //decimal valorTotalComJuros = valorCredito * (percentualJuros /100) * periodoPagamento;
            //decimal valorJuros = valorTotalComJuros - valorCredito;

            double Pagamento = 0;
            double valorTotalComJuros = 0;
            double valorJuros = 0;
            try
            {
                if (taxaJuros >= 1)
                {
                    taxaJuros = taxaJuros / 100;
                }
                Pagamento = (ValorEmprestimo * Math.Pow((taxaJuros / anoOuMes) + 1, (PeriodoPagamento)) * taxaJuros / anoOuMes)
                                    / (Math.Pow(taxaJuros / anoOuMes + 1, (PeriodoPagamento)) - 1);
                valorTotalComJuros = Pagamento * PeriodoPagamento;
                valorJuros = valorTotalComJuros - ValorEmprestimo;
            }
            catch 
            {
                throw;
            }

            PedidoCredito _pedidoCredito = new PedidoCredito()
            {
                DataPrimeiroVencimento = dataPrimeiroVencimento,
                QuantidadeParcelas = PeriodoPagamento,
                TipoCalculoPeriodo = tipoCalculoPeriodo,
                ValorCredito = ValorEmprestimo,
                ValorJuros = Math.Round(valorJuros,2),
                ValorTotalComJuros = Math.Round(valorTotalComJuros,2),
                TipoCredito = (TipoCredito)taxaJuros
            };
            _repositorio.Add(_pedidoCredito);

            return _pedidoCredito;
        }
    }
}
