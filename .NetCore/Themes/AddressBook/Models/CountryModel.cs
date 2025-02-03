using System.ComponentModel.DataAnnotations;

namespace AddressBook.Models
{
    public class CountryModel
    {
        [Required]
        [Display(Name = "Country ID")]
        public int CountryId { get; set; }

        [Required]
        [Display(Name = "Country Name")]
        public string CountryName { get; set; }

        [Required]
        [Display(Name = "Country Code")]
        public int CountryCode { get; set; }

        [Required]
        [Display(Name = "Creation Date")]
        public string CreationDate { get; set; }

        [Required]
        [Display(Name = "User ID")]
        public int UserId { get; set; }

    }
}