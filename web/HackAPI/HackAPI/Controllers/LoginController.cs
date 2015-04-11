using System;
using System.Linq;
using System.Web.Http;
using HackAPI.Models;

namespace HackAPI.Controllers
{
    public class LoginController : ApiController
    {
        [HttpPost]
        public Cadastro Cadastro(Cadastro dados)
        {
            var service = new CadastroService();
            service.Salvar(dados);

            return dados;
        }

        [HttpPost]
        public Cadastro Login(Cadastro dados)
        {
            var service = new CadastroService();
            var usuario = service.Get(dados.UserName, dados.Password);

            return usuario;
        }


    }

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
                var user = context.Cadastro.FirstOrDefault(a => a.UserName.ToLower() == userName.ToLower() && a.Password==password);

                if (user == null)
                    throw new Exception("Usuário não encontrado");

                return user;
            }
        }
    }
}
