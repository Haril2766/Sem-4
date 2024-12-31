using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practice1
{
    internal class Time
    {
        public int hour;
        public int minute;
        public int second;
        public Time( int h, int m , int s) 
        {
            hour = h;
            minute = m;
            second = s;
            Normalize();
        }

        public Time(Time other) 
        {
            hour = other.hour;
            minute = other.minute;
            second = other.second;
            Normalize() ;
        }

        public void AddingTime(Time other)
        {
            this.hour += other.hour;
            this.minute += other.minute;
            this.second += other.second;
            Normalize();
            Console.WriteLine($"{this.hour} : {this.minute} : {this.second}");
        } 
        public void Normalize()
        {
            minute += second / 60;
            second %= 60;

            hour += minute/60;
            minute %= 60;

        }
    }
}
