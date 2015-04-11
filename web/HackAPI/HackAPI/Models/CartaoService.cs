using System;
using HackAPI.Controllers;
using SimplifyCommerce.Payments;

namespace HackAPI.Models
{
    public class CartaoService
    {
        public Cartao SaveCartao(CartaoRequest dados, Cadastro usuario)
        {
            //chamar api da master
            PaymentsApi.PublicApiKey = "sbpb_NjQ5MGEzN2ItMjUyZS00N2NjLWFlOTAtY2E4ZDRkN2MzNGQ1";
            PaymentsApi.PrivateApiKey = "MQ10w7l+OHsdsspzkDVcQToP2n5GVs83iM5c2aLydqR5YFFQL0ODSXAOkNtXTToq";

            PaymentsApi api = new PaymentsApi();
            CardToken cardToken = new CardToken();
            Card card = new Card();
            card.Cvc =dados.Cvc;
            card.ExpMonth = dados.Mes;
            card.ExpYear = dados.Ano;
            card.Number = dados.Numero;
            cardToken.Card = card;
            try
            {
                cardToken = (CardToken)api.Create(cardToken);
            }
            catch (Exception e)
            {
                
            }

            var cartao = new Cartao { Token = cardToken.Id, Dono = usuario };

            var context = new ApplicationDbContext();
            context.Cartoes.Add(cartao);
            context.SaveChanges();

            return cartao;
        }

    }
}