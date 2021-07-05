using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Classes;
using Data;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API.Controllers
{
    public class BulletinController : BaseApiController
    {
        private readonly DataContext _context;
        public BulletinController(DataContext context)
        {
            _context = context;
        }


        [HttpGet]
        public async Task<ActionResult<List<Bulletin>>> GetBulletins()
        {
            return await _context.Bulletins.ToListAsync();
        }

        [Authorize]
        [HttpPost]
        public async Task<ActionResult> CreateBulletin (Bulletin bulletin)
        {
            try
            {
                _context.Bulletins.Add(bulletin);
                await _context.SaveChangesAsync();
                return Ok();
            }
            catch (Exception ex)
            {
                System.Console.WriteLine(ex);
                return BadRequest();
            }
        }
    }
}