using Microsoft.AspNetCore.Mvc;

namespace Address_Book.Controllers
{
    public class CountryController : Controller
    {
        public IActionResult Country()
        {
            return View();
        }
    }
}
