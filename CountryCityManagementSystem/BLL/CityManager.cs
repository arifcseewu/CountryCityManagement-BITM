using CountryCityManagementSystem.Gateway;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CountryCityManagementSystem.Models;

namespace CountryCityManagementSystem.BLL
{
    public class CityManager
    {
        CityGateway citygatewary = new CityGateway();


        public string Save(City city)
        {
            
                if (!citygatewary.IsCityNameExist(city))
                {
                    if (citygatewary.Save(city) > 0)
                    {
                        return "Saved successfully.";
                    }
                    else
                    {
                        return "Save failed.";
                    }
                }
                else
                {
                    return "Duplicate Name.";
                }
            }
           
        

        public List<City> GetAllCity()
        {
            return citygatewary.GetAllCity();
        }

        public List<City> GetAllCitySearchByCityName(string name)
        {
            return citygatewary.GetAllCitySeachByCityName(name);
        }

        public List<City> GetAllCitySearchByCountryName(string name)
        {
            return citygatewary.GetAllCitySeachByCountryName(name);
        }

    }
}