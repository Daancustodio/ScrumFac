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
        private static HttpSessionState session { get { return HttpContext.Current.Session; } }
        public static Usuario UsuarioLogado
        {
            get { return (Usuario)session["UsuarioLogado"]; }
            set { session["UsuarioLogado"] = value; }
        }

        public static Usuario RegistraCookieAutenticacao(Usuario IDUsuario)
        {
            //Criando um objeto cookie
            HttpCookie UserCookie = new HttpCookie("UserCookieAuthentication");

            //Setando o ID do usuário no cookie
            //UserCookie.Values["IDUsuario"] = CadeMeuMedico.Repositorios.RepositorioCriptografia.Criptografar(IDUsuario.ToString());

            //Definindo o prazo de vida do cookie
            UserCookie.Expires = DateTime.Now.AddDays(1);

            //Adicionando o cookie no contexto da aplicação
            HttpContext.Current.Response.Cookies.Add(UserCookie);

            return IDUsuario;
        }
    }
}
