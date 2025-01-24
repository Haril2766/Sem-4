using Microsoft.AspNetCore.Mvc;

namespace MeetMe.Controllers
{
    public class AboutController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
