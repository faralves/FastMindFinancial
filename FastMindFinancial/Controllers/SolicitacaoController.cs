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
