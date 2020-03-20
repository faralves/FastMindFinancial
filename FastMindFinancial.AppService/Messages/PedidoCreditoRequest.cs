using FastMindFinancial.Model;
using System;

namespace FastMindFinancial.AppService.Messages
{
    public class PedidoCreditoRequest
    {
        public TipoCredito TipoCredito { get; set; }
        public int TipoCalculoPeriodo { get; set; }
        public double ValorCredito { get; set; }
        public int QuantidadeParcelas { get; set; }
        public DateTime DataPrimeiroVencimento { get; set; }
    }

    public enum TipoCredito
    {
        CreditoConsignado = 1,
        CreditoDireto = 2,
        CreditoPessoaFisica = 3,
        CreditoPessoaJuridica = 5,
        CreditoImobiliario = 9
    }
}
