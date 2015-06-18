using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Scrum.Dominio.Models
{
    public class DonutSprint
    {
        public List<Donut> DataChart { get; set; }
        private Sprint sprint;
        public DonutSprint(Sprint sprint)
        {
            if (sprint == null)
                throw new Exception("Informe a sprint");

            this.sprint = sprint;
            this.DataChart = new List<Donut>();
            CreateDonutChart();
        }

        private void CreateDonutChart()
        {
             List<Tarefa> tarefas = new List<Tarefa>();

             sprint.estorias.ToList().ForEach(
                 estoria => estoria.tarefas.ToList().ForEach
                     (
                        ta => tarefas.Add(ta)
                     )
                 );

             var totalConcluido = tarefas.Where(c => c.FoiConcluida()).Sum(x => x.horasEstimativa.Hours);

             this.DataChart.Add(new Donut(totalConcluido, "Total Concluido"));
             this.DataChart.Add(new Donut(tarefas.Sum(s => s.horasEstimativa.Hours), "A fazer"));
            
        }

    }

    public class Donut{
        public Donut (int valor, string _label)
	{
        this.value = valor;
        this.label = _label;
        this.color = "#F7464A";
        this.highlight = "#FF5A5E";
	}
    public int value { get; set; } 
    public string color { get; set; } 
    public string highlight { get; set; } 
    public string label { get; set; }
    }
}
