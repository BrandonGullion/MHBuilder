using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes
{
    public class Armor 
    {

        public int Id { get; set; }
        public string Name { get; set; }

        public string Rank { get; set; }

        // Typing should always use the armor type enum.tostring()
        public string Type { get; set; }
        public int Rarity { get; set; }
        public int ArmorSetId { get; set; }
        public string ArmorSetName { get; set; }

        // Defensive stats 
        public double Defense { get; set; }
        public double FireRes { get; set; }
        public double WaterRes { get; set; }
        public double ThunderRes { get; set; }
        public double IceRes { get; set; }
        public double DragonRes { get; set; }

        // Decoration slots and their level 
        public int DecoSlot1Lvl { get; set; }
        public int DecoSlot2Lvl { get; set; }
        public int DecoSlot3Lvl { get; set; }
        public string StringSkills { get; set; }
        [NotMapped]
        public List<Skill> Skills { get; set; }

    }
}
