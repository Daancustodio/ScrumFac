using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Scrum.Dominio.Models
{

    public class BurnDownRelease
    {

        public List<decimal> Concluido { get; private set; }
        public List<string> Legenda { get; private set; }


        public BurnDownRelease(Projeto projetoSprint)
        {

            this.CriarBurnDownRelease(projetoSprint);
        }

        private void CriarBurnDownRelease(Projeto projeto)
        {
            var tarefas = new List<Tarefa>();
            this.Legenda = new List<string>();
            this.Concluido = new List<decimal>();
            projeto.sprints.ToList().ForEach(
                sprint =>
                {
                    tarefas = new List<Tarefa>();
                    sprint.estorias.ToList().ForEach(
                    estoria =>
                    {
                        tarefas.AddRange(estoria.tarefas);
                    });

                    var concluido = tarefas.Where(w => w.dataConclusao != null).Sum(t => t.horasEstimativa.Hours) * 100;
                    var totalPorCento = concluido / tarefas.Sum(x => x.horasEstimativa.Hours);
                    this.Concluido.Add(totalPorCento);
                    this.Legenda.Add(sprint.titulo);
                });
        }

    }
}
