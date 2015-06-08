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
    public class ProjetoController : Controller
    {
        private ScrumWebContext db = new ScrumWebContext();
        Usuario user = Sessoes.UsuarioLogado();

        // GET: Projeto
        public async Task<ActionResult> Index()
        {
            return View(await db.Projeto.Where(f=>f.foiExcluido.Equals(false)).ToListAsync());
        }

        // GET: Projeto/Details/5
        public async Task<ActionResult> Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Projeto projeto = await db.Projeto.FindAsync(id);
            if (projeto == null)
            {
                return HttpNotFound();
            }
            return View(projeto);
        }

        // GET: Projeto/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Projeto/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Projeto projeto)
        {
            projeto.dataCriacao = DateTime.Now;
            projeto.idUsuario = user.id;

            if (ModelState.IsValid)
            {
                db.Projeto.Add(projeto);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(projeto);
        }

        // GET: Projeto/Edit/5
        public async Task<ActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Projeto projeto = await db.Projeto.FindAsync(id);
            if (projeto == null)
            {
                return HttpNotFound();
            }
            return View(projeto);
        }

        // POST: Projeto/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(Projeto projeto)
        {
            if (ModelState.IsValid)
            {
                db.Entry(projeto).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(projeto);
        }

        // GET: Projeto/Delete/5
        public async Task<ActionResult> Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Projeto projeto = await db.Projeto.FindAsync(id);
            if (projeto == null)
            {
                return HttpNotFound();
            }
            return View(projeto);
        }

        // POST: Projeto/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(long id)
        {
            try
            {
                Projeto projeto = await db.Projeto.FindAsync(id);
                projeto.foiExcluido = true;
                projeto.dataExclusao = DateTime.Now;
                db.Entry(projeto).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                Response.Write(@"<scrip>alert('Não foi possivel excluir o projeto.\n por favor verificar.\n" + ex.Message + "');</script>");
                throw;
            }
           
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
