using Microsoft.AspNetCore.Mvc;

namespace EstateAgency.Controllers
{
    public class AgentsController : Controller
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
