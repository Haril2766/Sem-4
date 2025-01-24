using Microsoft.AspNetCore.Mvc;

namespace MeetMe.Controllers
{
    public class ContactController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
