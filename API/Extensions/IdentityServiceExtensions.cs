using System.Text;
using API.Services;
using Classes;
using Data;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;

namespace API.Extensions
{
    public static class IdentityServiceExtensions
    {
        // This creates an extension method that can be accessed in the services class as a static member
        public static IServiceCollection AddIdentityServices(this IServiceCollection services, IConfiguration config) 
        {
            services.AddIdentityCore<DevUser>(opt => {
                // Can change password requirements in this section, by default
                // it is always strict, needs 1 upper and lower case, 1 number and 1 symbol
            })
            .AddEntityFrameworkStores<DataContext>()
            .AddSignInManager<SignInManager<DevUser>>();

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(config["TokenKey"]));

            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            .AddJwtBearer(opt => 
            {
                opt.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = key,
                    ValidateIssuer = false,
                    ValidateAudience = false,
                };
            });
            services.AddScoped<TokenService>();

            return services;
        }
    }
}