using System.Collections.Generic;
using System.Threading.Tasks;
using Classes;
using Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace API.Controllers
{
    public class DecorationController : BaseApiController
    {
        private readonly ILogger _logger;
        private readonly DataContext _context;
        public DecorationController(ILogger<DecorationController> logger, DataContext context)
        {
            _context = context;
            _logger = logger;
        }
        
        [HttpGet]
        public async Task<ActionResult<List<Decoration>>> GetDecorations(){
            return await _context.Decorations.ToListAsync();
        }
        
    }
}