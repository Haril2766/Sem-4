using Microsoft.AspNetCore.Mvc;

namespace EstateAgency.Controllers
{
    public class AboutController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
