using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using HackAPI.Models;

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