using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Scrum.Dominio.Models
{
    public class BurnDownSprint
    {
        //public Sprint Sprint { get; set; } 
        public List<int> Meta { get; private set; }
        public List<int> Desempenho { get; private set; }
        public List<string> Legenda { get; private set; }

        public BurnDownSprint(Sprint sprint)
        {
            this.CriarBurnDown(sprint);
        }


        private void CriarBurnDown(Sprint sprint)
        {

            var tarefas = new List<Tarefa>();
            sprint.estorias.ToList().ForEach(c =>
            {
                tarefas.AddRange(c.tarefas);
            });

            var concluidas = tarefas
                .OrderBy(o => o.dataConclusao)
                .Where(w => w.dataConclusao != null)
                .GroupBy(c => c.dataConclusao)
                .Select(c => c.Sum(g => g.horasEstimativa.Hours))
                .ToList();

            var totalHoras = tarefas.Sum(c => c.horasEstimativa.Hours);
            var dias = (sprint.dataConclusao - sprint.dataInicio);

            var meta = new List<int>(dias.Value.Days + 1);
            var desempenho = new List<int>(dias.Value.Days + 1);
            var daysOfSprint = new List<string>(dias.Value.Days + 1);

            var ultimoDesempenho = totalHoras;
            var ultimaMeta = totalHoras;
            desempenho.Add(totalHoras);
            daysOfSprint.Add(sprint.dataInicio.Value.ToString("dd/MM"));
            meta.Add(totalHoras);
            for (int i = 1; i < meta.Capacity; i++)
            {
                var metaDiaria = totalHoras / dias.Value.Days;
                ultimaMeta -= metaDiaria;

                meta.Add(ultimaMeta);
                var dayOfSprint = sprint.dataInicio.Value.AddDays(i).ToString("dd/MM");
                daysOfSprint.Add(dayOfSprint);

                if ((i + 1) <= concluidas.Count)
                {
                    ultimoDesempenho -= concluidas[i];
                    desempenho.Add(ultimoDesempenho);

                }
                else
                    desempenho.Add(ultimoDesempenho);
            }

            meta.Add(0);
            desempenho.Add(ultimoDesempenho);
            daysOfSprint.Add("FIM");

            this.Meta = meta;
            this.Desempenho = desempenho;
            this.Legenda = daysOfSprint;

        }

    }
}
