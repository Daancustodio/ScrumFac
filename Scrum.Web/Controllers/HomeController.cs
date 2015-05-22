using Scrum.Dominio.Models;
using Scrum.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Scrum.Web.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            var data = DateTime.Now.Hour;
            if (data > 0 && data < 5)
            {
                ViewBag.reverencia = "Boa noite";
            }
            else if (data < 12 && data > 6)
            {
                ViewBag.reverencia = "Bom dia";
            }
            else if (data < 17 && data > 13)
            {
                ViewBag.reverencia = "boa tarde";
            }                 
            else if (data < 23 && data > 18)
            {
                ViewBag.reverencia = "Boa noite";
            }
            return View();
        }
    }
}