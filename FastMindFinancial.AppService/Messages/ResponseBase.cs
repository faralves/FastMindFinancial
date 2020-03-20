namespace FastMindFinancial.AppService.Messages
{
    public class ResponseBase
    {
        public bool Successo { get; set; }
        public string Mensagem { get; set; }
        public double ValorTotalComJuros { get; set; }
        public double ValorJuros { get; set; }
    }
}
