using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Scrum.Dominio.Models
{
    public class Projeto
    {
        [Key]
        public long id { get; set; }
        [Display(Name = "Título")]
        [Required(ErrorMessage = "Informe o título do projeto.")]
        [StringLength(50, MinimumLength = 1, ErrorMessage = "O campo deve conter no maximo 50 caracteres.")]
        public string titulo { get; set; }
        [Display(Name = "Descrição")]
        [Required(ErrorMessage = "Informe a descrição do projeto")]
        [StringLength(250, MinimumLength = 1, ErrorMessage = "O campo deve conter no maximo 250 caracteres.")]
        public string descricao { get; set; }
        [Display(Name = "Data criação")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime dataCriacao { get; set; }
        [Display(Name = "Data exclusão")]
        public DateTime? dataExclusao { get; set; }
        [Display(Name = "Excluído")]
        public bool foiExcluido { get; set; }
        public long idUsuario { get; set; }
        public virtual ICollection<Sprint> sprints { get; set; }
        [ForeignKey("idUsuario")]
        public virtual Usuario usuario { get; set; }
    }
}
