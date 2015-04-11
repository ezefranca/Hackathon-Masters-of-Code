using Antlr.Runtime.Tree;

namespace HackAPI.Models
{
   public class Cartao
    {
        public int Id { get; set; }
        public string Token{ get; set; }

        public virtual Cadastro Dono { get; set; }
    }
}
