using Microsoft.AspNetCore.Mvc;

namespace UpConstructer.Controllers
{
    public class AboutController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
