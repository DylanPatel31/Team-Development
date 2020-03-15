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
    public partial class Index : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(DbString.connectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["staffUsername"] == null || Session["roleType"] == null || checkRoletype(Session["roleType"].ToString(), "staff"))
                {
                    Response.Redirect("../index.aspx", false);
                }
                else
                {
                    gvbind();
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
            Response.Redirect("../index.aspx", false);
        }
        protected void gvbind()
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("CustomerList", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                conn.Close();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
                else
                {
                    ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                    int columncount = GridView1.Rows[0].Cells.Count;
                    GridView1.Rows[0].Cells.Clear();
                    GridView1.Rows[0].Cells.Add(new TableCell());
                    GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
                    GridView1.Rows[0].Cells[0].Text = "No Records Found";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int effectedRows = 0;
            string message = "";
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            string username = GridView1.DataKeys[e.RowIndex].Values["CustomerUsername"].ToString();
            SqlCommand cmd = new SqlCommand("CustomerDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                cmd.Parameters.Add(new SqlParameter("@username", username));
                conn.Open();
                effectedRows = cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ex)
            {
                message = ex.Message;
                Console.WriteLine(ex.Message);
            }
            if (effectedRows > 0)
            {
                message = "Successfully customer Deleted.";
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',true)", true);
                gvbind();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',false)", true);
            }


        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            string username = GridView1.DataKeys[e.NewEditIndex].Values["CustomerUsername"].ToString();
            Session.Add("CustomerUsername", username);
            Response.Redirect("EditCustomer.aspx");
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
        protected void GridView1_RowSelecting(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            string username = row.Cells[0].Text;
            Session.Add("CustomerUsername", username);
            Response.Redirect("ViewCustomer.aspx");
        }

    }
}