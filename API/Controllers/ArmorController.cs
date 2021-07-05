using Classes;
using Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Controllers
{
    public class ArmorController : BaseApiController
    {
        private readonly ILogger<ArmorController> _logger;
        private readonly DataContext _context;

        public ArmorController(ILogger<ArmorController> logger, DataContext context)
        {
            _context = context;
            _logger = logger;
        }

        [HttpGet]
        public  async Task<ActionResult<IEnumerable<Armor>>> GetArmor()
        {
            var armorList = await _context.Armors.ToListAsync();

            // Iterate over the armors to populate skills 
            foreach (var armor in armorList)
            {
                // Create new list instance 
                armor.Skills = new List<Skill>();

                // Split the skills into their own array 
                var skillIds = armor.StringSkills.Split("*").SkipLast(1).ToArray();

                // Go over the skills to determine which ones present, find them in skills database, and then populate lists
                foreach (var skillId in skillIds)
                {
                    try
                    {
                        armor.Skills.Add(_context.Skills.Find(Convert.ToInt32(skillId)));
                    }
                    catch (System.Exception)
                    {
                        continue;
                    }
                }
            }

            return armorList;
            // return await _context.Armors.Include(armor => armor.Skills).ToListAsync();
        }

        [Authorize]
        [HttpPost]
        public async Task<IActionResult> CreateArmor(object data){
            try
            {
                var StringData = data.ToString();
                Armor Armor = JsonConvert.DeserializeObject<Armor>(StringData);
                Armor.Skills = new List<Skill>();
                // If the string is not empty then split and find appropriate skills 
                if(!String.IsNullOrWhiteSpace(Armor.StringSkills))
                {
                    // Split string skill id's removing last string which should always be blank
                    var SkillIdArray = Armor.StringSkills.Split('*');
                    SkillIdArray = SkillIdArray.SkipLast(1).ToArray();
                    Console.WriteLine(SkillIdArray.Count());
                    // Go over all skill id's appending them to armor.skill list 
                    foreach(var Id in SkillIdArray)
                    {
                        var IntId = Convert.ToInt32(Id);
                        var Skill = _context.Skills.Find(IntId);
                        Console.WriteLine(Skill.Name);
                        Armor.Skills.Add(Skill);
                    }
                }

                _context.Armors.Add(Armor);
                await _context.SaveChangesAsync();
                Console.WriteLine("Successfully saved armor to database");
                return Ok();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                return BadRequest();
            }
        }


    }
}
