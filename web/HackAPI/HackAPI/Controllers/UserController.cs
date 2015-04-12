using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using HackAPI.Models;
using HackAPI.Services;

namespace HackAPI.Controllers
{
    public class UserController : ApiController
    {
        [HttpPost]
        public HttpResponseMessage Cadastro(Cadastro dados)
        {
            try
            {
                var service = new CadastroService();
                service.Salvar(dados);
                var usuario = service.SaveCartao(dados.DadosCartao, dados.Id);

                return Request.CreateResponse(HttpStatusCode.OK, dados);
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, new { Message = ex.Message });
            }
        }

        [HttpGet]
        public HttpResponseMessage Login(string userName, string password)
        {
            try
            {
                var service = new CadastroService();
                var usuario = service.Get(userName, password);

                return Request.CreateResponse(HttpStatusCode.OK, usuario);
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, new { Message = ex.Message });
            }

        }


    }
}
