using System.Security.Claims;
using System.Threading.Tasks;
using API.DTOs;
using API.Services;
using Classes;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AccountController : ControllerBase
    {
        private readonly UserManager<DevUser> _userManager;
        private readonly SignInManager<DevUser> _signInManager;
        private readonly TokenService _tokenService;
        public AccountController(UserManager<DevUser> userManager, SignInManager<DevUser> signInManager, TokenService tokenService)
        {
            _signInManager = signInManager;
            _userManager = userManager;
            _tokenService = tokenService;
        }

        /// Takes in the login attempt, determines if it exists in the db, if so, checks if the 
        /// password also matches, if so, returns the given user

        [HttpPost("login")]
        public async Task<ActionResult<UserDto>> Login(LoginDto loginDto)
        {
            var user = await _userManager.FindByNameAsync(loginDto.UserName);

            if (user == null) 
                return Unauthorized();

            var result = await _signInManager.CheckPasswordSignInAsync(user, loginDto.Password, false);

            if (result.Succeeded)
                return CreateUserObject(user);

            return Unauthorized();
        }

        [Authorize]
        [HttpPost("register")]
        public async Task<ActionResult<UserDto>> RegisterUser(object data)
        {
            var stringData = data.ToString();
            var registerDto = JsonConvert.DeserializeObject<RegisterDto>(stringData);
            
            // Only need to check for the user name
            if(await _userManager.Users.AnyAsync(x => x.UserName == registerDto.UserName))
            {
                return BadRequest("Username Taken");
            }

            // Set the register data object to the dev user class that is the standard user 
            var user = new DevUser
            {
                UserName = registerDto.UserName,
                DisplayName = registerDto.UserName,
            };

            // Create the user, password must be passed into the user manager directly
            var results = await _userManager.CreateAsync(user, registerDto.Password);

            if(results.Succeeded)
            {
                return CreateUserObject(user);
            }

            return BadRequest("Problem Registering User");
        }

        [Authorize] 
        [HttpGet]
        public async Task<ActionResult<UserDto>> GetCurrentUser()
        {
            var user = await _userManager.FindByNameAsync(User.FindFirstValue(ClaimTypes.Name));
            return CreateUserObject(user);
        }

        private UserDto CreateUserObject(DevUser user)
        {
                return new UserDto
                {
                    UserName = user.UserName,
                    DisplayName = user.DisplayName,
                    Token = _tokenService.CreateToken(user),
                };
        }
    }
}