using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Classes;
using Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace API.Controllers
{
    public class WeaponController : BaseApiController
    {
        private readonly DataContext _context;
        public WeaponController(DataContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<List<Weapon>>> GetWeapons()
        {
            return await _context.Weapons.ToListAsync();
        }

        [Authorize]
        [HttpPost]
        public async Task<IActionResult> CreateWeapon(object data) 
        {
            try
            {
                var stringData = data.ToString();
                Weapon weapon = JsonConvert.DeserializeObject<Weapon>(stringData);
                _context.Add(weapon);
                await _context.SaveChangesAsync();
                return Ok();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                return NotFound();
            }
        }

    }
}