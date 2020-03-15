using Hotel_Delux.Model_classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Delux.admin.staff
{
    public partial class ViewStaff : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(DbString.connectionString);
        string message = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null || Session["roleType"] == null || checkRoletype(Session["roleType"].ToString(), "admin"))
                {
                    Response.Redirect("/admin/index.aspx", false);
                }
                // white all code below this line
                else
                {
                    fillTextBoxes();
                }


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
            Response.Redirect("/admin/Index.aspx");
        }
        public void fillTextBoxes()
        {
            SqlCommand cmd = new SqlCommand("SearchStaff", conn);
            //Instruct the command object to execute it
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@username", Session["staffUsername"].ToString()));
            SqlDataReader dataReader = null;
            try
            {
                conn.Open();
                dataReader = cmd.ExecuteReader();

                while (dataReader.Read())
                {
                    username.Value= dataReader["StaffUsername"].ToString();
                    name.Value = dataReader["StaffName"].ToString();
                    password.Value = dataReader["StaffPassword"].ToString();
                    address.Value = dataReader["StaffAddress"].ToString();
                    mobile.Value = dataReader["StaffMobile"].ToString();
                    email.Value = dataReader["StaffEmail"].ToString();
                    state.Value = dataReader["StaffState"].ToString();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            conn.Close();
            dataReader.Close();
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            //Session.Remove("staffUsername");
            Response.Redirect("Index.aspx");
        }
    }
}