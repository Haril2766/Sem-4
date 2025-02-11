using System.ComponentModel.DataAnnotations;

namespace QuizeManagement.Models
{
    public class QuizWiseQuestionModel
    {
        [Required(ErrorMessage ="Plese Enter UserId")]
        public int UserID { get; set; }
        [Required(ErrorMessage ="Please Enter QuizeName")]
        public string QuizName { get; set; }


        [Required(ErrorMessage = "Plese Enter QuestionLevel")]
        public int QuestionLevel { get; set; }
    }
}
