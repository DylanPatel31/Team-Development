using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Hotel_Delux.Model_classes;

namespace Hotel_Delux.staff
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (userAuthentication(username.Value, password.Value))
            {
                Response.Redirect("Home.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "ErrorDiv()", true);
            }
        }
        public bool userAuthentication(string username, string password)
        {
            bool status = false;
            SqlConnection conn = new SqlConnection(DbString.connectionString);
            //con.Open();
            SqlCommand cmd = new SqlCommand("StaffLogin", conn);
            //Instruct the command object to execute it
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@password", password));
            SqlDataReader dataReader = null;
            try
            {
                conn.Open();
                dataReader = cmd.ExecuteReader();

                while (dataReader.Read())
                {
                    status = true;
                    Session.Add("staffID", Int16.Parse(dataReader["StaffID"].ToString()));
                    Session.Add("staffUsername", dataReader["StaffUsername"].ToString());
                    Session.Add("roleType", "staff");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            conn.Close();
            return status;
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("../StartUp_Page.aspx");
        }
    }
}