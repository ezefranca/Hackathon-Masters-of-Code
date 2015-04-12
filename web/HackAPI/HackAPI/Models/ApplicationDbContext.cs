using System.Data.Entity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace HackAPI.Models
{
    public class ApplicationDbContext :DbContext
    {
        public ApplicationDbContext()
            : base("DefaultConnection")
        {
        }

        public DbSet<Cadastro> Cadastro { get; set; }
        public DbSet<Cartao> Cartoes { get; set; }
        public DbSet<Produto> Produtos { get; set; }
        public DbSet<Pedido> Pedidos { get; set; }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }
    }
}