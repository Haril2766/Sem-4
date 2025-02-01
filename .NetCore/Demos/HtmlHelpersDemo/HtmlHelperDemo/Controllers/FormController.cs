using Microsoft.AspNetCore.Mvc;

namespace HtmlHelperDemo.Controllers
{
    public class FormController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
