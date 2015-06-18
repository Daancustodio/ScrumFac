using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Scrum.Dominio.Models;
using Scrum.Web.Models;

namespace Scrum.Web.Controllers
{
    [Authorize]
    public class SprintController : Controller
    {
        private ScrumWebContext db = new ScrumWebContext();

        // GET: Sprint
        public async Task<ActionResult> Index()
        {
            return View(await db.Sprint.Where(s=>s.foiExcluido.Equals(false)).ToListAsync());
        }

        // GET: Sprint/Details/5
        public async Task<ActionResult> Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.NotFound);
            }
            Sprint sprint = await db.Sprint.FindAsync(id);
            //sprint.estorias = db.Estoria.Where(x => x.idSprint == sprint.id).ToList();

            //foreach (var estoria in sprint.estorias)
            //{
            //    estoria.tarefas = db.Tarefa.Where(x => x.idEstoria == estoria.id).ToList();
            //}

            if (sprint == null)
            {
                return HttpNotFound();
            }
            return View(sprint);
        }

        // GET: Sprint/Create
        public ActionResult Create()
        {

            ViewBag.idProjeto = new SelectList(db.Projeto.Where(p=>p.foiExcluido.Equals(false)), "id", "titulo");
            ViewBag.idStatus = new SelectList(db.Status, "idStatus", "status");
            return View();
        }

        // POST: Sprint/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Sprint sprint)
        {
            sprint.dataCriacao = DateTime.Now;

            if (ModelState.IsValid)
            {
                db.Sprint.Add(sprint);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.idProjeto = new SelectList(db.Projeto.Where(p => p.foiExcluido.Equals(false)), "id", "titulo");
            ViewBag.idStatus = new SelectList(db.Status, "idStatus", "status");
            return View(sprint);
        }

        // GET: Sprint/Edit/5
        public async Task<ActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sprint sprint = await db.Sprint.FindAsync(id);
            if (sprint == null)
            {
                return HttpNotFound();
            }
           
            ViewBag.idProjeto = new SelectList(db.Projeto.Where(p => p.foiExcluido.Equals(false)), "id", "titulo", sprint.projeto);
            ViewBag.idStatus = new SelectList(db.Status, "idStatus", "status", sprint.status);
            return View(sprint);
        }

        // POST: Sprint/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(Sprint sprint)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sprint).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.idProjeto = new SelectList(db.Projeto.Where(p => p.foiExcluido.Equals(false)), "id", "titulo", sprint.projeto);
            ViewBag.idStatus = new SelectList(db.Status, "idStatus", "status", sprint.status);

            return View(sprint);
        }

        // GET: Sprint/Delete/5
        public async Task<ActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sprint sprint = await db.Sprint.FindAsync(id);
            if (sprint == null)
            {
                return HttpNotFound();
            }
            return View(sprint);
        }

        // POST: Sprint/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(long id)
        {
            Sprint sprint = await db.Sprint.FindAsync(id);
            sprint.foiExcluido = true;
            sprint.dataExclusao = DateTime.Now;
            db.Entry(sprint).State = EntityState.Modified;
            await db.SaveChangesAsync();

            return Json(new { success = true });
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
