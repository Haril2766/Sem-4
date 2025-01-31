using Microsoft.AspNetCore.Mvc;

namespace AreasDemo.Areas.areas.Controllers
{
    [Area("areas")]
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
