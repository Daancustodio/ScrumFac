using Scrum.Dominio.Models;
using Scrum.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;

namespace Scrum.Web.Controllers
{
    public class BurnDownController : Controller
    {
        private ScrumWebContext db = new ScrumWebContext();
        // GET: BurnDown
        public ActionResult Index()
        {
            //dropdownlist
            ViewBag.idProjeto = new SelectList(db.Projeto.AsParallel().Where(p => p.foiExcluido.Equals(false)), "id", "titulo");
            ViewBag.idSprint = new SelectList(db.Sprint.AsParallel().Where(p => p.foiExcluido.Equals(false)), "id", "titulo");
            return View();
        }
        public ActionResult ReleaseBurnDown(long? id)
        {
            ViewBag.idProjeto = new SelectList(db.Projeto.AsParallel().Where(p => p.foiExcluido.Equals(false)), "id", "titulo");
            var Busca = db.Estoria.AsParallel().Where(e => e.idSprint == 1);
            var totalPontos = Busca.AsParallel().Sum(e => e.pontosEstimados);
            var result = db.Estoria.Where(e => e.idStatus.Equals(3)).Where(e => e.idSprint.Equals(1));
            //return Json(result, JsonRequestBehavior.AllowGet);
            return View();
        }
        public ActionResult BuscarSprintId(long id)
        {
            var sprint = db.Sprint.Where(s => s.idProjeto == id);
            if (sprint != null)
            {
                ViewBag.idSprint = sprint.ToList();

            }
            else
            {
                sprint = null;
            }
            return Json(sprint, JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetSprintProjeto(long idProjeto)
        {
            var result = string.Empty;



            //var list = new List<Sprint>();
            //list = from json in db.Sprint where  select json;
            //string result = JsonConvert.SerializeObject(list, Formatting.Indented);

            //ViewBag.pIdSprint = new SelectList(db.Sprint.Where(s => s.idProjeto.Equals(idProjeto)).ToList(), "id", "titulo");
            
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}