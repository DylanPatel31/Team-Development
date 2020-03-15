using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Delux
{
    public partial class StartUp_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       
       

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("/admin/index.aspx", false);
        }

        protected void btnStaff_Click(object sender, EventArgs e)
        {
            Response.Redirect("staff/Index.aspx", false);
        }

        protected void btnCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx", false);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx", false);

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx", false);
        }
    }
}