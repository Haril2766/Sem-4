using Microsoft.AspNetCore.Mvc;

namespace QuizeManagement.Controllers
{
    public class QuestionController : Controller
    {
        public IActionResult Add()
        {
            return View();
        }
        public IActionResult List()
        {
            return View();
        }
    }
}
