using System.ComponentModel.DataAnnotations;

namespace QuizeManagement.Models
{
    public class UserModel
    {
        [Required(ErrorMessage ="Plese enter User ID")]
        public int UserID { get; set; }
        [Required(ErrorMessage ="Please enter User Name")]
        public string UserName { get; set; }
    }
}
