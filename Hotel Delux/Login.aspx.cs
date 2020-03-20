using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using Hotel_Delux.Model_classes;

namespace Hotel_Delux
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
            SqlCommand cmd = new SqlCommand("CustomerLogin", conn);
            //Instruct the command object to execute it
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@password", password));
            SqlDataReader dataReader = null;
            Customer _customerObject = new Customer();
            try
            {
                conn.Open();
                dataReader = cmd.ExecuteReader();

                while (dataReader.Read())
                {
                    status = true;
                    Session.Add("customerID", dataReader["CustomerID"].ToString());
                    Session.Add("customerUsername", dataReader["CustomerUsername"].ToString());
                    Session.Add("customerName", dataReader["CustomerName"].ToString());
                    Session.Add("roleType", "customer");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            conn.Close();
            return status;
        }
        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("Signup.aspx");
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("StartUp_Page.aspx");
        }

    }
}