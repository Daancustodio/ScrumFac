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
    public class MembroTimeController : Controller
    {
        private ScrumWebContext db = new ScrumWebContext();

        // GET: MembroTime
        public async Task<ActionResult> Index()
        {
            var membroTimes = db.MembroTimes.Include(m => m.papel).Include(m => m.time).Where(m => m.foiExcluido.Equals(false));
            return View(await membroTimes.ToListAsync());
        }

        // GET: MembroTime/Details/5
        public async Task<ActionResult> Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MembroTime membroTime = await db.MembroTimes.FindAsync(id);
            if (membroTime == null)
            {
                return HttpNotFound();
            }
            return View(membroTime);
        }

        // GET: MembroTime/Create
        public ActionResult Create()
        {
            ViewBag.idPapel = new SelectList(db.Papel, "id", "titulo");
            ViewBag.idTime = new SelectList(db.Time, "id", "nome");
            return View();
        }

        // POST: MembroTime/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(MembroTime membroTime)
        {
            membroTime.dataCriacao = DateTime.Now;
            if (ModelState.IsValid)
            {
                db.MembroTimes.Add(membroTime);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.idPapel = new SelectList(db.Papel, "id", "titulo", membroTime.idPapel);
            ViewBag.idTime = new SelectList(db.Time, "id", "nome", membroTime.idTime);
            return View(membroTime);
        }

        // GET: MembroTime/Edit/5
        public async Task<ActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MembroTime membroTime = await db.MembroTimes.FindAsync(id);
            if (membroTime == null)
            {
                return HttpNotFound();
            }
            ViewBag.idPapel = new SelectList(db.Papel, "id", "titulo", membroTime.idPapel);
            ViewBag.idTime = new SelectList(db.Time, "id", "nome", membroTime.idTime);
            return View(membroTime);
        }

        // POST: MembroTime/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(MembroTime membroTime)
        {
            if (ModelState.IsValid)
            {
                db.Entry(membroTime).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.idPapel = new SelectList(db.Papel, "id", "titulo", membroTime.idPapel);
            ViewBag.idTime = new SelectList(db.Time, "id", "nome", membroTime.idTime);
            return View(membroTime);
        }

        // GET: MembroTime/Delete/5
        public async Task<ActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MembroTime membroTime = await db.MembroTimes.FindAsync(id);
            if (membroTime == null)
            {
                return HttpNotFound();
            }
            return View(membroTime);
        }

        // POST: MembroTime/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(long id)
        {
            MembroTime membroTime = await db.MembroTimes.FindAsync(id);
            membroTime.dataExclusao = DateTime.Now;
            membroTime.foiExcluido = true;
            db.Entry(membroTime).State = EntityState.Modified;
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
