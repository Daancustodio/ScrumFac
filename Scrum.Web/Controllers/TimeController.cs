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
    public class TimeController : Controller
    {
        private ScrumWebContext db = new ScrumWebContext();

        // GET: Time
        public async Task<ActionResult> Index()
        {
            return View(await db.Time.Where(t=>t.foiExcluido.Equals(false)).ToListAsync());
        }

        // GET: Time/Details/5
        public async Task<ActionResult> Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Time time = await db.Time.FindAsync(id);
            if (time == null)
            {
                return HttpNotFound();
            }
            return View(time);
        }

        // GET: Time/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Time/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Time time)
        {
            time.dataCriacao = DateTime.Now;
            if (ModelState.IsValid)
            {
                db.Time.Add(time);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(time);
        }

        // GET: Time/Edit/5
        public async Task<ActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Time time = await db.Time.FindAsync(id);
            if (time == null)
            {
                return HttpNotFound();
            }
            return View(time);
        }

        // POST: Time/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(Time time)
        {
            if (ModelState.IsValid)
            {
                db.Entry(time).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(time);
        }

        // GET: Time/Delete/5
        public async Task<ActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Time time = await db.Time.FindAsync(id);
            if (time == null)
            {
                return HttpNotFound();
            }
            return View(time);
        }

        // POST: Time/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(long id)
        {
            Time time = await db.Time.FindAsync(id);
            time.foiExcluido = true;
            time.dataExclusao = DateTime.Now;
            db.Entry(time).State = EntityState.Modified;
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
