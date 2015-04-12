using HackAPI.Models;

namespace HackAPI.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<HackAPI.Models.ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(HackAPI.Models.ApplicationDbContext context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. E.g.
            //
            context.Produtos.AddOrUpdate(
              p => p.Nome,
              new Produto {Imagem = "lolo.gif",Nome = "Chocolate Lolo",Preco =23.2M,Quantidade = 3},
              new Produto {Imagem = "api.gif",Nome = "As melhores do Ari",Preco =23.2M,Quantidade = 5},
              new Produto {Imagem = "cocacola.gif",Nome = "Coca Cola",Preco =23.2M,Quantidade = 1},
              new Produto {Imagem = "ticktack.gif",Nome = "Tick Tack",Preco =23.2M,Quantidade = 3}
            );
            //
        }
    }
}
