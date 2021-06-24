using System.Collections.Generic;
using System.Threading.Tasks;
using Classes;
using System;
using Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace API.Controllers
{
    public class UpdateController : BaseApiController
    {
        private readonly DataContext _context;
        public UpdateController(DataContext context)
        {
            _context = context;
        }

        // Returns a list of the updates 

        [HttpGet]
        public async Task<ActionResult<List<Update>>> GetUpdates(){
            return await _context.Updates.ToListAsync();
        } 


        // Add Update
        [HttpPost]
        public async Task<IActionResult> AddUpdate(object data){
            var StringData = data.ToString();
            try
            {
                Update Update = JsonConvert.DeserializeObject<Update>(StringData);
                Update.DateCreated = DateTime.Now.ToString("dd MMMM yyyy");
                _context.Updates.Add(Update);
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