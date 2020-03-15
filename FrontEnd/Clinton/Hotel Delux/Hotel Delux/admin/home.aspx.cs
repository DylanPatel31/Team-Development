using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Delux.admin
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                if (Session["username"] == null|| Session["roleType"] == null|| checkRoletype(Session["roleType"].ToString(),"admin"))
                {
                    Response.Redirect("/admin/index.aspx", false);
                }
                // white all code below this line
                
            }
        }
        public bool checkRoletype(string session, string compareString)
        {
            if(string.Compare(session, compareString) != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        protected void btnRoom_Click(object sender, EventArgs e)
        {  
                Response.Redirect("/admin/room/Index.aspx");
        }
        protected void btnStaff_Click(object sender, EventArgs e)
        {
                Response.Redirect("/admin/staff/Index.aspx");
        }
        protected void logout_ServerClick(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("/admin/Index.aspx");
        }
    }
}