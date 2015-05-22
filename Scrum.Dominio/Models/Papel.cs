using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Scrum.Dominio.Models
{
    public class Papel
    {
        [Key]
        public long id { get; set; }
        [Display(Name = "Título")]
        [Required(ErrorMessage = "Informa o título.")]
        public string titulo { get; set; }
        [Display(Name = "Descrição")]
        [Required(ErrorMessage = "Informa a descrição .")]
        public string descricao { get; set; }
        [Display(Name = "Data da criação")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime dataCriacao { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime? dataExclusao { get; set; }
        public bool foiExcluido { get; set; }
        [Display(Name = "Usuario")]       
        public long? idUsuario { get; set; }
        public virtual ICollection<MembroTime> membrotimes { get; set; }
        [ForeignKey("idUsuario")]
        public virtual Usuario usuario { get; set; }
    }
}
