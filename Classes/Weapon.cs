using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classes
{
    public class Weapon
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public int Rarity { get; set; }
        public int DefenseIncrease { get; set; }
        public string PhialOrShellingType { get; set; }
        public double Damage { get; set; }
        public string ElementType { get; set; }
        public double ElementalDamage { get; set; }
        public double Affinity { get; set; }


        // Sharpness Integers

        public int RedSharpness { get; set; }
        public int OrangeSharpness { get; set; }
        public int YellowSharpness { get; set; }
        public int GreenSharpness { get; set; }
        public int BlueSharpness { get; set; }
        public int WhiteSharpness { get; set; }
        public int PurpleSharpness { get; set; }


        // Rampage skills 
        public int RampageSlots { get; set; }
        public string StringRampageSkills { get; set; }

        // Decoration slots and their level 
        public int DecoSlot1Lvl { get; set; }
        public int DecoSlot2Lvl { get; set; }
        public int DecoSlot3Lvl { get; set; }

    }
}
