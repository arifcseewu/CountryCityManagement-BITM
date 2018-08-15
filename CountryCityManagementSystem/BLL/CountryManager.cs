using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CountryCityManagementSystem.Gateway;
using CountryCityManagementSystem.Models;

namespace CountryCityManagementSystem.BLL
{
    public class CountryManager
    {
        CountryGateway countryGateway = new CountryGateway();
        

        public string Save(Country country)
        {
            if (!countryGateway.IsCountryNamCountries(country))
            {
                if (countryGateway.Save(country) > 0)
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
                return "Country Name already exsits";
            }
        }

        public List<Country> GetAllCountries()
        {
            return countryGateway.GetAllCountries();
        }

        public List<CountryView> GetCountryBySearchTerm(string term)
        {
            return countryGateway.GetCountryBySearchTerm(term);
        }
    }
}