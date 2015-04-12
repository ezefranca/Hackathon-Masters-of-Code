using System;
using System.Collections.Generic;
using System.Linq;
using HackAPI.Controllers;
using HackAPI.Models;
using SimplifyCommerce.Payments;

namespace HackAPI.Services
{
    public class CartaoService
    {
        public Cadastro SaveCartao(CartaoRequest dados, Cadastro usuario)
        {
            //chamar api da master
            PaymentsApi.PublicApiKey = "sbpb_NjQ5MGEzN2ItMjUyZS00N2NjLWFlOTAtY2E4ZDRkN2MzNGQ1";
            PaymentsApi.PrivateApiKey = "MQ10w7l+OHsdsspzkDVcQToP2n5GVs83iM5c2aLydqR5YFFQL0ODSXAOkNtXTToq";

            PaymentsApi api = new PaymentsApi();
            Customer customer = new Customer();

            Card card = new Card();
            card.Cvc = dados.Cvc;
            card.ExpMonth = dados.Mes;
            card.ExpYear = dados.Ano;
            card.Number = dados.Numero;


            customer.Card = card;
            customer.Email =usuario.UserName+ "@mastercard.com";
            customer.Name = usuario.UserName;
            customer.Reference = usuario.Id.ToString();

            customer = (Customer)api.Create(customer);
            usuario.IdMaster = customer.Id;
           // var cartao = new Cartao { Token = cardToken.Id, Dono = usuario };

            using (var context = new ApplicationDbContext())
            {
                context.Cadastro.Attach(usuario);
                
                context.SaveChanges();
            }

            return usuario;
        }

       
    }
}