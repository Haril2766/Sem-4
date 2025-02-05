namespace QuizeManagement.Models
{
    public class QuestionModel
    {
        public int UserId { get; set; }
        public string QuestionText { get; set; }
        public string QuestionLevel { get; set; }
        public string OptionA { get; set; }
        public string OptionB { get; set; }
        public string OptionC { get; set; }
        public string OptionD { get; set; }
        public string CorrectAns { get; set; }
        public int Marks { get; set; }
        
    }
}
