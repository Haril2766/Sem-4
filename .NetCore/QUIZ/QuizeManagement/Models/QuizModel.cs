namespace QuizeManagement.Models
{
    public class QuizModel
    {
        public int QuizID { get; set; }
        public string QuizName { get; set; }
        public string TotalQuestions { get; set; }
        public DateTime QuizDate { get; set; }
        public int UserID { get; set; }
    }
}
