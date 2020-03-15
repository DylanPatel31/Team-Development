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
    public partial class ViewRoom : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        SqlConnection con = new SqlConnection(DbString.connectionString);
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
                else
                {
                    loadData();
                }
            }
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
            con.Open();
            cmd = new SqlCommand("RoomList", con);
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            RepeaterDetails.DataSource = ds;
            setRepeaterDetails(ds.Tables[0].Rows.Count);
            RepeaterDetails.DataBind();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("RoomSearch", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@roomNo", roomNo.Value));
            DataSet ds = new DataSet();
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            RepeaterDetails.DataSource = ds;
            setRepeaterDetails(ds.Tables[0].Rows.Count);
            RepeaterDetails.DataBind();
        }
        public void setRepeaterDetails(int rowsCount)
        {
            if (rowsCount < 1)
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "ErrorDiv()", true);
                RepeaterDetails.Visible = false;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "ErrorDivHide()", true);
                RepeaterDetails.Visible = true;
            }
        }
    }
}