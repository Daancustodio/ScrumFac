using Scrum.Dominio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.SessionState;

namespace Scrum.Web.Models
{
    public class Sessoes
    {
        //private static HttpSessionState session { get { return HttpContext.Current.Session; } }
        
        //public static Usuario UsuarioLogado
        //{
        //    get { return (Usuario)usuarioLogado["UsuarioLogado"]; }
        //    set { session["UsuarioLogado"] = value; }
        //}
        public static void LogarUser(Usuario usuario)
        {
            HttpCookie cookieUser = new HttpCookie("UserCookieAuthentication");
            cookieUser.Values["IdUsuario"] = usuario.id.ToString();
            //cookieUser.Expires = DateTime.Now.AddMinutes(20);
            cookieUser.Expires = DateTime.Now.AddDays(1);
            HttpContext.Current.Response.Cookies.Add(cookieUser);
        }
        public static Usuario UsuarioLogado()
        {
            var usuario = HttpContext.Current.Request.Cookies["UserCookieAuthentication"];
            if (usuario == null)
            {
                return null;
            }
            else
            {
                var iDUsuario = long.Parse(usuario.Values["IDUsuario"]);

                var usuarioRetornado = RecuperaUsuarioPorID(iDUsuario);
                return usuarioRetornado;

            }
        }
        public static Usuario RecuperaUsuarioPorID(long IDUsuario)
        {
            try
            {
                using (ScrumWebContext db = new ScrumWebContext())
                {
                    var usuario = db.Usuario.Where(u => u.id == IDUsuario).SingleOrDefault();
                    return usuario;
                }
            }
            catch (Exception)
            {
                return null;
            }
        }

    }
}
