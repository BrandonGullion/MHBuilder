using System;
using System.Collections.Generic;
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
        public string SharpnessURL { get; set; }
        public double Damage { get; set; }
        public string ElementType { get; set; }
        public double ElementalDamage { get; set; }
        public double Affinity { get; set; }

        // Rampage skills 
        public int RampageSlots { get; set; }
        public Skill RampageSkill { get; set; }

        // Decoration slots and their level 
        public int DecoSlot1Lvl { get; set; }
        public int DecoSlot2Lvl { get; set; }
        public int DecoSlot3Lvl { get; set; }

        // Weapon upgrade info 
        public string PreviousWeapon { get; set; }
        public string UpgradeWeapon { get; set; }

    }
}
