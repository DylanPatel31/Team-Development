﻿using System;
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
    public partial class EditProfile : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(DbString.connectionString);
        string message;
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
                else
                {
                    loadData();
                }

            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Console.WriteLine(name.Value);
            int value = updateCustomer(username.Value,password.Value, name.Value, address.Value, mobile.Value, email.Value, state.Value);
            if (value == 1)
            {
                message = "Profile is updated successfully.";
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
            Response.Redirect("Home.aspx");
        }
        public int updateCustomer(string username, string password, string name, string address, string mobile, string email, string state)
        {
            int effectedRows = 0;

            SqlCommand cmd = new SqlCommand("CustomerUpdate", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@username", Session["customerUsername"].ToString()));
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
            Response.Redirect("Index.aspx");
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
        public void loadData()
        {
            SqlCommand cmd = new SqlCommand("CustomerSearch", conn);
            //Instruct the command object to execute it
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@username", Session["customerUsername"].ToString()));
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