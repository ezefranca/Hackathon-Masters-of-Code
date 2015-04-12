using System.Collections.Generic;

namespace HackAPI.Models
{
    public class Cadastro
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }

        public string IdMaster { get; set; }
    }
}