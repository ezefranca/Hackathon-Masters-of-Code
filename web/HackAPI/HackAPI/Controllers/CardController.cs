using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using HackAPI.Models;
using HackAPI.Services;

namespace HackAPI.Controllers
{
    public class CardController : ApiController
    {
        [HttpPost]
        public HttpResponseMessage Add(CartaoRequest dados)
        {
            try
            {
                var serviceCadastro = new CadastroService();
                var usuario = serviceCadastro.Get(dados.UserId);

                var service = new CartaoService();

                var cartao = service.SaveCartao(dados,usuario);

                return Request.CreateResponse(HttpStatusCode.OK, cartao);

            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, new { Message = ex.Message });
            }
        }

        [HttpGet]
        public HttpResponseMessage List(int userId)
        {
            try
            {
                var service = new CartaoService();
                var cartoes = service.ListByUser(userId);

                return Request.CreateResponse(HttpStatusCode.OK, cartoes);
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
        public string Cvc { get; set; }
    }
}

