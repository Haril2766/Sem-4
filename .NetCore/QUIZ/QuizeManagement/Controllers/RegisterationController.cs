using Microsoft.AspNetCore.Mvc;

namespace QuizeManagement.Controllers
{
    public class RegisterationController : Controller
    {
        public IActionResult UserRegister()
        {
            return View();
        }
    }
}
