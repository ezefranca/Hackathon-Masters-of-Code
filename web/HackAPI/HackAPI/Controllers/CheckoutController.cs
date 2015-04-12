using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using HackAPI.Services;

namespace HackAPI.Controllers
{
    public class CheckoutController : ApiController
    {
        [HttpPost]
        public HttpResponseMessage Add(CheckoutRequest dados)
        {
            try
            {
                var serviceCadastro = new CadastroService();
                var usuario = serviceCadastro.Get(dados.UserId);
                
                var serviceCartao = new CartaoService();
                var cartao = serviceCartao.Get(dados.CardId);
                
                var serviceProduto = new ProdutoService();
                var produto=serviceProduto.Get(dados.ProductId);


                var invoiceService = new InvoiceService();
                var invoice = invoiceService.EfetuarPagamento(usuario, cartao, produto, dados.Quantidade);

                return Request.CreateResponse(HttpStatusCode.OK, invoice);

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
                var invoiceService = new InvoiceService();
                var invoice = invoiceService.Get(userId);

                return Request.CreateResponse(HttpStatusCode.OK, invoice);

            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, new { Message = ex.Message });
            }
        }

    }
    public class CheckoutRequest
    {
        public int UserId { get; set; }
        public int ProductId { get; set; }
        public int CardId { get; set; }
        public int Quantidade { get; set; }
    }
}
