using FastMindFinancial.Repository;
using Microsoft.EntityFrameworkCore;

namespace FastMindFinancial.Models
{
    public class SeedData
    {
        public static void SeedDatabase(FastMindFinancialContext context)
        {
            context.Database.Migrate();
        }

    }
}
