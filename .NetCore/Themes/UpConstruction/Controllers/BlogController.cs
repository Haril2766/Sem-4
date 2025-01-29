using Microsoft.AspNetCore.Mvc;

namespace UpConstructer.Controllers
{
    public class BlogController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
