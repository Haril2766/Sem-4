using System.ComponentModel.DataAnnotations;

namespace QuizeManagement.Models
{
    public class QuestionLevelModel
    {
        [Required(ErrorMessage = "Please Enter UserId")]

        public int UserId { get; set; }
        [Required(ErrorMessage = "Please Enter QuestionLevel")]

        public string Level { get; set; }
    }
}
