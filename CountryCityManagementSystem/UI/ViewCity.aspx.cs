using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryCityManagementSystem.BLL;
using CountryCityManagementSystem.Models;

namespace CountryCityManagementSystem.UI
{
    public partial class ViewCity : System.Web.UI.Page
    {
        CityManager cityManager = new CityManager();
        CountryManager countryManager = new CountryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (cityRadioButton.Checked == true)
            {
                countryDropDownList.Enabled = false;
                
            }
            else
            {
                countryDropDownList.Enabled = true;
                cityTextBox.ReadOnly = true;
            }
            if (! IsPostBack == true)
            {
                LoadAllCitiesInGridView();
                LoadAllCountryInDropDownList();    
            }
            
        }

        protected void viewCityGridView_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            viewCityGridView.PageIndex = e.NewPageIndex;
            viewCityGridView.DataBind();
        }

        protected void LoadAllCitiesInGridView()
        {
            viewCityGridView.DataSource = cityManager.GetAllCity();
            viewCityGridView.DataBind();
        }

        protected void LoadAllCitiesInBySearchCityNameGridView()
        {
            viewCityGridView.DataSource = cityManager.GetAllCitySearchByCityName(cityTextBox.Text);
            viewCityGridView.DataBind();
        }

        protected void LoadAllCitiesInBySearchCountryNameGridView()
        {
            viewCityGridView.DataSource = cityManager.GetAllCitySearchByCountryName(countryDropDownList.SelectedValue);
            viewCityGridView.DataBind();
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            if (cityRadioButton.Checked == true)
            {
                if (cityTextBox.Text != "")
                {
                    LoadAllCitiesInBySearchCityNameGridView();
                    cityTextBox.Text = String.Empty;
                }
                else
                {
                    alertLabel.Text = "Please enter city Name or Select Country";
                }
            }
            else
            {
                if (countryDropDownList.Enabled == true)
                {
                    LoadAllCitiesInBySearchCountryNameGridView();
                }
                else
                {
                    alertLabel.Text = "Please Select Country";
                }
            }
            


            
        }

        protected void LoadAllCountryInDropDownList()
        {
            Country country = new Country();
            country.Id = -1;
            country.Name = "Select Country....";

            List<Country> listOfCountry = countryManager.GetAllCountries();
            listOfCountry.Insert(0, country);
            countryDropDownList.DataSource = listOfCountry;

            countryDropDownList.DataTextField =

            countryDropDownList.DataTextField = "Name";
            countryDropDownList.DataValueField = "Name";
            countryDropDownList.DataBind();
        }
    }
}