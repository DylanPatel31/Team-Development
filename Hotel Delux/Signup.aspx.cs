using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Hotel_Delux.Model_classes;
namespace Hotel_Delux
{
    public partial class Signup : System.Web.UI.Page
    {
        string message;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            int value = userRegisteration(username.Value, password.Value, name.Value, address.Value, mobile.Value, email.Value, state.Value);
            if (value == 1)
            {
                message = "User successfully registrated. Please login now.";
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',true)", true);
                Console.WriteLine(message);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',false)", true);
                Console.WriteLine(message);
            }

        }
        public int userRegisteration(string username, string password, string name, string address, string mobile, string email, string state)
        {
            int effectedRows = 0;
            SqlConnection conn = new SqlConnection(DbString.connectionString);
            SqlCommand cmd;
            cmd = new SqlCommand("CustomerSearch", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@username", username));
            try
            {

                conn.Open();
                Int32 numberOfRows = Convert.ToInt32(cmd.ExecuteScalar());

                if (numberOfRows >= 1)
                {
                    message = "Username already exists.";
                    effectedRows = 0;
                }
                else
                {
                    cmd = new SqlCommand("CustomerAdd", conn);
                    //Instruct the command object to execute it
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@username", username));
                    cmd.Parameters.Add(new SqlParameter("@password", password));
                    cmd.Parameters.Add(new SqlParameter("@name", name));
                    cmd.Parameters.Add(new SqlParameter("@address", address));
                    cmd.Parameters.Add(new SqlParameter("@mobile", mobile));
                    cmd.Parameters.Add(new SqlParameter("@email", email));
                    cmd.Parameters.Add(new SqlParameter("@state", state));
                    effectedRows = cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                message = ex.Message;
                Console.WriteLine(ex.Message);
            }

            return effectedRows;
        }
       
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        
    }
}