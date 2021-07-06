using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Classes;
using Microsoft.AspNetCore.Identity;

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
                    Description = "Increase Attack Power",
                    Stats = "Attack +3", 
                },
                new Skill {
                    Name = "Attack Boost",
                    Description = "Increase Attack Power",
                    Stats = "Attack +6", 
                },
                new Skill {
                    Name = "Attack Boost",
                    Description = "Increase Attack Power",
                    Stats = "Attack +9", 
                },
                new Skill {
                    Name = "Attack Boost",
                    Description = "Increase Attack Power",
                    Stats = "Attack +5%, Bonus 7", 
                },
                new Skill {
                    Name = "Attack Boost",
                    Description = "Increase Attack Power",
                    Stats = "Attack +6%, Bonus 8", 
                },
                new Skill {
                    Name = "Attack Boost",
                    Description = "Increase Attack Power",
                    Stats = "Attack +8%, Bonus 9", 
                },
                new Skill {
                    Name = "Attack Boost",
                    Description = "Increase Attack Power",
                    Stats = "Attack +10%, Bonus 10", 
                },
            } ;

            context.AddRange(list);
            context.SaveChanges();

        }

        public static async Task SeedUser (DataContext context, UserManager<DevUser> userManager)
        {
            // If there are no users, execute data
            if(!userManager.Users.Any()){
                var users = new List<DevUser>{
                    new DevUser{DisplayName="MHBuilder Dev. User", UserName="DevelopmentUser" }
                };

                foreach (var user in users){
                    await userManager.CreateAsync(user, "Pa$$w0rd");
                }
            }    
        }
    
    }
}