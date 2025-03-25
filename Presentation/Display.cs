using ConsoleApp1.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1.Presentation
{
    class Display
    {
        private DriverController driverController = new DriverController();
        private TeamController teamController = new TeamController();
        public Display()
        {
            Console.WriteLine("Display Initialized");
        }
        public void ShowMenu()
        {
            List<string> menu = new List<string>();
            menu.Add("Enter a command:");
            menu.Add("1.");
            menu.Add("2.");
            menu.Add("3.");
            menu.Add("4.");
            menu.Add("5.");
            menu.Add("6.");

            string[] input = Console.ReadLine().Split(' ').ToArray();
            while (input[0] != "end")
            {
                switch (input[0])
                {
                    case "1":
                        driverController.GetAllDrivers();
                        break;
                    case "2":
                        driverController.GetDriverById(1);
                        break;
                    case "3":
                        driverController.GetDriverByLastName("nacionalnost");
                        break;
                    case "4":
                        driverController.GetDriversByNationality("nacionalnost");
                        break;
                    case "5":
                        teamController.GetAllTeams();
                        break;
                    case "6":
                        teamController.GetTeamById(1);
                        break;
                    case "7":
                        teamController.GetOldestTeam();
                        break;
                    case "8":
                        teamController.GetTeamsByCountry("country");
                        break;
                    case "9":
                        input[0] = "end";
                        break;
                }


            }
        }
    }
}
