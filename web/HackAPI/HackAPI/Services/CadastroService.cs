using System;
using System.Linq;
using HackAPI.Models;
using SimplifyCommerce.Payments;

namespace HackAPI.Services
{
    public class CadastroService
    {
        public void Salvar(Cadastro dados)
        {
            using (var context = new Models.ApplicationDbContext())
            {
                var user = context.Cadastro.FirstOrDefault(a => a.UserName.ToLower() == dados.UserName.ToLower());

                if (user != null)
                    throw new Exception("Já existe um usuário");

                context.Cadastro.Add(dados);
                context.SaveChanges();
            }
        }
        public Cadastro Get(string userName, string password)
        {
            using (var context = new Models.ApplicationDbContext())
            {
                var user = context.Cadastro.FirstOrDefault(a => a.UserName.ToLower() == userName.ToLower() && a.Password == password);

                if (user == null)
                    throw new Exception("Usuário não encontrado");

                return user;
            }
        }

        internal Cadastro Get(int userid)
        {
            using (var context = new Models.ApplicationDbContext())
            {
                var user = context.Cadastro.FirstOrDefault(a => a.Id == userid);

                if (user == null)
                    throw new Exception("Usuário não encontrado");

                return user;
            }
        }

        internal Cadastro SaveCartao(Controllers.CartaoRequest dados, int userid)
        {
            using (var context = new Models.ApplicationDbContext())
            {
                var user = context.Cadastro.FirstOrDefault(a => a.Id == userid);

                if (user == null)
                    throw new Exception("Usuário não encontrado");


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
                customer.Email = user.UserName + "@mastercard.com";
                customer.Name = user.UserName;
                customer.Reference = user.Id.ToString();

                customer = (Customer)api.Create(customer);
                user.IdMaster = customer.Id;

                context.SaveChanges();

                return user;
            }
        }
    }
}