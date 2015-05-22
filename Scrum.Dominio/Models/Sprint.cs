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
        [Required(ErrorMessage = "Informar o título da sprint.")]
        public string descricao { get; set; }
        [Required(ErrorMessage = "Informar o título da sprint.")]
        [Display(Name = "Dias úteis")]
        public int diasUteis { get; set; }
        [Display(Name = "Dias de cerimonias")]
        public int? diasCerimonias { get; set; }
        [Required(ErrorMessage = "Informar o título da sprint.")]
        [Display(Name = "Horas de trabalho dia")]
        [DisplayFormat(DataFormatString = "{0:dd}")]
        public TimeSpan horasTrabDia { get; set; }
        [Display(Name = "Foco")]
        
        public int foco { get; set; }
        [Display(Name = "Data ínicio")]
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
    }
}
