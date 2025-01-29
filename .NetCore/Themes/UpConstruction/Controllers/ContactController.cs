using Microsoft.AspNetCore.Mvc;

namespace UpConstructer.Controllers
{
    public class ContactController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
