using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using CountryCityManagementSystem.Models;

namespace CountryCityManagementSystem.Gateway
{
    public class CityGateway
    {
        SqlConnection connection = new SqlConnection();
        private string connectionString = WebConfigurationManager.ConnectionStrings["CountryCityManagementDBconnString"].ConnectionString;
        

        public int Save(City city)
        {
            string query = "INSERT INTO City(Name, About,Dwellers,Location,Weather,CountryId) VALUES(@name,@about, @dwellers, @location, @weather, @countryid)";
            connection.ConnectionString = connectionString;

            SqlCommand command = new SqlCommand(query, connection);

            command.Parameters.Clear();
            command.Parameters.Add("name", SqlDbType.VarChar);
            command.Parameters.Add("about", SqlDbType.VarChar);
            command.Parameters.Add("dwellers", SqlDbType.Int);
            command.Parameters.Add("location", SqlDbType.VarChar);
            command.Parameters.Add("weather", SqlDbType.VarChar);
            command.Parameters.Add("countryId", SqlDbType.Int);

            command.Parameters["name"].Value = city.Name;
            command.Parameters["about"].Value = city.About;
            command.Parameters["dwellers"].Value = city.Dwellers;
            command.Parameters["location"].Value = city.Location;
            command.Parameters["weather"].Value = city.Weather;
            command.Parameters["countryId"].Value = city.CountryId;


            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();

            return rowAffected;
        }

        public List<City> GetAllCity()
        {
            string query = "SELECT City.*, Country.Name as 'Country', Country.About as 'AboutCountry' FROM City Left join Country on City.CountryId = Country.Id";
            connection.ConnectionString = connectionString;

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            List<City> cities = new List<City>();
            int sl = 1;
            while (reader.Read())
            {
                City city = new City();

                city.Name = reader["Name"].ToString();
                city.About = reader["About"].ToString();
                city.Dwellers = int.Parse(reader["Dwellers"].ToString());
                city.Location = reader["Location"].ToString();
                city.Weather = reader["Weather"].ToString();
                city.CountryName = reader["Country"].ToString();
                city.AboutCountry = reader["AboutCountry"].ToString();
                city.SerialNo = sl++;
                cities.Add(city);

            }
            reader.Close();
            connection.Close();

            return cities;
        }

        public List<City> GetAllCitySeachByCityName(string name)
        {
            string query = "SELECT City.*, Country.Name as 'Country', Country.About as 'AboutCountry' FROM City Left join Country on City.CountryId = Country.Id WHERE City.Name LIKE '%"+name+"%'";
            connection.ConnectionString = connectionString;

            SqlCommand command = new SqlCommand(query, connection);
            //command.Parameters.Clear();
            //command.Parameters.Add("name", SqlDbType.VarChar);
            //command.Parameters["name"].Value = name;
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            List<City> cities = new List<City>();
            int sl = 1;
            while (reader.Read())
            {
                City city = new City();

                city.Name = reader["Name"].ToString();
                city.About = reader["About"].ToString();
                city.Dwellers = int.Parse(reader["Dwellers"].ToString());
                city.Location = reader["Location"].ToString();
                city.Weather = reader["Weather"].ToString();
                city.CountryName = reader["Country"].ToString();
                city.AboutCountry = reader["AboutCountry"].ToString();
                city.SerialNo = sl++;
                cities.Add(city);

            }
            reader.Close();
            connection.Close();

            return cities;
        }


        public List<City> GetAllCitySeachByCountryName(string name)
        {
            string query = "SELECT City.*, Country.Name as 'Country', Country.About as 'AboutCountry' FROM City Left join Country on City.CountryId = Country.Id WHERE Country.Name LIKE '%" + name + "%'";
            connection.ConnectionString = connectionString;

            SqlCommand command = new SqlCommand(query, connection);
            //command.Parameters.Clear();
            //command.Parameters.Add("name", SqlDbType.VarChar);
            //command.Parameters["name"].Value = name;
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            List<City> cities = new List<City>();
            int sl = 1;
            while (reader.Read())
            {
                City city = new City();

                city.Name = reader["Name"].ToString();
                city.About = reader["About"].ToString();
                city.Dwellers = int.Parse(reader["Dwellers"].ToString());
                city.Location = reader["Location"].ToString();
                city.Weather = reader["Weather"].ToString();
                city.CountryName = reader["Country"].ToString();
                city.AboutCountry = reader["AboutCountry"].ToString();
                city.SerialNo = sl++;
                cities.Add(city);

            }
            reader.Close();
            connection.Close();

            return cities;
        }

        public bool IsCityNameExist(City city)
        {

            String query = "SELECT Name FROM City where Name=@name";

            connection.ConnectionString = connectionString;

            SqlCommand command = new SqlCommand(query, connection);

            command.Parameters.Add("name", SqlDbType.VarChar);
            command.Parameters["name"].Value = city.Name;

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
    }
}