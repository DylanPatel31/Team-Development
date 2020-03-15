using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Delux
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["customerUsername"] == null || Session["roleType"] == null || checkRoletype(Session["roleType"].ToString(), "customer"))
            {
                Response.Redirect("Index.aspx", false);
            }
            if (!IsPostBack)
            {
                if (Session["customerUsername"] == null || Session["roleType"] == null || checkRoletype(Session["roleType"].ToString(), "customer"))
                {
                    Response.Redirect("Index.aspx", false);
                }
                // white all code below this line

            }
        }
        public bool checkRoletype(string session, string compareString)
        {
            if (string.Compare(session, compareString) != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        protected void logout_ServerClick(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Index.aspx");
        }
    }
}