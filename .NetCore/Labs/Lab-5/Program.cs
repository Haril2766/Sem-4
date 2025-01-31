using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Lab_5
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Program - 1
            ArrayList StudentName = new ArrayList();

            //a.Add() - To Add new student in list
            StudentName.Add("1 : Haril");
            StudentName.Add(2);
            StudentName.Add("3 : abc");
            StudentName.Add("4 : def");

            //b.Remove() - To Remove Student with specified index
            //StudentName.Remove(StudentName[2]);

            //c.RemoveRange() - To Remove student with specified range.
            //StudentName.RemoveRange(1, 3);

            //d.Clear() - To clear all the student from the list
            //StudentName.Clear();

            //For see OUTPUT
            for (int i = 0; i < StudentName.Count; i++)
            {
                Console.WriteLine(StudentName[i]);
            }


            //Program-2 
            //List<string> StudentName = new List<string>();

            ////a. Add() - To Add new student in list
            //StudentName.Add("Haril");
            //StudentName.Add("xyz");
            //StudentName.Add("abc");
            //StudentName.Add("def");

            ////b.Remove() - To Remove Student with specified index
            ////StudentName.Remove(StudentName[1]);

            ////c.RemoveRange() - To Remove student with specified range.
            //StudentName.RemoveRange(1, 3);

            ////d. Clear() - To clear all the student from the list
            //StudentName.Clear();

            ////For see OUTPUT
            //for (int i = 0; i < StudentName.Count; i++)
            //{
            //    Console.WriteLine(StudentName[i]);
            //}

            //Program-3
            //Stack s1 = new Stack();

            //a. Push() - To Add new item in stack
            //s1.Push(1);
            //s1.Push(2);
            //s1.Push(3);

            //b. Pop() - To Remove item from the stack   
            //s1.Pop();

            //c. Peek() – To Return the top item from the stack
            //Console.WriteLine(s1.Peek());

            //d. Contains() - To Checks whether an item exists in the stack or not.
            //Console.WriteLine(s1.Contains(1));

            //e. Clear() - To clear items from stack
            //s1.Clear();

            ////For Show OUTPUT
            //foreach (var x in s1)
            //{
            //    Console.WriteLine(x);
            //}

            //Program-4
            //Queue q1 = new Queue();

            ////a. Enqueue() - Adds an item into the queue.
            //q1.Enqueue(1);
            //q1.Enqueue(2);
            //q1.Enqueue(3);

            //b. Dequeue() - Returns an item from the beginning of the queue and
            //removes it from the queue
            //q1.Dequeue();

            //c. Peek() - Returns an first item from the queue without removing it.
            //Console.WriteLine(q1.Peek());

            //d. Contains() - Checks whether an item is in the queue or not
            //Console.WriteLine(q1.Contains(2));

            //e. Clear() - Removes all the items from the queue
            //q1.Clear();

            //foreach (var x in q1)
            //{
            //    Console.WriteLine(x);
            //}


            //Program-5
            //Dictionary<int,string> d1 = new Dictionary<int,string>();

            //a.Add: Adds a key-value pair.
            //d1.Add(1, "abc");
            //d1.Add(2, "def");
            //d1.Add(3, "ghi");

            //b.Remove: Removes a key-value pair by key.
            //d1.Remove(2);

            //c.ContainsKey: Checks if a key exists in the hashtable.
            //Console.WriteLine(d1.ContainsKey(2));

            //d.ContainsValue: Checks if a value exists in the hashtable.
            //Console.WriteLine(d1.ContainsValue("ghi"));

            //e.Clear: Removes all key-value pairs.
            //d1.Clear();

            //For Show OUTPUT
            //foreach (var item in d1)
            //{
            //Console.WriteLine(item);
            //}

            //Program-6
            //Hashtable h1 = new Hashtable();

            //a.Add: Adds a key - value pair.
            //h1.Add(1,"abc");
            //h1.Add(2,"def");
            //h1.Add(3,"ghi");

            //b.Remove: Removes a key - value pair by key.
            //h1.Remove(1);

            //c.ContainsKey: Checks if a key exists in the hashtable.
            //Console.WriteLine(h1.ContainsKey(1));             //Output is True;

            //d.ContainsValue: Checks if a value exists in the hashtable.
            //Console.WriteLine(h1.ContainsValue("gxi"));       //Output is false;

            //e.Clear: Removes all key - value pairs.
            //h1.Clear();

            //For Show OUTPUT
            //foreach (var x in h1.Values)
            //{
            //    Console.WriteLine(x);
            //}
        }
    }
}
