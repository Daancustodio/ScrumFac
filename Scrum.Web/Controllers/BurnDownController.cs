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

            return View();
        }
        public ActionResult BuscarSprintId(long pidSprint)
        {

            var sprint = db.Sprint.Find(pidSprint);

            var burnDown = new BurnDownSprint(sprint);

            return Json(burnDown, JsonRequestBehavior.AllowGet);
        }
        public ActionResult BuscarSprintProjeto(long pidProjeto)
        {
            var projetoSprint = db.Projeto.Join(db.Sprint, p => p.id, s => s.idProjeto, (p, s) => new { p, s }).Where(i => i.p.id.Equals(pidProjeto));
            var projeto = db.Projeto.Find(pidProjeto);
            var burnDownRelease = new BurnDownRelease(projeto);

            return Json(burnDownRelease, JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetSprintProjeto(long idProjeto)
        {
            var result = db.Sprint.Where(i => i.idProjeto.Equals(idProjeto)).ToList();
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}