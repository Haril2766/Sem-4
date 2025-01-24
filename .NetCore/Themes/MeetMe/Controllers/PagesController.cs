using Microsoft.AspNetCore.Mvc;

namespace MeetMe.Controllers
{
    public class PagesController : Controller
    {
        public IActionResult Protfolio()
        {
            return View();
        }
        public IActionResult Elements()
        {
            return View();
        }
    }
}
