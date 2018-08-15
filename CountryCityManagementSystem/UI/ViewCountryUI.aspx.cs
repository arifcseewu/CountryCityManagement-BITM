using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CountryCityManagementSystem.BLL;

namespace CountryCityManagementSystem.UI
{
    public partial class ViewCountryUI : System.Web.UI.Page
    {
        CountryManager countryManager = new CountryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (IsPostBack)
            //{
            //    LoadAllCountryGridview();
            //}
        }


        protected void searchButton_Click(object sender, EventArgs e)
        {
            if (termTextBox.Text != "")
            {
                alertLabel.Text = "";
                LoadAllCountryGridview();
            }
            else
            {
                alertLabel.Text = "Please enter your Search Term";
            }

        }

        protected void LoadAllCountryGridview()
        {
            allCountryGridView.DataSource = countryManager.GetCountryBySearchTerm(termTextBox.Text);
            allCountryGridView.DataBind();
        }

        protected void allCountryGridView_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            allCountryGridView.PageIndex = e.NewPageIndex;
            allCountryGridView.DataBind();
        }

    }
}