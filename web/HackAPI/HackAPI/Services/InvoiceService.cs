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
        public Pedido EfetuarPagamento(Cadastro usuario, Cartao cartao, Produto produto, int quantidade)
        {
            var pedido = new Pedido
            {
                Valor = produto.Preco*quantidade,
                Quantidade = quantidade,
                Cartao = cartao,
                Produto = produto,
                Usuario = usuario
            };

            using (var context = new ApplicationDbContext())
            {
                context.Cadastro.Attach(usuario);
                context.Cartoes.Attach(cartao);
                context.Produtos.Attach(produto);
                context.Pedidos.Add(pedido);
                context.SaveChanges();
            }


            PaymentsApi.PublicApiKey = "sbpb_NjQ5MGEzN2ItMjUyZS00N2NjLWFlOTAtY2E4ZDRkN2MzNGQ1";
            PaymentsApi.PrivateApiKey = "MQ10w7l+OHsdsspzkDVcQToP2n5GVs83iM5c2aLydqR5YFFQL0ODSXAOkNtXTToq";

            PaymentsApi api = new PaymentsApi();
            Invoice invoice = new Invoice();
            invoice.Currency = "USD";
            invoice.Email = pedido.Usuario.UserName+ "@mastercard.com";
            List<InvoiceItem> items = new List<InvoiceItem>();
            InvoiceItem items1 = new InvoiceItem();
            items1.Amount = Convert.ToInt64(pedido.Valor.ToString("##.00").Replace(",", ""));
            items1.Quantity = pedido.Quantidade;
            
            items.Add(items1);
            invoice.Items = items;
            invoice.Name = pedido.Produto.Nome;
            invoice.Reference = pedido.Produto.Id.ToString();
            invoice.SuppliedDate = 2394839384000;
            
            try
            {
                invoice = (Invoice)api.Create(invoice);
            }
            catch (Exception e)
            {
             
            }

          
            api=new PaymentsApi();
            Payment payment = new Payment();
            payment.Amount = Convert.ToInt64(pedido.Valor.ToString("##.00").Replace(",", ""));
            payment.Currency = "USD";
            payment.Description = pedido.Produto.Nome;
            payment.Reference = pedido.Id.ToString();
            payment.Token = pedido.Cartao.Token;
            payment.Invoice =invoice.Id;
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