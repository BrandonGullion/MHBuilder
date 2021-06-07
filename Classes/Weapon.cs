using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

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
        public string Melody { get; set; }
        public int ShellingLevel { get; set; }
        public int Damage { get; set; }
        public string ElementType { get; set; }
        public double ElementalDamage { get; set; }
        public double Affinity { get; set; }
        public string ArcShot { get; set; }
        public string ShotType { get; set; }

        // Deviation, recoil, reload, cluster, special ammo
        public string BowGunSpecs { get; set; }


        // Sharpness Integers

        public double RedSharpness { get; set; }
        public double OrangeSharpness { get; set; }
        public double YellowSharpness { get; set; }
        public double GreenSharpness { get; set; }
        public double BlueSharpness { get; set; }
        public double WhiteSharpness { get; set; }
        public double PurpleSharpness { get; set; }


        // Rampage skills 
        public string StringRampageSkills { get; set; }
        [NotMapped]
        public List<RampageSkill> RampageSkills { get; set; }

        // Decoration slots and their level 
        public int DecoSlot1Lvl { get; set; }
        public int DecoSlot2Lvl { get; set; }
        public int DecoSlot3Lvl { get; set; }
    }
}
