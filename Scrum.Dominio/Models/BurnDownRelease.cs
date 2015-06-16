using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Scrum.Dominio.Models
{

    public class BurnDownRelease
    {

        public int Finalizado { get; private set; }
        public int EmAndamento { get; private set; }
        public List<string> SprintNome { get; private set; }


        public BurnDownRelease(Projeto projetoSprint)
        {
            this.CriarBurnDownRelease(projetoSprint);
        }

        private void CriarBurnDownRelease(Projeto projeto)
        {
            var concluida = projeto.sprints.Where(c => c.dataConclusao != null).Where(e => e.foiExcluido.Equals(false)).ToList();
            var emAndamento = projeto.sprints.Where(e => e.dataConclusao.Equals(null)).Where(e => e.foiExcluido.Equals(false)).ToList();

        }

    }
}
