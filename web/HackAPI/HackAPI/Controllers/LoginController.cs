using System;
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
            var usuario =service.Get(dados.UserName, dados.Password);

            return usuario;
        }


    }

    public class CadastroService
    {
        public void Salvar(Cadastro dados)
        {
            throw new NotImplementedException();
        }

        public Cadastro Get(string userName, string password)
        {
            throw new NotImplementedException();
        }
    }
}
