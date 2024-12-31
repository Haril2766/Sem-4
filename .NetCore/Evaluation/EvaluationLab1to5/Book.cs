using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EvaluationLab1to5
{
    internal class Book
    {
        public int BookId;
        public string Title;
        public string Author;
        public Book(int id, string t , string a) { 
            BookId = id;
            Title = t;
            Author = a;    
        }
        public void DisplayBookDetails()
        {
            Console.WriteLine($"Book Id is {BookId}");
            Console.WriteLine($"Book Name is {Title}");
            Console.WriteLine($"Book's Author Name is {Author}");
        }
    }
}
