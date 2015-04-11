using System;
using System.Collections.Generic;
using System.Linq;

namespace HackAPI.Models
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
    }
}