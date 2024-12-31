using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace EvaluationLab1to5
{
    internal class Employee
    {
        public int EmployeeId;
        public string EmployeeName;
        public double Salary;
        public double AnnualSalary;
        public void InputDetails()
        {
            EmployeeId = Convert.ToInt32(Console.ReadLine());
            EmployeeName = Console.ReadLine();
            Salary = Convert.ToDouble(Console.ReadLine());
        }
        public void DisplayDetails() 
        {
            Console.WriteLine(EmployeeId);
            Console.WriteLine(EmployeeName);
            Console.WriteLine(Salary);
        }
        public double ClaculateAnnualSalary()
        {
            AnnualSalary = Salary * 12;
            return AnnualSalary;
        }
        public string DeterminePerformance(double AnnualSalary)
        {
            string x;
            if (AnnualSalary < 250000)
            {
                x = "Needs Improvment";
            }
            else if (AnnualSalary <= 250000 && AnnualSalary <= 499999)
            {
                x = "Good";
            }
            else if (AnnualSalary >= 500000 && AnnualSalary <= 1000000)
            {
                x = "Excellent";
            }
            else {
                x = "Outstanging";
            }
            return x;
        }
    }
}
