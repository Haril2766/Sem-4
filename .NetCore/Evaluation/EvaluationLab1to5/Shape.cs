using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EvaluationLab1to5
{
     abstract class Shape
    {
        public string Name;
        public double r;
        public double l;
        public double h;
        public abstract double CalculateAreaofcircle(double r);
        public abstract double CalculateArea(double l , double h);
        
    }
        class Circle : Shape
        {
            public override double CalculateAreaofcircle(double r)
            {
                double area = (Math.PI * r * r);
                return area;
            }
        }
    class Rectangle : Shape
    {
        public override double CalculateArea(double l, double h )
        {
            double area = (l * h);
            return area;
        }
    }
}
