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
    public class FixesController : BaseApiController
    {
        private readonly DataContext _context;
        public FixesController(DataContext context)
        {
            _context = context;

        }

        [HttpGet]
        public async Task<ActionResult<List<Fixes>>> GetFixes (){
            return await _context.Fixes.ToListAsync();
        }

        // Save fix to the database

        [HttpPost]
        public async Task<IActionResult> CreateFix(object data) {
            var StringData = data.ToString();
            try
            {
                Fixes Fix = JsonConvert.DeserializeObject<Fixes>(StringData);
                _context.Fixes.Add(Fix);
                await _context.SaveChangesAsync();
                return Ok();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);                
                return NotFound();
            }
        }
    }
}