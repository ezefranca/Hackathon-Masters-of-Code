using System.Data.Entity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace HackAPI.Models
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("DefaultConnection", throwIfV1Schema: false)
        {
        }

        public DbSet<Cadastro> Cadastro { get; set; }
        public DbSet<Cartao> Cartoes { get; set; }
        public DbSet<Produto> Produtos { get; set; }
        
        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }
    }
}