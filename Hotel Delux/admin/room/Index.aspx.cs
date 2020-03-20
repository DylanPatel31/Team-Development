using Hotel_Delux.Model_classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Delux.admin.room
{
    public partial class index : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(DbString.connectionString);
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["username"] == null || Session["roleType"] == null || checkRoletype(Session["roleType"].ToString(), "admin"))
            {
                Response.Redirect("/admin/Index.aspx", false);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null || Session["roleType"] == null || checkRoletype(Session["roleType"].ToString(), "admin"))
                {
                    Response.Redirect("/admin/Index.aspx", false);
                }
                else
                {
                    gvbind();
                }
            }
        }
        protected void gvbind()
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("RoomList", conn);
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
            string roomNo = GridView1.DataKeys[e.RowIndex].Values["RoomNo"].ToString();
            SqlCommand cmd = new SqlCommand("RoomDelete", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                cmd.Parameters.Add(new SqlParameter("@roomNo", roomNo));
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
                message = "Successfully Room Deleted.";
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
            string roomNo = GridView1.DataKeys[e.NewEditIndex].Values["RoomNo"].ToString();
            Session.Add("roomNo", roomNo);
            Response.Redirect("EditRoom.aspx");
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
        protected void GridView1_RowSelecting(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            string roomNO = row.Cells[0].Text;
            Session.Add("roomNO", roomNO);
            Response.Redirect("ViewRoom.aspx");
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
    }
}