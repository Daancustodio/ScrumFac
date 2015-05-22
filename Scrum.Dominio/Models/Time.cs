using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Scrum.Dominio.Models
{
    public class Time
    {
        [Key]
        public long id { get; set; }
        [Display(Name = "Nome")]
        [Required(ErrorMessage = "Informe o nome do time.")]
        public string nome { get; set; }
        [Display(Name ="Data do cadastro")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime dataCriacao { get; set; }
        public DateTime? dataExclusao { get; set; }
        public bool foiExcluido { get; set; }
        public long? idUsuario { get; set; }
        public virtual ICollection<MembroTime> membrotimes { get; set; }
        [ForeignKey("idUsuario")]
        public virtual Usuario usuario { get; set; }
    }
}
