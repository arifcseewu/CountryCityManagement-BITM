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
    public partial class CityEntryUI : System.Web.UI.Page
    {
        
        CityManager cityManager = new CityManager();
        CountryManager countryManager = new CountryManager();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAllCountryInDropDown();
            }
            
            LoadAllCity();
        }


        protected void saveButton_Click(object sender, EventArgs e)
        {
            City city = new City();
            city.Name = nameTextBox.Text;
            city.About = Server.HtmlDecode(aboutTextArea.InnerHtml);
            city.Dwellers = int.Parse(dwellersTextBox.Text);
            city.Location = locatioTextBox.Text;
            city.Weather = weatherTextBox.Text;
            city.CountryId = int.Parse(countryDropDownList.SelectedValue);

            if (nameTextBox.Text != "")
            {
                if (int.Parse(dwellersTextBox.Text) > 0)
                {
                    alertLabel.Text = cityManager.Save(city);
                    nameTextBox.Text = String.Empty;
                    aboutTextArea.Value = String.Empty;
                    dwellersTextBox.Text = String.Empty;
                    locatioTextBox.Text = String.Empty;
                    weatherTextBox.Text = String.Empty;
                    countryDropDownList.ClearSelection();
                    LoadAllCity();

                }
                else
                {
                    alertLabel.Text = "Please Enter Valid no. of dwellers";
                }

            }
            else
            {
                alertLabel.Text = "Please Enter City Name";
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {

        }

        protected void LoadAllCity()
        {
            allCityGridView.DataSource = cityManager.GetAllCity();
            allCityGridView.DataBind();
        }

        private void LoadAllCountryInDropDown()
        {
            Country country = new Country();
            country.Id = -1;
            country.Name = "Select Country....";

            List<Country> listOfCountry = countryManager.GetAllCountries();
            listOfCountry.Insert(0, country);
            countryDropDownList.DataSource = listOfCountry;

            countryDropDownList.DataTextField =

            countryDropDownList.DataTextField = "Name";
            countryDropDownList.DataValueField = "Id";
            countryDropDownList.DataBind();
        }

        protected void allCityGridView_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            allCityGridView.PageIndex = e.NewPageIndex;
            allCityGridView.DataBind();
        }
    }
}