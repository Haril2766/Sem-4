using Microsoft.AspNetCore.Mvc;

namespace EstateAgency.Controllers
{
    public class ContactController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
