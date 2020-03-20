using FastMindFinancial.Model;
using FastMindFinancial.Model.Contrato;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;

namespace FastMindFinancial.Repository
{
    public class FastMindFinancialRepository : IFastMindFinancialRepository
    {
        private FastMindFinancialContext context = new FastMindFinancialContext();

        public FastMindFinancialRepository()
        {

        }
        public FastMindFinancialRepository(FastMindFinancialContext ctx)
        {
            context = ctx;

        }
        public void Add(PedidoCredito pedidoCredito)
        {
            context.PedidoCredito.Add(pedidoCredito);

            context.SaveChanges();
        }
    }
}
