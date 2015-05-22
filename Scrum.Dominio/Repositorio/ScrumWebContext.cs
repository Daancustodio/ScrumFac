using Scrum.Dominio.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Web;

namespace Scrum.Web.Models
{
    public class ScrumWebContext : DbContext
    {
        public ScrumWebContext()
            : base("name=ScrumWebContext")
        {
        }

        public DbSet<Papel> Papel { get; set; }

        public DbSet<Projeto> Projeto { get; set; }

        public DbSet<Estoria> Estoria { get; set; }

        public DbSet<Status> Status { get; set; }

        public DbSet<Sprint> Sprint { get; set; }

        public DbSet<Tarefa> Tarefa { get; set; }

        public DbSet<Time> Time { get; set; }

        public DbSet<TipoTarefa> TipoTarefa { get; set; }

        public DbSet<MembroTime> MembroTimes { get; set; }

        public DbSet<Usuario> Usuario { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
            modelBuilder.Entity<Papel>().ToTable("Papel");
            modelBuilder.Entity<Projeto>().ToTable("Projeto");
            modelBuilder.Entity<Estoria>().ToTable("Estoria");
            modelBuilder.Entity<Status>().ToTable("Status");
            modelBuilder.Entity<Sprint>().ToTable("Sprint");
            modelBuilder.Entity<Tarefa>().ToTable("Tarefa");
            modelBuilder.Entity<Time>().ToTable("Time");
            modelBuilder.Entity<TipoTarefa>().ToTable("TipoTarefa");
            modelBuilder.Entity<MembroTime>().ToTable("MembroTime");
            modelBuilder.Entity<Usuario>().ToTable("Usuario");

        }
    }
}
