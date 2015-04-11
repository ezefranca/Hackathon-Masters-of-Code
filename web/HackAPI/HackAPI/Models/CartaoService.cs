using System;
using HackAPI.Controllers;

namespace HackAPI.Models
{
    public class CartaoService
    {
        public Cartao SaveCartao(CartaoRequest dados, Cadastro usuario)
        {
            //chamar api da master
            string token = "asdfqdqdqw";

            //pegar token
            var cartao = new Cartao {Token = token, Dono = usuario};

            var context = new ApplicationDbContext();
            context.Cartoes.Add(cartao);
            context.SaveChanges();



            //criar o cartao

            //associar com o usuario



            return cartao;
        }

    }
}