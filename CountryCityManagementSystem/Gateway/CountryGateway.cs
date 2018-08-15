using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.Configuration;
using CountryCityManagementSystem.Models;

namespace CountryCityManagementSystem.Gateway
{
    public class CountryGateway
    {
        SqlConnection connection = new SqlConnection();
        private string connectionString = WebConfigurationManager.ConnectionStrings["CountryCityManagementDBconnString"].ConnectionString;

        Country country = new Country();


        public int Save(Country country)
        {
            string query = "INSERT INTO Country(Name, About) VALUES('"+country.Name+"','"+country.About+"')";
            connection.ConnectionString = connectionString;

            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();
            return rowAffected;
        }

        public List<Country> GetAllCountries()
        {
            String query = "SELECT * FROM Country";

            connection.ConnectionString = connectionString;

            SqlCommand command = new SqlCommand(query,connection);

            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            List<Country> countries = new List<Country>();
            int sl = 1;
            while (reader.Read())
            {
                
                Country aCountry = new Country();

                aCountry.Id = int.Parse(reader["Id"].ToString());
                aCountry.Name = reader["Name"].ToString();
                aCountry.About = reader["About"].ToString();
                aCountry.SerialNo = sl++;
                countries.Add(aCountry);
            }

            reader.Close();
            connection.Close();

            return countries;
        }

        public bool IsCountryNamCountries(Country country){   
            String query = "SELECT Name FROM Country where Name='"+country.Name+"'";

            connection.ConnectionString = connectionString;

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            
            bool isNameExist = false;

            if (reader.HasRows)
            {
                isNameExist = true;
            }
            
            connection.Close();

            return isNameExist;
        }


        public List<CountryView> GetCountryBySearchTerm(string term)
        {
            string query = "SELECT * FROM CountryView WHERE Name LIKE '%"+term+"%'";
            connection.ConnectionString = connectionString;
            
            SqlCommand command = new SqlCommand(query,connection);
            
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            List<CountryView> countries = new List<CountryView>();
            int sl = 1;
            while (reader.Read())
            {
                CountryView countryView = new CountryView();
                
                //countryView.Id = int.Parse(reader["Id"].ToString());
                countryView.Name = reader["Name"].ToString();
                countryView.About = reader["About"].ToString();
                countryView.NoOfCity = int.Parse(reader["TotalCity"].ToString());
                countryView.NoOfDwellers = int.Parse(reader["TotalDwellers"].ToString());
                countryView.SerialNo = sl++;
                countries.Add(countryView);
            }

            reader.Close();
            connection.Close();

            return countries;
        }
    }
}