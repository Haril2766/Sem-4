using Microsoft.AspNetCore.Mvc;

namespace EstateAgency.Controllers
{
    public class BlogController : Controller
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
