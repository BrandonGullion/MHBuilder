using Microsoft.EntityFrameworkCore;
using Classes;

namespace Data
{
    public class DataContext : DbContext
    {
        public DbSet<Decoration> Decorations { get; set; }
        public DbSet<Skill> Skills { get; set; }
        public DbSet<Armor> Armors { get; set; }
        public DbSet<Weapon> Weapons { get; set; }
        public DbSet<RampageSkill> RampageSkills { get; set; }

        public DataContext (DbContextOptions options) : base(options)
        {

        }
    }
}