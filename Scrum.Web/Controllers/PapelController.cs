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
    public class PapelController : Controller
    {
        private ScrumWebContext db = new ScrumWebContext();

        // GET: Papel
        public async Task<ActionResult> Index()
        {
            return View(await db.Papel.Where(e=>e.foiExcluido.Equals(false)).ToListAsync());
        }

        // GET: Papel/Details/5
        public async Task<ActionResult> Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Papel papel = await db.Papel.FindAsync(id);
            if (papel == null)
            {
                return HttpNotFound();
            }
            return View(papel);
        }

        // GET: Papel/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Papel/Create       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Papel papel)
        {
            papel.dataCriacao = DateTime.Now;
            //papel.idUsuario = Sessoes.UsuarioLogado.id;
                
            if (ModelState.IsValid)
            {
                db.Papel.Add(papel);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(papel);
        }

        // GET: Papel/Edit/5
        public async Task<ActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Papel papel = await db.Papel.FindAsync(id);
            if (papel == null)
            {
                return HttpNotFound();
            }
            return View(papel);
        }

        // POST: Papel/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(Papel papel)
        {
            if (ModelState.IsValid)
            {
                db.Entry(papel).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(papel);
        }

        // GET: Papel/Delete/5
        public async Task<ActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Papel papel = await db.Papel.FindAsync(id);
            if (papel == null)
            {
                return HttpNotFound();
            }
            return View(papel);
        }

        // POST: Papel/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(long id)
        {
            Papel papel = await db.Papel.FindAsync(id);
            papel.foiExcluido = true;
            db.Entry(papel).State = EntityState.Modified;
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
