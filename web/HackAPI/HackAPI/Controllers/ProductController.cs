using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using HackAPI.Models;
using HackAPI.Services;

namespace HackAPI.Controllers
{
    public class ProductController : ApiController
    {
        // GET: Product
        [HttpGet]
        public HttpResponseMessage List(int vendorId)
        {
            var service = new ProdutoService();
            var produtos = service.List(vendorId);
            return Request.CreateResponse(HttpStatusCode.OK, produtos);

        }
    }
}