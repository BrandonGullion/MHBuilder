using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes
{
    public class Skill
    {
        public int Id { get; set; }
        public string Name { get; set; }

        // Skill description 
        public string Description { get; set; }

        // List of stats, use * to break the strings apart 
        public string Stats { get; set; }
        
        // Targets a specific stat to be updated 
        public string StatType { get; set; }

        public int MaxLevel { get; set; }

    }
}
