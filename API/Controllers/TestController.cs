using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    public class TestController : BaseApiController
    {
        [HttpGet]
        public ActionResult<string> GetTest(){
            return "hello";
        }
    }
}