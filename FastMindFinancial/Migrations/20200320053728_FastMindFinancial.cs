using System;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

namespace FastMindFinancial.Migrations
{
    public partial class FastMindFinancial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "PedidoCredito",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    TipoCredito = table.Column<int>(nullable: false),
                    TipoCalculoPeriodo = table.Column<int>(nullable: false),
                    ValorCredito = table.Column<double>(nullable: false),
                    QuantidadeParcelas = table.Column<int>(nullable: false),
                    DataPrimeiroVencimento = table.Column<DateTime>(nullable: false),
                    ValorTotalComJuros = table.Column<double>(nullable: false),
                    ValorJuros = table.Column<double>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PedidoCredito", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "PedidoCredito");
        }
    }
}
