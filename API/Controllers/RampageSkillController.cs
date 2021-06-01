
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Classes;
using Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace API.Controllers
{
    public class RampageSkillController : BaseApiController
    {
        private readonly DataContext _context;

        RampageSkillController(DataContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<List<RampageSkill>>> GetRampageSkills()
        {
            return await _context.RampageSkills.ToListAsync();
        }

        [HttpPost]
        public async Task<IActionResult> CreateRampageSkill(object data)
        {
            // Save new weapon to database
            try
            {
                var stringData = data.ToString();
                RampageSkill rampageSkill = JsonConvert.DeserializeObject<RampageSkill>(stringData);
                _context.Add(rampageSkill);
                await _context.SaveChangesAsync();
                return Ok();
            }
            // Return 404 not found if there is an error
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                return NotFound();
            }
        }
    }
}