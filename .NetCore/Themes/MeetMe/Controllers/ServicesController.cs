using Microsoft.AspNetCore.Mvc;

namespace MeetMe.Controllers
{
    public class ServicesController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
