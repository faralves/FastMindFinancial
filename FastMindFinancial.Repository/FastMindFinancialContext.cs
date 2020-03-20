using FastMindFinancial.Model;
using Microsoft.EntityFrameworkCore;

namespace FastMindFinancial.Repository
{
    public class FastMindFinancialContext : DbContext
    {
        public FastMindFinancialContext()
        {

        }

        public FastMindFinancialContext(DbContextOptions<FastMindFinancialContext> options) : base(options) { }

        public DbSet<PedidoCredito> PedidoCredito { get; set; }
    }
}
