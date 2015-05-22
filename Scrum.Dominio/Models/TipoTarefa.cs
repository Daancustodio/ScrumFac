using Scrum.Dominio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Scrum.Dominio.Models
{
    public class TipoTarefa
    {
       [Key]
        public long id { get; set; }
        [Display(Name = "Título")]
        [Required(ErrorMessage = "Informar o título.")]
        public string titulo { get; set; }
        [Display(Name = "Descrição")]
        [Required(ErrorMessage = "Informar a descrição.")]
        public string descricao { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        [Display(Name = "Data do cadastro")]
        public DateTime dataCriacao { get; set; }
        public DateTime? dataExclusao { get; set; }
        public bool foiExcluido { get; set; }
        public long? idUsuario { get; set; }
        public virtual ICollection<Tarefa> tarefas { get; set; }
        [ForeignKey("idUsuario")]
        public virtual Usuario usuario { get; set; }
    }
}
