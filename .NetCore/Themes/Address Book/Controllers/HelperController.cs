using Microsoft.AspNetCore.Mvc;

namespace Address_Book.Controllers
{
    public class HelperController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
