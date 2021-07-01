using Microsoft.AspNetCore.Identity;

namespace Classes
{
    public class DevUser : IdentityUser
    {
        public string DisplayName { get; set; }
    }
}