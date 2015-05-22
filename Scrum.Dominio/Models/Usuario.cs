using Scrum.Dominio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Scrum.Dominio.Models
{
    public class Usuario
    {
        [Key]
        public long id { get; set; }
        [Display(Name = "E-mail")]
        [Required(ErrorMessage = "Informar o e-mail.")]
        [EmailAddress(ErrorMessage = "Informe um e-mail válido.")]
        public string email { get; set; }
        [Display(Name = "Senha")]
        [Required(ErrorMessage = "Informar a senha.")]
        [DataType(DataType.Password)]
        public string senha { get; set; }

        [NotMapped]
        [Display(Name = "Confirmar senha")]
        [Compare("senha", ErrorMessage = "As senhas nao coincidem.\n Por favor tente novamente.")]
        [DataType(DataType.Password)]
        public string confirmaSenha { get; set; }

        [Display(Name = "Nome")]
        [Required(ErrorMessage = "Informar o nome.")]
        public string nome { get; set; }
        
        public string foto { get; set; }
        public DateTime dataCriacao { get; set; }

        public DateTime? dataExclusao { get; set; }
        public bool foiExcluido { get; set; }
        public virtual ICollection<Papel> papels { get; set; }
        public virtual ICollection<Projeto> projetos { get; set; }
        public virtual ICollection<Time> times { get; set; }
        public virtual ICollection<TipoTarefa> tipotarefas { get; set; }
    }
}
