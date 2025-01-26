using Microsoft.AspNetCore.Mvc;

namespace Quiz_Login_Register.Controllers
{
    public class LoginController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
