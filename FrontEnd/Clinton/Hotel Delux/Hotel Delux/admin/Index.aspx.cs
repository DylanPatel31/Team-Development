using Hotel_Delux.Model_classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Delux.admin
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if(userAuthentication(username.Value, password.Value))
            {
                Response.Redirect("home.aspx");
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
            SqlCommand cmd = new SqlCommand("AdminLogin", conn);
            //Instruct the command object to execute it
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@password", password));
            SqlDataReader dataReader = null;
            Admin _adminObject= new Admin();
            try
            {
                conn.Open();
                dataReader = cmd.ExecuteReader();

                while (dataReader.Read())
                {
                    status = true;
                    _adminObject.ID = Int16.Parse(dataReader["AdminID"].ToString());
                    _adminObject.username = dataReader["AdminUsername"].ToString();
                    Session.Add("username", _adminObject.username);
                    Session.Add("roleType", "admin");
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