using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Hotel_Delux.Model_classes;

namespace Hotel_Delux.staff.customer
{
    public partial class AddCustomer : System.Web.UI.Page
    {
        string message = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["staffUsername"] == null || Session["roleType"] == null || checkRoletype(Session["roleType"].ToString(), "staff"))
            {
                Response.Redirect("Index.aspx", false);
            }
            if (!IsPostBack)
            {
                if (Session["staffUsername"] == null || Session["roleType"] == null || checkRoletype(Session["roleType"].ToString(), "staff"))
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
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Console.WriteLine(name.Value);
            int value = addCustomer(username.Value, password.Value, name.Value, address.Value, mobile.Value, email.Value, state.Value);
            if (value == 1)
            {
                message = "Successfully customer added";
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',true)", true);
                Console.WriteLine(message);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',false)", true);
                Console.WriteLine(message);
            }
            //addStaff(String.Format("{0}", Request.Form["username"]), String.Format("{0}", Request.Form["password"]), String.Format("{0}", Request.Form["name"]), String.Format("{0}", Request.Form["address"]), String.Format("{0}", Request.Form["mobile"]), String.Format("{0}", Request.Form["email"]), String.Format("{0}", Request.Form["state"]));
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            name.Value = "";
            username.Value = "";
            password.Value = "";
            address.Value = "";
            mobile.Value = "";
            email.Value = "";
            state.Value = "";
        }

        public int addCustomer(string username, string password, string name, string address, string mobile, string email, string state)
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
    }
}