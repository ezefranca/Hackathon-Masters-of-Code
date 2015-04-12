namespace HackAPI.Models
{
    public class Pedido
    {
        public int Id { get; set; }
        public decimal Valor { get; set; }

        public int Quantidade { get; set; }

        public Models.Cartao Cartao { get; set; }

        public Models.Produto Produto { get; set; }

        public Models.Cadastro Usuario { get; set; }
    }
}
