using Microsoft.AspNetCore.Mvc;

namespace QuizeManagement.Controllers
{
    public class UserController : Controller
    {
        public IActionResult UserList()
        {
            return View();
        }

        public IActionResult UserAdd()
        {
            return View();
        }
    }
}
