using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CountryCityManagementSystem.BLL;
using CountryCityManagementSystem.Models;

namespace CountryCityManagementSystem.UI
{
    public partial class CountryEntryUI : System.Web.UI.Page
    {
        CountryManager countryManager = new CountryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadAllCountryGridview();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            Country country = new Country();

            country.Name = nameTextBox.Text;
            country.About = Server.HtmlDecode(aboutTextarea.InnerHtml);

            alertLabel.Text = countryManager.Save(country);
            nameTextBox.Text = String.Empty;
            aboutTextarea.Value = "";
            LoadAllCountryGridview();
        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {

        }

        protected void LoadAllCountryGridview()
        {
            allCountryGridView.DataSource = countryManager.GetAllCountries();
            allCountryGridView.DataBind();
        }

        protected void allCountryGridView_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            allCountryGridView.PageIndex = e.NewPageIndex;
            allCountryGridView.DataBind();
        }
    }
}