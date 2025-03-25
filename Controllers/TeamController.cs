using ConsoleApp1.Data;
using ConsoleApp1.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1.Controllers
{
    class TeamController
    {
        FormulaOneContext context = new FormulaOneContext();
        public List<string> GetAllTeams()
        {
            return context.Teams
                .Select(t => t.TeamName)
                .ToList();

        }

        public string GetTeamById(int id)
        {
            return context.Teams
                .Where(t => t.TeamId == id)
                .Select(t => t.TeamName)
                .FirstOrDefault() ?? "Team not found";
        }

        public string GetOldestTeam()
        {
            var oldestTeam = context.Teams
                .OrderBy(t => t.FoundationYear)
                .Select(t => t.TeamName)
                .FirstOrDefault();

            return oldestTeam ?? "No teams available";
        }

        public List<string> GetTeamsByCountry(string country)
        {
            return context.Teams
                .Where(t => t.Country == country)
                .Select(t => t.TeamName)
                .ToList();

        }


        public Team AddTeam(string name, string country, DateTime year, List<int>? driverIds)
        {
            var team = new Team { };
            return team;

        }
        
    }
}
