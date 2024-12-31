using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practice1
{
    internal class Program
    {
        static void Main(string[] args)
        {

            //Program - 1
            //int a = Convert.ToInt32(Console.ReadLine());
            //int b = Convert.ToInt32(Console.ReadLine());

            //for (int i = a ; i <= b; i++) 
            //{
            //    bool x = true;
            //    for (int j = 2 ; j < b; j++) 
            //    {
            //        if(i%j == 0 && i != j)
            //        {
            //            x = false;
            //            break;
            //        }
            //    }
            //    if (x)
            //    {
            //        Console.WriteLine(i);
            //    }
            //    x = true;
            //}

            ////Program-2
            //Time T1 = new Time(1,20,15);
            //Time T2 = new Time(T1);
            //Time T3 = new Time(3,50,45);

            //T3.AddingTime(T1);

            ////Program - 3
            
            string a = Console.ReadLine();
            string b = Console.ReadLine();

            char[] x = a.ToCharArray();
            char[] y = b.ToCharArray();

            Array.Sort(x);
            Array.Sort(y);

             a = new string(x);
             b = new string(y);

            if (a==b)
            {
                Console.WriteLine("Anagram");
            }
            else
            {
                Console.WriteLine("Not Anagram");
            }

        }
    }
}
