using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace EvaluationLab1to5
{
    internal class Program
    {
        static void Main(string[] args)
        {
            ////Program - 1
            //Console.Write("Enter Size of Array :");
            //int n = Convert.ToInt32(Console.ReadLine());
            //int[] arr = new int[n];

            //for (int i = 0; i < n; i++) ////For get array data from user
            //{
            //    Console.Write($"Enter value of a[{i}] : ");
            //    arr[i] = Convert.ToInt32(Console.ReadLine());
            //}
            //int max = arr.Max(); ////Max() use for find maximum value from array
            //int min = arr.Min(); ////Min() use for find minimum value from array

            //Console.WriteLine($"Maximum value from Array is {max}");
            //Console.WriteLine($"Minimum value from Array is {min}");

            //Program - 2
            //Console.Write("Enter Seconds : ");
            //int tsec = Convert.ToInt32(Console.ReadLine());

            //int hour = tsec / 3600;
            //int minute = (tsec % 3600) /60;
            //int sec = tsec % 60;

            //Console.WriteLine($"{hour }:{minute}:{sec}");


            //Program - 3
            //Console.Write("Enter Id Of Book :");
            //int id = Convert.ToInt32(Console.ReadLine());
            //Console.Write("Enter Name Of Book :");
            //string title = Console.ReadLine();
            //Console.Write("Enter Author Of Book :");
            //string name = Console.ReadLine();

            //Book b1 = new Book(id,title,name);
            //b1.DisplayBookDetails();

            //Program - 4

            //Employee e1 = new Employee();

            //e1.InputDetails();
            //e1.DisplayDetails();
            //double AnnSal = e1.ClaculateAnnualSalary();
            //Console.WriteLine("Annual Salary is : "+AnnSal);
            //string x = e1.DeterminePerformance(e1.AnnualSalary);
            //Console.WriteLine(x);

            //Program - 5

            //ShoppingCart cart = new ShoppingCart();
            //cart.AddItem("xyz",3);
            //cart.AddItem("xyz", 3, 1500);
            //cart.AddItem(1001,3);

            //Program - 6
            //Circle c1 = new Circle();
            //double ca = c1.CalculateAreaofcircle(3.14);
            //Console.WriteLine($"Area of Circle {ca}");

            //Rectangle r1 = new Rectangle();
            //double ra = r1.CalculateArea(4,5);
            //Console.WriteLine($"Area of Rectangle is {ra}");

            //Program - 7

            ArrayList a = new ArrayList();

            a.Add(1);
            a.Add(2);
            a.Add(1);
            a.Add(1);
            a.Add(2);
            a.Add(2);
            a.Add(2);


            foreach (int x in a)
            {
                int c = 0;
                foreach (int y in a)
                {
                    {
                        if (x == y)
                        {
                            c++;
                        }
                    }
                    Console.WriteLine(c);
                }
            }
        }
    }
}
