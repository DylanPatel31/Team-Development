using System;
using Hotel_Delux.Model_classes;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Hotel_Delux.staff
{
    public partial class MakeBooking : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(DbString.connectionString);
        SqlCommand cmd;
        string message;
        Rooms room;
        Customer customer;
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
            }
        }
        protected void btnBooking_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(roomSearch().roomNo))
            {
                if (!String.IsNullOrEmpty(customerSearch().username))
                {
                    if (roomBooking() == 1)
                    {
                        if (roomUpdateBooking() == 1)
                        {
                            message = "You successfully made a booking.";
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
                    message = "User number does not exist with this username.";
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',false)", true);
                }
            }
            else
            {
                message = "Room number does not exist or Room is not available for booking.";
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',false)", true);
            }

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
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
        public int roomBooking()
        {
            int effectedRows = 0;
            cmd = new SqlCommand("CustomerBooking", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@roomID", room.roomID));
            cmd.Parameters.Add(new SqlParameter("@staffID", Convert.ToInt32(Session["staffID"].ToString())));
            cmd.Parameters.Add(new SqlParameter("@customerID", customer.ID));
            cmd.Parameters.Add(new SqlParameter("@inDate", bookingDate.Value.ToString()));
            cmd.Parameters.Add(new SqlParameter("@outDate", checkoutDate.Value.ToString()));
            cmd.Parameters.Add(new SqlParameter("@bookingDate", DateTime.Now.ToString("MM/dd/yyyy")));
            cmd.Parameters.Add(new SqlParameter("@numberOfPerson", Convert.ToInt32(noOfPersons.Value)));
            cmd.Parameters.Add(new SqlParameter("@cancelStatus", "No"));
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
        public Rooms roomSearch()
        {
            room = new Rooms();
            cmd = new SqlCommand("RoomSearchBooking", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@roomNo", roomNo.Value));
            cmd.Parameters.Add(new SqlParameter("@roomAvailability", "Yes"));
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
            cmd.Parameters.Add(new SqlParameter("@roomAvailability", "No"));
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