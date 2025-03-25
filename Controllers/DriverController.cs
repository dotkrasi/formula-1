using ConsoleApp1.Data;
using ConsoleApp1.Data.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1.Controllers
{
    class DriverController
    {
        FormulaOneContext context = new FormulaOneContext();
        public List<string> GetAllDrivers()
        {

            return context.Teams
                .Select(t => t.TeamName)
                .ToList();


        }

        public string GetDriverById(int id)
        {

            var driver = context.Drivers
                .Where(d => d.DriverId == id)
                .Select(d => new { d.FirstName, d.LastName, d.Nationality })
                .FirstOrDefault();

            return driver != null
                ? $"Driver: {driver.FirstName} {driver.LastName}, Nationality: {driver.Nationality}"
                : "Driver not found";

        }
        public string GetDriverByLastName(string lastName)
        {

            var driver = context.Drivers.Where(d => d.LastName == lastName).FirstOrDefault();

            return driver != null
                ? $"Driver's Last Name:{driver.LastName}"
                : "Driver not found";


        }
        public List<string> GetDriversByNationality(string nationality)
        {

            return context.Drivers
                .Where(t => t.Nationality == nationality)
                .Select(t => t.FirstName)
                .ToList();

        }
     
    }
}