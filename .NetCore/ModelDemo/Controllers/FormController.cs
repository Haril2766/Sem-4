using Microsoft.AspNetCore.Mvc;

namespace ModelDemo.Controllers
{
    public class FormController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
