using Microsoft.AspNetCore.Mvc;

namespace UpConstructer.Controllers
{
    public class ProjectsController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
