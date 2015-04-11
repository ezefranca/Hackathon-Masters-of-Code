using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using HackAPI.Models;

namespace HackAPI.Controllers
{
    public class LoginController : ApiController
    {
        [HttpPost]
        public HttpResponseMessage Cadastro(Cadastro dados)
        {
            try
            {
                var service = new Models.CadastroService();
                service.Salvar(dados);

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
                var service = new Models.CadastroService();
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
