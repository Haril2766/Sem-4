using System.ComponentModel.DataAnnotations;

namespace QuizeManagement.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Please Enter Name")]
        [Display(Name ="Please enter your name")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "Please Enter Password")]
        [Display(Name = "Enter Your Password: ")]
        public string PassWord { get; set; }
    }
}
