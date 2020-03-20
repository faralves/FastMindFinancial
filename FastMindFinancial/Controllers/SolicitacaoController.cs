using System;
using System.Net.Http;
using FastMindFinancial.AppService;
using FastMindFinancial.AppService.Messages;
using FastMindFinancial.Model;
using Microsoft.AspNetCore.Mvc;

namespace FastMindFinancial.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SolicitacaoController : ControllerBase
    {
        ApplicationFastMindFinancialService _servicoFinancial = new ApplicationFastMindFinancialService();

        public SolicitacaoController(ApplicationFastMindFinancialService servicoFinancial)
        {
            _servicoFinancial = servicoFinancial;
        }

        /// <summary>
        /// Aplicação de testes de autorização de financiamentos
        /// </summary>
        /// <param name="pedidoCreditoRequest"></param>
        /// <example>
        ///     Json para envio:
        ///     {
        ///         "tipoCredito": "CreditoPessoaFisica",
        ///         "valorCredito": 50000.89,
        ///         "quantidadeParcelas": 15,
        ///         "dataPrimeiroVencimento": "2020-04-25"
        ///      }
        ///  
        ///     Enun do tipoCredito:
        ///     CreditoConsignado = 1,
        ///     CreditoDireto = 2,
        ///     CreditoPessoaFisica = 3,
        ///     CreditoPessoaJuridica = 5,
        ///     CreditoImobiliario = 9
        /// </example>
        /// <returns>
        /// - Status do crédito (Aprovado ou recusado)
        /// - Valor total com juros
        /// - Valor do juros
        /// </returns>
        // POST api/Transferir
        [HttpPost]
        public IActionResult PedirCredito([FromBody] PedidoCreditoRequest pedidoCreditoRequest)
        {
            HttpRequestMessage request = new HttpRequestMessage();

            if (pedidoCreditoRequest.TipoCredito == AppService.Messages.TipoCredito.CreditoImobiliario)
                pedidoCreditoRequest.TipoCalculoPeriodo = 12;
            else
                pedidoCreditoRequest.TipoCalculoPeriodo = 1;

            try
            {
                PedidoCreditoResponse response = _servicoFinancial.PedirCredito(pedidoCreditoRequest);
                if (response.Successo)
                    response.Mensagem = "Aprovado";
                else
                    response.Mensagem = "Negado";

                return Ok(response);
            }
            catch (PedidoCreditoNegadoException ex)
            {

                return BadRequest(ex);
            }
            catch (Exception ex) 
            {
                return BadRequest(ex);
            }
        }
    }
}
