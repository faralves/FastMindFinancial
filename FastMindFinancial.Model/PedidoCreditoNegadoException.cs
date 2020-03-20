using System;

namespace FastMindFinancial.Model
{
    public class PedidoCreditoNegadoException : ApplicationException
    {
        public PedidoCreditoNegadoException()
        {

        }

        public PedidoCreditoNegadoException(string message) : base(message)
        {

        }

        public PedidoCreditoNegadoException(string message, Exception inner) : base(message, inner)
        {

        }
    }
}
