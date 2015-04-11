using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HackAPI.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult List(int vendorId)
        {
            var service = new ProdutoService();
            var produtos = service.List(vendorId);
            return View();
        }
    }

    public class ProdutoService
    {
        internal Produto List(int vendorId)
        {
            throw new NotImplementedException();
        }
    }
}