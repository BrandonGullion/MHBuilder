using Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Threading.Tasks;
using Classes;
using Microsoft.EntityFrameworkCore;
using System;
using Newtonsoft.Json;
using System.IO;
using Newtonsoft.Json.Linq;
using Microsoft.AspNetCore.Authorization;

namespace API.Controllers
{
    public class SkillController : BaseApiController
    {
        private readonly ILogger<SkillController> _logger;
        private readonly DataContext _context;

        public SkillController(ILogger<SkillController> logger, DataContext context)
        {
            _context = context;
            _logger = logger;
        }

        [HttpGet]
        public async Task<ActionResult<List<Skill>>> GetSkills()
        {
            return await _context.Skills.ToListAsync();
        }

        [Authorize]
        [HttpPost]
        public async Task<IActionResult> CreateSkill(object data){
            try
            {
                // Adds the skill to the database 
                var StringData = data.ToString();

                Skill skill = JsonConvert.DeserializeObject<Skill>(StringData);
                _context.Skills.Add(skill);

                // Save to database 
                await _context.SaveChangesAsync();

                Console.WriteLine("Successfully added skill to DB");
                return Ok();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                return BadRequest();
            }

        } 

        [Authorize]
        [HttpPost("addmany")]
        public async Task<IActionResult> CreateSkills (List<Skill> Skills)
        {
            try
            {
                _context.Skills.AddRange(Skills);
                await _context.SaveChangesAsync();
                return Ok();
            }
            catch (System.Exception)
            {
                return BadRequest("Not able to save the list of items");
            }
        }
    }
}
