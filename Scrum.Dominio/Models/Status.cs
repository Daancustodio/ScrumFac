using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace Scrum.Dominio.Models
{
    public class Status
    {
        [Key]
        public int idStatus { get; set; }
        [Display(Name = "Status")]
        public string status { get; set; }
        public virtual ICollection<Estoria> estorias { get; set; }
        public virtual ICollection<Sprint> sprints { get; set; }
        public virtual ICollection<Tarefa> tarefas { get; set; }
    }
}
