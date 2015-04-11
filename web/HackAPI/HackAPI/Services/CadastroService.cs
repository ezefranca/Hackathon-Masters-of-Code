using System;
using System.Linq;
using HackAPI.Models;

namespace HackAPI.Services
{
    public  class CadastroService
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

        internal Cadastro Get(int userid)
        {
            using (var context = new Models.ApplicationDbContext())
            {
                var user = context.Cadastro.FirstOrDefault(a => a.Id == userid );

                if (user == null)
                    throw new Exception("Usuário não encontrado");

                return user;
            }
        }
    }
}