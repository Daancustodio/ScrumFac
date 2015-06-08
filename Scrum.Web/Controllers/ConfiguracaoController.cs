using Scrum.Dominio.Models;
using Scrum.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace Scrum.Web.Controllers
{
    public class ConfiguracaoController : Controller
    {
        ScrumWebContext db = new ScrumWebContext();
        // GET: Configuracao
        public ActionResult Index()
        {
            //Usuario user = new Usuario();
            //user = HttpContext.Current.Request.Cookies["UserCookieAuthentication"];
            ////user = db.Usuario.FirstOrDefault(u => u.id ==user.id);
            return View();
        }
    }
}