using System.Net;
using System.Net.Http;
using FluentAssertions;
using System.Threading.Tasks;
using Xunit;
using FastMindFinancial.TesteIntegracao.Fixtures;
using FastMindFinancial.AppService.Messages;
using FastMindFinancial.Model;
using Newtonsoft.Json;
using System.Text;
using System.Net.Http.Headers;
using System;

namespace FastMindFinancial.TesteIntegracao
{
    public class Teste  
    {
        private readonly TesteContext _testeContext;
        public Teste()
        {
            _testeContext = new TesteContext();
        }

        [Fact]
        public async Task PedirCredito()
        {
            PedidoCreditoRequest pedidoCreditoRequest = new PedidoCreditoRequest()
            {
                TipoCredito = AppService.Messages.TipoCredito.CreditoConsignado,
                DataPrimeiroVencimento = DateTime.Now.AddDays(16),
                QuantidadeParcelas = 10,
                TipoCalculoPeriodo = (int)AppService.Messages.TipoCredito.CreditoConsignado,
                ValorCredito = 18000.00,
            };

            var jsonContent = JsonConvert.SerializeObject(pedidoCreditoRequest);
            var contentString = new StringContent(jsonContent, Encoding.UTF8, "application/json");
            contentString.Headers.ContentType = new
            MediaTypeHeaderValue("application/json");

            string retorno = string.Empty;
            using (var client = new TesteContext().Client)
            {
                var response = await client.PostAsync("/api/solicitacao", contentString);
                response.EnsureSuccessStatusCode();
                response.StatusCode.Should().Be(HttpStatusCode.OK);
                retorno = response.StatusCode.ToString();
            }

            Assert.Equal("OK",retorno);

        }
    }
}
