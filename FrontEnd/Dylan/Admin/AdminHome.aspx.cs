using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FrontEnd.Dylan.Admin
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnManufacturerManagement_Click(object sender, EventArgs e)
        {
            //this line of code re-directs back to the main page
            Response.Redirect("ManufacturerManagement.aspx");
        }

        protected void btnStaffManagement_Click(object sender, EventArgs e)
        {
            //this line of code re-directs back to the main page
            Response.Redirect("StaffManagement.aspx");
        }

        protected void btnStockManagement_Click(object sender, EventArgs e)
        {
            //this line of code re-directs back to the main page
            Response.Redirect("StockManagement.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            //this line of code re-directs back to the main page
            Response.Redirect("SneakerSelectHome.html");
        }
    }
}