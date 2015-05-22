using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Scrum.Dominio.Models
{
    public class Tarefa
    {
        [Key]
        public long id { get; set; }
        [Display(Name = "Título")]
        [Required(ErrorMessage = "Informe o título.")]
        public string titulo { get; set; }
        [Display(Name = "Descrição")]
        [Required(ErrorMessage = "Informe a descrição.")]
        public string descricao { get; set; }
        [Display(Name = "Estimativa")]
        [Required(ErrorMessage = "Informe a estimativa.")]
        public TimeSpan horasEstimativa { get; set; }
        [Display(Name = "Efetiva")]
        public TimeSpan? horasEfetiva { get; set; }
        [Display(Name = "Termino")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime? dataConclusao { get; set; }
        [Display(Name = "Observação")]
        //[Required(ErrorMessage = "Informe a Observação.")]
        public string obs { get; set; }
        [Display(Name = "Início")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        [Required(ErrorMessage = "Informe a data de início.")]
        public DateTime dataInicio { get; set; }
        [Display(Name = "Data de cadastro")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime dataCriacao { get; set; }
        public DateTime? dataExclusao { get; set; }
        public bool foiExcluido { get; set; }
        [Display(Name = "História")]
        public long idEstoria { get; set; }
        [Display(Name = "Tipo de tarefa")]
        public long idTipotarefa { get; set; }
        [Display(Name = "Usuario")]
        public long? idUsuarioPapelTime { get; set; }
        [Display(Name = "Status")]
        public int idStatus { get; set; }
        [ForeignKey("idEstoria")]
        public virtual Estoria estoria { get; set; }
        [ForeignKey("idUsuarioPapelTime")]
        public virtual MembroTime membrotime { get; set; }
        [ForeignKey("idStatus")]
        public virtual Status status { get; set; }
        [ForeignKey("idTipotarefa")]
        public virtual TipoTarefa tipotarefa { get; set; }
    }
}
