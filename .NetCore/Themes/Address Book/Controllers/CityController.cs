using Microsoft.AspNetCore.Mvc;

namespace Address_Book.Controllers
{
    public class CityController : Controller
    {
        public IActionResult City()
        {
            return View();
        }
    }
}
