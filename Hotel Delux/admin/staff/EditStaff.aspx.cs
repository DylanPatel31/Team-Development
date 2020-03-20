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
    public partial class editStaff : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(DbString.connectionString);
        string message = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["staffUsername"] == null || Session["roleType"] == null || checkRoletype(Session["roleType"].ToString(), "admin"))
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
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Console.WriteLine(name.Value);
            int value = updateStaff(username.Value,password.Value, name.Value, address.Value, mobile.Value, email.Value, state.Value);
            if (value == 1)
            {
                message = "Successfully staff updated.";
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',true)", true);
                Console.WriteLine(message);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',false)", true);
                Console.WriteLine(message);
            }
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            //Session.Remove("staffUsername");
            Response.Redirect("Index.aspx");
        }
        public int updateStaff(string username, string password, string name, string address, string mobile, string email, string state)
        {
            int effectedRows = 0;
           
            SqlCommand cmd= new SqlCommand("StaffUpdate", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@username", Session["staffUsername"].ToString()));
                    cmd.Parameters.Add(new SqlParameter("@password", password));
                    cmd.Parameters.Add(new SqlParameter("@name", name));
                    cmd.Parameters.Add(new SqlParameter("@address", address));
                    cmd.Parameters.Add(new SqlParameter("@mobile", mobile));
                    cmd.Parameters.Add(new SqlParameter("@email", email));
                    cmd.Parameters.Add(new SqlParameter("@state", state));
                    conn.Open();
                effectedRows = cmd.ExecuteNonQuery();
               
                conn.Close();
            }
            catch (Exception ex)
            {
                message = ex.Message;
                Console.WriteLine(ex.Message);
            }

            return effectedRows;
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
                    name.Value = dataReader["StaffName"].ToString();
                    username.Value = dataReader["StaffUsername"].ToString();
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
    }
}