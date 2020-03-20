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
    public partial class CustomerBooking : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(DbString.connectionString);
        SqlCommand cmd;
        string message;
        Customer customer;
        //Room rooms;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["staffUsername"] == null || Session["roleType"] == null || checkRoletype(Session["roleType"].ToString(), "staff"))
                {
                    Response.Redirect("Index.aspx", false);
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
            Response.Redirect("Index.aspx", false);
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            customer = customerSearch();
            if (!String.IsNullOrEmpty(customer.username))
            {
                gvbind(customer);
            }
            else
            {
                message = "Username does not exist.";
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',false)", true);
                rptBookings.Visible = false;
            }
               
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            username.Value = "";
        }
        public Customer customerSearch()
        {
            customer = new Customer();
            cmd = new SqlCommand("CustomerSearch", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@username", username.Value));
            SqlDataReader dataReader = null;
            try
            {
                conn.Open();
                dataReader = cmd.ExecuteReader();
                while (dataReader.Read())
                {
                    customer.ID = Convert.ToInt32(dataReader["CustomerID"].ToString());
                    customer.name = dataReader["CustomerName"].ToString();
                    customer.username = dataReader["CustomerUsername"].ToString();
                    customer.password = dataReader["CustomerPassword"].ToString();
                    customer.mobile = dataReader["CustomerMobile"].ToString();
                    customer.address = dataReader["CustomerAddress"].ToString();
                    customer.state = dataReader["CustomerState"].ToString();
                    customer.email = dataReader["CustomerEmail"].ToString();
                    

                    //CustomerUsername.Text = customer.username;
                }
            }
            catch (Exception ex)
            {
                message = ex.Message;
                Console.WriteLine(ex.Message);
            }
            conn.Close();
            dataReader.Close();
       

            return customer;
        }
        protected void gvbind(Customer customer)
        {
            try
            {
                SqlDataAdapter da;
                conn.Open();
                SqlCommand cmd = new SqlCommand("ViewCustomerBooking", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@customerID", customer.ID));
                DataSet ds = new DataSet();

                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                rptBookings.DataSource = ds;
                setRepeaterDetails(ds.Tables[0].Rows.Count,rptBookings);
                rptBookings.DataBind();


                //Control ItemTemplate = rptBookings.Controls[rptBookings.Controls.Count - 1].Controls[0];
                //Label lblFooter = ItemTemplate.FindControl("CustomerUsername") as Label;
                //lblFooter.Text = customer.username;
            }
            catch (Exception ex)
            {
                message = ex.Message;
                Console.WriteLine(ex.Message);
            }
        }

        protected void rptBookings_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            //{ Label lblA = (Label)rptBookings.Items[0].FindControl("lblA");
            //    lblA.Text = customer.username;
            //}
            //var lblA = (Label)rptBookings.Items[1].FindControl("CustomerUsername");
            var username = e.Item.ItemIndex;

                //.FindControl("CustomerUsername");
            var txtDescription = (Label)e.Item.FindControl("CustomerUsername");
            ////string username = customer.username.ToString();
            //txtDescription.Text = "hey";
            //...
        }
        public void setRepeaterDetails(int rowsCount, Repeater rpt)
        {
            if (rowsCount < 1)
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "ErrorDiv()", true);
                rpt.Visible = false;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "ErrorDivHide()", true);
                rpt.Visible = true;
                
                //Label customerUser=(Label)rptBookings.FindControl("CustomerUsername");
                //customerUser.Text = customer.username;
            }
        }

        protected void ClientNameClicked(object sender, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Click":
                    var i =Convert.ToInt32(e.CommandArgument); // You can get the Id
                    roomResult(i);
                    break;
            }
        }
        public void roomResult(int roomID)
        {
            try
            {
                SqlDataAdapter da;
                conn.Open();
                SqlCommand cmd = new SqlCommand("RoomSearchID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@roomID", roomID));
                DataSet ds = new DataSet();

                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                rptRoom.DataSource = ds;
                setRepeaterDetails(ds.Tables[0].Rows.Count,rptRoom);
                rptRoom.DataBind();


                //Control ItemTemplate = rptBookings.Controls[rptBookings.Controls.Count - 1].Controls[0];
                //Label lblFooter = ItemTemplate.FindControl("CustomerUsername") as Label;
                //lblFooter.Text = customer.username;
            }
            catch (Exception ex)
            {
                message = ex.Message;
                Console.WriteLine(ex.Message);
            }
        }

        protected void CustomerUsername_DataBinding(object sender, EventArgs e)
        {
            Label customerUsername = (Label)(sender);
            customerUsername.Text = customer.username;
        }

        protected void CustomerName_DataBinding(object sender, EventArgs e)
        {
            Label customerName = (Label)(sender);
            customerName.Text = customer.name;
        }
        //protected void gvbind(Customer customer)
        //{
        //    try
        //    {
        //        conn.Open();
        //        SqlCommand cmd = new SqlCommand("ViewCustomerBooking", conn);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.Add(new SqlParameter("@customerID", customer.ID));
        //        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //        DataSet ds = new DataSet();
        //        da.Fill(ds);
        //        conn.Close();
        //        if (ds.Tables[0].Rows.Count > 0)
        //        {
        //            GridView1.DataSource = ds;
        //            GridView1.DataBind();
        //        }
        //        else
        //        {
        //            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
        //            GridView1.DataSource = ds;
        //            GridView1.DataBind();
        //            int columncount = GridView1.Rows[0].Cells.Count;
        //            GridView1.Rows[0].Cells.Clear();
        //            GridView1.Rows[0].Cells.Add(new TableCell());
        //            GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
        //            GridView1.Rows[0].Cells[0].Text = "No Records Found";
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        message = ex.Message;
        //        Console.WriteLine(ex.Message);
        //    }
        //}
    }
}