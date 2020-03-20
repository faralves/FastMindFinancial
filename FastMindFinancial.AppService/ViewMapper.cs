using AutoMapper;
using FastMindFinancial.Model;
using FastMindFinancial.AppService.ViewModel;

namespace FastMindFinancial.AppService
{
    public class ViewMapper : Profile
    {
        public ViewMapper()
        {
            CreateMap<PedidoCredito, PedidoCreditoView>();
        }
    }
}
