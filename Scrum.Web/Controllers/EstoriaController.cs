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
using System.Globalization;

namespace Scrum.Web.Controllers
{
    [Authorize]
    public class EstoriaController : Controller
    {
        
        private ScrumWebContext db = new ScrumWebContext();

        // GET: Estoria
        public async Task<ActionResult> Index()
        {
            var estoria = db.Estoria.Include(e => e.sprint).Include(e => e.status).Where(e=>e.foiExcluido.Equals(false));
            return View(await estoria.ToListAsync());
        }

        // GET: Estoria/Details/5
        public async Task<ActionResult> Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Estoria estoria = await db.Estoria.FindAsync(id);
            if (estoria == null)
            {
                return HttpNotFound();
            }
            return View(estoria);
        }

        // GET: Estoria/Create
        public ActionResult Create()
        {
            ViewBag.idSprint = new SelectList(db.Sprint.Where(s=>s.idStatus != 3).Where(s=>s.foiExcluido.Equals(false)), "id", "titulo");
            ViewBag.idStatus = new SelectList(db.Status, "idStatus", "status");
            return View();
        }

        // POST: Estoria/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Estoria estoria)
        {
            estoria.dataCriacao = DateTime.Now;
            if (ModelState.IsValid)
            {
                db.Estoria.Add(estoria);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.idSprint = new SelectList(db.Sprint.Where(s => s.idStatus != 3).Where(s => s.foiExcluido.Equals(false)), "id", "titulo", estoria.idSprint);
            ViewBag.idStatus = new SelectList(db.Status, "idStatus", "status", estoria.idStatus);
            return View(estoria);
        }

        // GET: Estoria/Edit/5
        public async Task<ActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Estoria estoria = await db.Estoria.FindAsync(id);
            if (estoria == null)
            {
                return HttpNotFound();
            }
            ViewBag.idSprint = new SelectList(db.Sprint.Where(s => s.idStatus != 3).Where(s => s.foiExcluido.Equals(false)), "id", "titulo", estoria.idSprint);
            ViewBag.idStatus = new SelectList(db.Status, "idStatus", "status", estoria.idStatus);
            return View(estoria);
        }

        // POST: Estoria/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(Estoria estoria)
        {
            if (ModelState.IsValid)
            {
                db.Entry(estoria).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.idSprint = new SelectList(db.Sprint.Where(s => s.idStatus != 3).Where(s => s.foiExcluido.Equals(false)), "id", "titulo", estoria.idSprint);
            ViewBag.idStatus = new SelectList(db.Status, "idStatus", "status", estoria.idStatus);
            return View(estoria);
        }

        // GET: Estoria/Delete/5
        public async Task<ActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Estoria estoria = await db.Estoria.FindAsync(id);
            if (estoria == null)
            {
                return HttpNotFound();
            }
            return View(estoria);
        }

        // POST: Estoria/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(long id)
        {
            Estoria estoria = await db.Estoria.FindAsync(id);
            estoria.dataExclusao = DateTime.Now;
            estoria.foiExcluido = true;
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
