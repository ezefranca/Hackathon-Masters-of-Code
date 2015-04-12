using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using HackAPI.Controllers;

namespace HackAPI.Models
{
    public class Cadastro
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string IdMaster { get; set; }
        
        
        [NotMapped]
        public virtual CartaoRequest DadosCartao { get; set; }
    }
}