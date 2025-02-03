using System.ComponentModel.DataAnnotations;

namespace QuizeManagement.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Please Enter Name")]
        [Display(Name ="Enter Your Name : ")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "Please Enter Password")]
        [Display(Name = "Enter Your Password: ")]
        public string PassWord { get; set; }
    }
}
