using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using HackAPI.Models;
using SimplifyCommerce.Payments;

namespace HackAPI.Services
{
    public class InvoiceService
    {
        public Pedido EfetuarPagamento(Cadastro usuario, Produto produto, int quantidade)
        {
            var pedido = new Pedido
            {
                Valor = produto.Preco*quantidade,
                Quantidade = quantidade,
                Produto = produto,
                Usuario = usuario
            };

            using (var context = new ApplicationDbContext())
            {
                context.Cadastro.Attach(usuario);
                context.Produtos.Attach(produto);
                context.Pedidos.Add(pedido);
                context.SaveChanges();
            }


            PaymentsApi.PublicApiKey = "sbpb_NjQ5MGEzN2ItMjUyZS00N2NjLWFlOTAtY2E4ZDRkN2MzNGQ1";
            PaymentsApi.PrivateApiKey = "MQ10w7l+OHsdsspzkDVcQToP2n5GVs83iM5c2aLydqR5YFFQL0ODSXAOkNtXTToq";

            PaymentsApi api = new PaymentsApi();
        
            Payment payment = new Payment();
            payment.Amount = Convert.ToInt64(pedido.Valor.ToString("##.00").Replace(",", "").Replace(".", ""));
            payment.Currency = "USD";
            payment.Description = pedido.Produto.Nome;
            payment.Reference = pedido.Id.ToString();

            var customer = (Customer)api.Find(typeof(Customer), usuario.IdMaster);

            payment.Customer=customer;
            try
            {
                payment = (Payment)api.Create(payment);
            }
            catch (Exception e)
            {
             
            }

            return pedido;
        }

        public List<Pedido> Get(int userId)
        {
            using (var context = new ApplicationDbContext())
            {
                return  context.Pedidos.Where(a => a.Usuario.Id == userId).Include("Produto").ToList();
            }
        }
    }
}