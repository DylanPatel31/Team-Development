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
    public partial class ViewCustomer : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(DbString.connectionString);
        string message = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["staffUsername"] == null || Session["roleType"] == null || checkRoletype(Session["roleType"].ToString(), "staff"))
                {
                    Response.Redirect("../index.aspx", false);
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
        protected void btnBack_Click(object sender, EventArgs e)
        {
            //Session.Remove("staffUsername");
            Response.Redirect("Index.aspx");
        }
        public void fillTextBoxes()
        {
            SqlCommand cmd = new SqlCommand("CustomerSearch", conn);
            //Instruct the command object to execute it
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@username", Session["CustomerUsername"].ToString()));
            SqlDataReader dataReader = null;
            try
            {
                conn.Open();
                dataReader = cmd.ExecuteReader();

                while (dataReader.Read())
                {
                    name.Value = dataReader["CustomerName"].ToString();
                    username.Value = dataReader["CustomerUsername"].ToString();
                    password.Value = dataReader["CustomerPassword"].ToString();
                    address.Value = dataReader["CustomerAddress"].ToString();
                    mobile.Value = dataReader["CustomerMobile"].ToString();
                    email.Value = dataReader["CustomerEmail"].ToString();
                    state.Value = dataReader["CustomerState"].ToString();
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