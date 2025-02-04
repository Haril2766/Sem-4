using Microsoft.AspNetCore.Mvc;

namespace Address_Book.Controllers
{
    public class StateController : Controller
    {
        public IActionResult State()
        {
            return View();
        }
    }
}
