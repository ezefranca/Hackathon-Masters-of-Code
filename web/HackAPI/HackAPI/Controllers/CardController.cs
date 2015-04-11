using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using HackAPI.Models;

namespace HackAPI.Controllers
{
    public class CardController : ApiController
    {
        [HttpPost]
        public HttpResponseMessage Add(CartaoRequest dados)
        {
            try
            {
                var serviceCadastro = new Models.CadastroService();
                var usuario = serviceCadastro.Get(dados.UserId);

                var service = new Models.CartaoService();

                var cartao = service.SaveCartao(dados,usuario);

                return Request.CreateResponse(HttpStatusCode.OK, cartao);

            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, new { Message = ex.Message });
            }
        }

        [HttpGet]
        public HttpResponseMessage Get(string userName)
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

    public class CartaoRequest
    {
        public int UserId { get; set; }
        public string Numero { get; set; }
        public int Ano { get; set; }
        public int Mes { get; set; }
        public int Cvc { get; set; }
    }
}

