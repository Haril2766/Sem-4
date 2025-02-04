using System.ComponentModel.DataAnnotations;

namespace Address_Book.Models
{
    public class HelperModel
    {
        [Required(ErrorMessage ="Please Enter Id")]
        public int Id { get; set; }
        [Required(ErrorMessage ="Please Enter Name")]
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string PhoneNumber { get; set; }

    }
}
