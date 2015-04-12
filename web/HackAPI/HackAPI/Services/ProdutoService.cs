using System.Collections.Generic;
using System.Linq;
using HackAPI.Models;

namespace HackAPI.Services
{
    public class ProdutoService
    {
        public List<Produto> List(int vendorId)
        {
            using (var context = new ApplicationDbContext())
            {
                return context.Produtos.ToList();
            }
        }

        internal Produto Get(int p)
        {
            using (var context = new ApplicationDbContext())
            {
                return context.Produtos.FirstOrDefault(a => a.Id==p);
            }
        }
    }
}