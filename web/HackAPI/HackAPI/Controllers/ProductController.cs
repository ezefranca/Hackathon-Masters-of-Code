using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HackAPI.Models;
using HackAPI.Services;

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
}