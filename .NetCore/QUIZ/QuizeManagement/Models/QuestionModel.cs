    using System.ComponentModel.DataAnnotations;

namespace QuizeManagement.Models
{
    public class QuestionModel
    {
        [Required(ErrorMessage = "Please Enter UserID")]
        public int UserId { get; set; }
        [Required(ErrorMessage = "Please Enter Question Text")]
        public string QuestionText { get; set; }
        [Required(ErrorMessage = "Please Enter QuestionLevel")]
        public string QuestionLevel { get; set; }
        [Required(ErrorMessage = "Please Enter Option - A")]
        public string OptionA { get; set; }
        [Required(ErrorMessage = "Please Enter Option - B")]
        public string OptionB { get; set; }
        [Required(ErrorMessage = "Please Enter Option - C")]
        public string OptionC { get; set; }
        [Required(ErrorMessage = "Please Enter Option - D")]
        public string OptionD { get; set; }
        [Required(ErrorMessage = "Please Enter Correct Answer")]
        public string CorrectAns { get; set; }
        [Required(ErrorMessage = "Please Enter Marks")]
        public int Marks { get; set; }
        
    }
}
