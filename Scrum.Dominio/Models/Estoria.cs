using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Scrum.Dominio.Models
{
    public class Estoria
    {
        [Key]
        public long id { get; set; }
        [Display(Name= "Título")]
        [Required(ErrorMessage = "O campo título é obrigatório.")]
        public string titulo { get; set; }
        [Display(Name = "Descrição")]
        [Required(ErrorMessage = "O campo descrição é obrigatório.")]
        [DataType(DataType.MultilineText)]
        public string descricao { get; set; }
        [Display(Name = "Pontos estimados")]
        [DataType(DataType.Text)]
        [Required(ErrorMessage = "O campo pontos estimados é obrigatório.")]
        public int pontosEstimados { get; set; }
        [Display(Name = "Início")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime? dataInicio { get; set; }
        [Display(Name = "Término")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime? dataConclusao { get; set; }
        
        [Display(Name = "Data criação")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true )]
        public DateTime dataCriacao { get; set; }
        [Display(Name = "Data exclusão")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime? dataExclusao { get; set; }
        [Display(Name = "Excluido")]
        public bool foiExcluido { get; set; }
        [Required(ErrorMessage = "Selecione uma sprint.")]
        [Display(Name= "Sprint")]
        public long idSprint { get; set; }
        [Required(ErrorMessage = "Selecione um status.")]
        [Display(Name = "Status")]
        public int idStatus { get; set; }
        public virtual ICollection<Tarefa> tarefas { get; set; }

        [ForeignKey("idSprint")]        
        public virtual Sprint sprint { get; set; }
        [ForeignKey("idStatus")]        
        public virtual Status status { get; set; }
    }
}
