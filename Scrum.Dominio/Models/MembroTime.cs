using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Scrum.Dominio.Models
{
    public class MembroTime
    {
        [Key]
        public long id { get; set; }
        [Display(Name = "Data do cadastro")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime dataCriacao { get; set; }
        [Display(Name = "Data da exclusão")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime? dataExclusao { get; set; }
        [Display(Name = "Excluido")]
        public bool foiExcluido { get; set; }
        [Display(Name = "Papel")]
        [Required(ErrorMessage = "Selecione um papel para o membro.")]
        public long idPapel { get; set; }
        [Display(Name = "Time")]
        [Required(ErrorMessage = "Selecione um time para o membro.")]
        public long idTime { get; set; }
        [Required(ErrorMessage = "Informe o nome do menbro.")]
        [Display(Name = "Nome")]
        [StringLength(30,MinimumLength=1,ErrorMessage="O nome deve conter no máximo 30 caracteres.")]
        public string nome { get; set; }
        [ForeignKey("idPapel")]
        public virtual Papel papel { get; set; }
        [ForeignKey("idTime")]
        public virtual Time time { get; set; }
        public virtual ICollection<Tarefa> tarefas { get; set; }
    }
}
