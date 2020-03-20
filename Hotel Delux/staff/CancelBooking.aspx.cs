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
    public partial class CancelBooking : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(DbString.connectionString);
        SqlCommand cmd;
        string message;
        Rooms room;
        Customer customer;
        protected void Page_Load(object sender, EventArgs e)
        {
            
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
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(roomSearch().roomNo))
            {
                if (!String.IsNullOrEmpty(customerSearch().username))
                {
                    if (cancelBooking() == 1)
                    {
                        if (roomUpdateBooking() == 1)
                        {
                            message = "Successfully booking is cancel.";
                            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',true)", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',false)", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',false)", true);
                    }
                }
                else
                {
                    message = "Username does not exist.";
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',false)", true);
                }

            }
            else
            {
                message = "Room number or booking does not exist.";
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',false)", true);
            }
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
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
        public Rooms roomSearch()
        {
            room = new Rooms();
            cmd = new SqlCommand("RoomSearchBooking", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@roomNo", roomNo.Value));
            cmd.Parameters.Add(new SqlParameter("@roomAvailability", "No"));
            SqlDataReader dataReader = null;
            try
            {
                conn.Open();
                dataReader = cmd.ExecuteReader();
                while (dataReader.Read())
                {
                    room.roomID = Convert.ToInt32(dataReader["RoomID"].ToString());
                    room.roomNo = dataReader["RoomNO"].ToString();
                    room.roomPrice = dataReader["RoomPrice"].ToString();
                    room.roomType = dataReader["RoomType"].ToString();
                    room.thumbnail = dataReader["Thumbnail"].ToString();
                    room.roomAvailability = dataReader["RoomAvailability"].ToString();

                }
            }
            catch (Exception ex)
            {
                message = ex.Message;
                Console.WriteLine(ex.Message);
            }
            conn.Close();
            dataReader.Close();

            return room;
        }
        public int roomUpdateBooking()
        {
            int effectedRows = 0;
            cmd = new SqlCommand("BookingRoomUpdate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@roomID", room.roomID));
            cmd.Parameters.Add(new SqlParameter("@roomAvailability", "Yes"));
            try
            {
                conn.Open();
                effectedRows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                message = ex.Message;
            }
            conn.Close();
            return effectedRows;
        }
        public int cancelBooking()
        {
            int effectedRows = 0;
            cmd = new SqlCommand("CancelBooking", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@roomID", room.roomID));
            cmd.Parameters.Add(new SqlParameter("@customerID", customer.ID));
            cmd.Parameters.Add(new SqlParameter("@cancelStatus", "Yes"));
            cmd.Parameters.Add(new SqlParameter("@previousStatus", "NO"));
            try
            {
                conn.Open();
                effectedRows = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                message = ex.Message;
            }
            conn.Close();
            return effectedRows;
        }

    }
}