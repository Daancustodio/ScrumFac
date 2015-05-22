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
    public class TipoTarefaController : Controller
    {
        private ScrumWebContext db = new ScrumWebContext();

        // GET: TipoTarefa
        public async Task<ActionResult> Index()
        {
            return View(await db.TipoTarefa.Where(t=>t.foiExcluido.Equals(false)).ToListAsync());
        }

        // GET: TipoTarefa/Details/5
        public async Task<ActionResult> Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TipoTarefa tipoTarefa = await db.TipoTarefa.FindAsync(id);
            if (tipoTarefa == null)
            {
                return HttpNotFound();
            }
            return View(tipoTarefa);
        }

        // GET: TipoTarefa/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: TipoTarefa/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(TipoTarefa tipoTarefa)
        {
            tipoTarefa.dataCriacao = DateTime.Now;
            tipoTarefa.idUsuario = 1;
            if (ModelState.IsValid)
            {
                db.TipoTarefa.Add(tipoTarefa);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(tipoTarefa);
        }

        // GET: TipoTarefa/Edit/5
        public async Task<ActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TipoTarefa tipoTarefa = await db.TipoTarefa.FindAsync(id);
            if (tipoTarefa == null)
            {
                return HttpNotFound();
            }
            return View(tipoTarefa);
        }

        // POST: TipoTarefa/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(TipoTarefa tipoTarefa)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tipoTarefa).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(tipoTarefa);
        }

        // GET: TipoTarefa/Delete/5
        public async Task<ActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TipoTarefa tipoTarefa = await db.TipoTarefa.FindAsync(id);
            if (tipoTarefa == null)
            {
                return HttpNotFound();
            }
            return View(tipoTarefa);
        }

        // POST: TipoTarefa/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(long id)
        {
            TipoTarefa tipoTarefa = await db.TipoTarefa.FindAsync(id);
            tipoTarefa.dataExclusao = DateTime.Now;
            tipoTarefa.foiExcluido = true;
            db.Entry(tipoTarefa).State = EntityState.Modified;
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
