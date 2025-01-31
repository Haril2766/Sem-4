using Microsoft.AspNetCore.Mvc;

namespace EstateAgency.Controllers
{
    public class PropertyController : Controller
    {
        public IActionResult Grid()
        {
            return View();
        }
        public IActionResult Single()
        {
            return View();
        }
    }
}
