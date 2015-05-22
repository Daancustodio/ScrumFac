using Scrum.Dominio.Models;
using Scrum.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Scrum.Web.Controllers
{
    public class AutenticacaoController : Controller
    {
        private ScrumWebContext db = new ScrumWebContext();
        // GET: Autenticacao
        public ActionResult Login()
        {
            return View(new Usuario());
        }
        [HttpPost]
        public ActionResult Login(Usuario usuario)
        {
            Usuario user = db.Usuario.FirstOrDefault(u => u.email == usuario.email);


            if (Equals(usuario.email, "") || Equals(usuario.email, null))
            {
                Response.Write("<script>alert('Informe o usuario.');</script>");
            }
            else if (Equals(usuario.senha, "") || Equals(usuario.senha, null))
            {
                Response.Write("<script>alert('Informe a Senha.');</script>");
            }
            else if (!Equals(usuario.email, user.email) && !Equals(usuario.senha, user.senha))
            {
                Response.Write("<script>alert('Usuario não cadastrado.');</script>");
            }

            else if (!Equals(usuario.senha, user.senha))
            {
                ModelState.AddModelError("", "Senha não confere");
                Response.Write(@"<script>alert('Senha não confere');</script>");
            }
            else
            {
                FormsAuthentication.SetAuthCookie(user.email, false);
                Sessoes.RegistraCookieAutenticacao(user);
                Sessoes.UsuarioLogado = user;
                ViewBag.UsuarioLogado = user.nome;
                return Redirect("/Home/Index");

            }
            return View(new Usuario());
        }
        public ActionResult Cadastro()
        {
            return View();
        }
        [HttpPost]
        public async Task<ActionResult> Cadastro(Usuario usuario)
        {
            usuario.dataCriacao = DateTime.Now;
            if (usuario.senha == usuario.senha)
            {
                if (ModelState.IsValid)
                {
                    db.Usuario.Add(usuario);
                    await db.SaveChangesAsync();
                    return RedirectToAction("Login");
                }
            }
            return View(usuario);
        }
        [HttpPost]
        public ActionResult Sair()
        {
            //System.Net.Mime.MediaTypeNames.Application.Contents.Clear();
            Session.Abandon();
            HttpContext.Application.Contents.Clear();
            HttpContext.Session.Clear();
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");

        }
    }
}