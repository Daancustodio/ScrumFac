using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Scrum.Dominio.Models
{
    public class Sprint
    {
        [Key]
        public long id { get; set; }
        [Required(ErrorMessage = "Informar o título da sprint.")]
        [Display(Name = "Título")]
        public string titulo { get; set; }
        [Display(Name = "Descrição")]
        [Required(ErrorMessage = "Informar a descrição da sprint.")]
        public string descricao { get; set; }
        [Required(ErrorMessage = "Informar os dias úteis da sprint.")]
        [Display(Name = "Dias úteis")]
        public int diasUteis { get; set; }
        [Display(Name = "Dias de cerimônias")]
        public int? diasCerimonias { get; set; }
        [Required(ErrorMessage = "Informar as horas de trabalho dia da sprint.")]
        [Display(Name = "Horas de trabalho/dia")]
        [DataType(DataType.Time)]       
        public TimeSpan horasTrabDia { get; set; }
        [Display(Name = "Foco")]        
        public int foco { get; set; }
        [Display(Name = "Data início")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime? dataInicio { get; set; }
        [Display(Name = "Data conclusão")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime? dataConclusao { get; set; }
        [Display(Name = "Data da criação")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime dataCriacao { get; set; }
        public DateTime? dataExclusao { get; set; }
        public bool foiExcluido { get; set; }
        [Display(Name = "Projeto")]
        [Required(ErrorMessage = "Selecione um projeto.")]        
        public long idProjeto { get; set; }
        public int idStatus { get; set; }
        public virtual ICollection<Estoria> estorias { get; set; }
        [ForeignKey("idProjeto")]
        public virtual Projeto projeto { get; set; }
        [ForeignKey("idStatus")]
        public virtual Status status { get; set; }

        public decimal GetHorasConcluidas()
        {
            List<Tarefa> tarefas = new List<Tarefa>();

            this.estorias.ToList().ForEach(
                estoria => estoria.tarefas.ToList().ForEach
                    (
                       ta => tarefas.Add(ta)
                    )
                );

            return tarefas.Where(c => c.FoiConcluida()).Sum(x => x.horasEstimativa.Hours);
        }

        public decimal GetHorasRestantes()
        {
            List<Tarefa> tarefas = new List<Tarefa>();

            this.estorias.ToList().ForEach(
                estoria => estoria.tarefas.ToList().ForEach
                    (
                       ta => tarefas.Add(ta)
                    )
                );

            return tarefas.Sum(x => x.horasEstimativa.Hours) - this.GetHorasConcluidas();
        }

        public string GetQuantindadeTarefasConcluidas()
        {
            List<Tarefa> tarefas = new List<Tarefa>();

            this.estorias.ToList().ForEach(
                estoria => estoria.tarefas.ToList().ForEach
                    (
                       ta => tarefas.Add(ta)
                    )
                );

            var concluidas = tarefas.Where(x => x.FoiConcluida()).ToList().Count;

            return string.Concat(concluidas, "/", tarefas.Count);

        }

        public string GetQuantindadeEstoriasConcluidas()
        {
            int concluidas = 0;

            foreach (var estoria in estorias)
            {
                if (estoria.tarefas.ToList().TrueForAll(x => x.FoiConcluida()))
                    concluidas++;
            }            

            return string.Concat(concluidas, "/", estorias.Count);

        }

    }
}
