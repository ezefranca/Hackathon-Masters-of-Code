﻿using Antlr.Runtime.Tree;
using Newtonsoft.Json;

namespace HackAPI.Models
{
    public class Cartao
    {
        public int Id { get; set; }
        public string Token { get; set; }
        [JsonIgnore]
        public  Cadastro Dono { get; set; }
    }
}
