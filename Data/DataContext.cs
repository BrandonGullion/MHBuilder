using Microsoft.EntityFrameworkCore;
using Classes;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;

namespace Data
{
    public class DataContext : IdentityDbContext<DevUser>
    {
        public DbSet<Decoration> Decorations { get; set; }
        public DbSet<Skill> Skills { get; set; }
        public DbSet<Armor> Armors { get; set; }
        public DbSet<Weapon> Weapons { get; set; }
        public DbSet<RampageSkill> RampageSkills { get; set; }
        public DbSet<Fixes> Fixes { get; set; }
        public DbSet<Update> Updates { get; set; }
        public DbSet<Bulletin> Bulletins { get; set; }

        public DataContext (DbContextOptions options) : base(options)
        {

        }
    }
}