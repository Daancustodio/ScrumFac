﻿using Scrum.Dominio.Models;
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
            var projeto = db.Projeto.Find(id);
            var burnDownRelease = new BurnDownRelease(projeto);

            return Json(burnDownRelease, JsonRequestBehavior.AllowGet);
        }
        public ActionResult BuscarSprintId(long idSprint)
        {
            var sprint = db.Sprint.Find(idSprint);            

            var burnDown = new BurnDownSprint(sprint);
            var retorno = Json(burnDown, JsonRequestBehavior.AllowGet);
            return retorno;
        }

        public ActionResult GetDonutSprint(long idSprint)
        {
            var sprint = db.Sprint.Find(idSprint);

            var burnDown = new DonutSprint(sprint);
            var retorno = Json(burnDown, JsonRequestBehavior.AllowGet);
            return retorno;
        }

        public ActionResult GetSprintProjeto(long idProjeto)
        {
            var result = string.Empty;



            var list = new List<Sprint>();
            //list = from json in db.Sprint where  select json;
            //string result = JsonConvert.SerializeObject(list, Formatting.Indented);

            ViewBag.pIdSprint = new SelectList(db.Sprint.Where(s => s.idProjeto.Equals(idProjeto)).ToList(), "id", "titulo");
            
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}