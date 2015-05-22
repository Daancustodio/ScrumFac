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
    public class TarefaController : Controller
    {
        private ScrumWebContext db = new ScrumWebContext();

        // GET: Tarefa
        public async Task<ActionResult> Index()
        {
            var tarefa = db.Tarefa.Include(t => t.estoria).Include(t => t.membrotime).Include(t => t.status).Include(t => t.tipotarefa).Where(t => t.foiExcluido.Equals(false));
            return View(await tarefa.ToListAsync());
        }

        // GET: Tarefa/Details/5
        public async Task<ActionResult> Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tarefa tarefa = await db.Tarefa.FindAsync(id);
            if (tarefa == null)
            {
                return HttpNotFound();
            }
            return View(tarefa);
        }

        // GET: Tarefa/Create
        public ActionResult Create()
        {
            ViewBag.idEstoria = new SelectList(db.Estoria.Where(e => e.foiExcluido.Equals(false)).Where(e => e.idStatus != 3), "id", "titulo");
            ViewBag.idUsuarioPapelTime = new SelectList(db.MembroTimes.Where(m=>m.foiExcluido.Equals(false)), "id", "nome");
            ViewBag.idStatus = new SelectList(db.Status, "idStatus", "status");
            ViewBag.idTipotarefa = new SelectList(db.TipoTarefa.Where(t=>t.foiExcluido.Equals(false)), "id", "titulo");
            return View();
        }
        // POST: Tarefa/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Tarefa tarefa)
        {
            tarefa.dataCriacao = DateTime.Now;
            tarefa.obs = string.Empty;

            if (ModelState.IsValid)
            {
                db.Tarefa.Add(tarefa);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.idEstoria = new SelectList(db.Estoria.Where(e => e.foiExcluido.Equals(false)).Where(e => e.idStatus != 3), "id", "titulo", tarefa.idEstoria);
            ViewBag.idUsuarioPapelTime = new SelectList(db.MembroTimes.Where(m => m.foiExcluido.Equals(false)), "id", "nome", tarefa.idUsuarioPapelTime);
            ViewBag.idStatus = new SelectList(db.Status, "idStatus", "status", tarefa.idStatus);
            ViewBag.idTipotarefa = new SelectList(db.TipoTarefa.Where(t => t.foiExcluido.Equals(false)), "id", "titulo", tarefa.idTipotarefa);
            return View(tarefa);
        }

        // GET: Tarefa/Edit/5

        public async Task<ActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tarefa tarefa = await db.Tarefa.FindAsync(id);
            if (tarefa == null)
            {
                return HttpNotFound();
            }
            ViewBag.idEstoria = new SelectList(db.Estoria.Where(e => e.foiExcluido.Equals(false)).Where(e => e.idStatus != 3), "id", "titulo", tarefa.idEstoria);
            ViewBag.idUsuarioPapelTime = new SelectList(db.MembroTimes.Where(m => m.foiExcluido.Equals(false)), "id", "nome", tarefa.idUsuarioPapelTime);
            ViewBag.idStatus = new SelectList(db.Status, "idStatus", "status", tarefa.idStatus);
            ViewBag.idTipotarefa = new SelectList(db.TipoTarefa.Where(t => t.foiExcluido.Equals(false)), "id", "titulo", tarefa.idTipotarefa);
            return View(tarefa);
        }

        // POST: Tarefa/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(Tarefa tarefa)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tarefa).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.idEstoria = new SelectList(db.Estoria.Where(e => e.foiExcluido.Equals(false)).Where(e => e.idStatus != 3), "id", "titulo", tarefa.idEstoria);
            ViewBag.idUsuarioPapelTime = new SelectList(db.MembroTimes.Where(m => m.foiExcluido.Equals(false)), "id", "nome", tarefa.idUsuarioPapelTime);
            ViewBag.idStatus = new SelectList(db.Status, "idStatus", "status", tarefa.idStatus);
            ViewBag.idTipotarefa = new SelectList(db.TipoTarefa.Where(t => t.foiExcluido.Equals(false)), "id", "titulo", tarefa.idTipotarefa);
            return View(tarefa);
        }

        // GET: Tarefa/Delete/5
        public async Task<ActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tarefa tarefa = await db.Tarefa.FindAsync(id);
            if (tarefa == null)
            {
                return HttpNotFound();
            }
            return View(tarefa);
        }

        // POST: Tarefa/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(long id)
        {
            Tarefa tarefa = await db.Tarefa.FindAsync(id);
            tarefa.dataExclusao = DateTime.Now;
            tarefa.foiExcluido = true;
            db.Entry(tarefa).State = EntityState.Modified;
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
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
