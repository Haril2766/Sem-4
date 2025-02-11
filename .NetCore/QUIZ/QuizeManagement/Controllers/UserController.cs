using System.Data.SqlClient;
using System.Data;
using Microsoft.AspNetCore.Mvc;

namespace QuizeManagement.Controllers
{
    public class UserController : Controller
    {
        public IActionResult UserList()
        {
            string connectionString = configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_MST_User_SelectAll";
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            return View(table);
        }
        private IConfiguration configuration;

        public UserController(IConfiguration _configuration)
        {
            configuration = _configuration;
        }
        public IActionResult UserAdd()
        {
            return View();
        }
    }
}
