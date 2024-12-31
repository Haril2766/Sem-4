using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EvaluationLab1to5
{
    internal class ShoppingCart
    {
        public void AddItem(string name, int qua)
        {
            Console.WriteLine($"Item Name is {name} and Quntity is {qua}");
        }
        public void AddItem(string name, int qua, double price)
        {
            Console.WriteLine($"Item Name is {name} , Quntity is {qua} and prince of each is {price}");
        }
        public void AddItem(int itemCode, int qua)
        {
            Console.WriteLine($"Item code is {itemCode} and Quntity is {qua}");
        }

    }
}
