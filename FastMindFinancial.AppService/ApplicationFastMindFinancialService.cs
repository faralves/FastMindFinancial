using AutoMapper;
using FastMindFinancial.AppService.Messages;
using FastMindFinancial.Model;
using FastMindFinancial.Model.Contrato;
using System.Collections.Generic;

namespace FastMindFinancial.AppService
{
    public class ApplicationFastMindFinancialService
    {
        private ServicoCredito _servicoCredito = new ServicoCredito();
        private IFastMindFinancialRepository _iFastMindFinancialRepository;
        private readonly IMapper _mapper;

        public ApplicationFastMindFinancialService()
        { }

        public ApplicationFastMindFinancialService(ServicoCredito servicoCredito, IFastMindFinancialRepository iFastMindFinancialRepository, IMapper mapper)
        {
            _servicoCredito = servicoCredito;
            _iFastMindFinancialRepository = iFastMindFinancialRepository;
            _mapper = mapper;
        }

        public PedidoCreditoResponse PedirCredito(PedidoCreditoRequest pedirCreditoRequest)
        {
            PedidoCreditoResponse response = new PedidoCreditoResponse();
            try
            {
                PedidoCredito pedidoCredito = _servicoCredito.PedirCredito((int)pedirCreditoRequest.TipoCredito, pedirCreditoRequest.TipoCalculoPeriodo, pedirCreditoRequest.QuantidadeParcelas, pedirCreditoRequest.DataPrimeiroVencimento, pedirCreditoRequest.ValorCredito);
                
                response.ValorTotalComJuros = pedidoCredito.ValorTotalComJuros;
                response.ValorJuros = pedidoCredito.ValorJuros;
                response.Successo = true;
                
                return response;
            }
            catch 
            {
                throw;
            }
        }

    }
}
