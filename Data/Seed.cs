using System.Collections.Generic;
using System.Linq;
using Classes;

namespace Data
{
    public class Seed
    {
        public static void SeedSkills(DataContext context)
        {
            if(context.Skills.Any()) return;

            var list = new List<Skill>{
                new Skill {
                    Name = "Attack Boost",
                    Type = "Normal",
                    Description = "Increase Attack Power",
                    Stats = "Attack +3", 
                },
                new Skill {
                    Name = "Attack Boost",
                    Type = "Normal",
                    Description = "Increase Attack Power",
                    Stats = "Attack +6", 
                },
                new Skill {
                    Name = "Attack Boost",
                    Type = "Normal",
                    Description = "Increase Attack Power",
                    Stats = "Attack +9", 
                },
                new Skill {
                    Name = "Attack Boost",
                    Type = "Normal",
                    Description = "Increase Attack Power",
                    Stats = "Attack +5%, Bonus 7", 
                },
                new Skill {
                    Name = "Attack Boost",
                    Type = "Normal",
                    Description = "Increase Attack Power",
                    Stats = "Attack +6%, Bonus 8", 
                },
                new Skill {
                    Name = "Attack Boost",
                    Type = "Normal",
                    Description = "Increase Attack Power",
                    Stats = "Attack +8%, Bonus 9", 
                },
                new Skill {
                    Name = "Attack Boost",
                    Type = "Normal",
                    Description = "Increase Attack Power",
                    Stats = "Attack +10%, Bonus 10", 
                },
            } ;

            context.AddRange(list);
            context.SaveChanges();

        }
    }
}