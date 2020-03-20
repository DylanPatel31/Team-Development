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
    public partial class Payment : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(DbString.connectionString);
        SqlCommand cmd;
        string message;
        Rooms room;
        Customer customer;
        public static Booking booking = new Booking();
        string roomPrice;
        char currencySymbol;
        int totalRoomBill;
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
        protected void btnCheckBooking_Click(object sender, EventArgs e)
        {
            inDate.Value = "";
            noOfPerson.Value = "";
            if (!String.IsNullOrEmpty(roomSearch().roomNo))
            {
                if (!String.IsNullOrEmpty(customerSearch().username))
                {
                    if (!String.IsNullOrEmpty(checklBooking().bookingDate))
                    {
                        inDate.Value = booking.inDate;
                        noOfPerson.Value = booking.noOfPerson.ToString();
                        outDate.Value = booking.outDate;
                        
                        roomPrice = room.roomPrice;
                        totalRoomBill = Convert.ToInt32(roomPrice.Substring(1));
                        currencySymbol=roomPrice.ToCharArray().ElementAt(0);


                        DateTime date1 = DateTime.ParseExact(booking.inDate, "MM/dd/yyyy", null);
                        DateTime date2 = DateTime.ParseExact(booking.outDate, "MM/dd/yyyy", null);

                        String noOfDays = (date2 - date1).TotalDays.ToString();

                        totalRoomBill = Convert.ToInt32(noOfDays)*Convert.ToInt32(totalRoomBill);





                        roomBill.Value = currencySymbol+""+totalRoomBill;
                        btnSubmit.Enabled = true;
                    }
                    else
                    {
                        message = "Booking does not exist against this username and room no";
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
                message = "No booking exist against this room no.";
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',false)", true);
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (!String.IsNullOrEmpty(roomSearch().roomNo))
            {
                if (!String.IsNullOrEmpty(customerSearch().username))
                {
                    booking = checklBooking();
                    if (!String.IsNullOrEmpty(booking.bookingDate))
                    {

                        if (payBill(booking) == 1)
                        {
                            message = customer.name +" paid the bill.";
                            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',true)", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',false)", true);
                        }
                    }
                    else
                    {
                        message = "Booking does not exist against this username and room no";
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
                message = "No booking exist against this room no.";
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',false)", true);
            }






           
        }
        
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
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
        public Booking checklBooking()
        {
            
            cmd = new SqlCommand("CheckBooking", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@roomID", room.roomID));
            cmd.Parameters.Add(new SqlParameter("@customerID", customer.ID));
            cmd.Parameters.Add(new SqlParameter("@cancelStatus", "No"));
            SqlDataReader dataReader = null;
            try
            {
                conn.Open();
                dataReader = cmd.ExecuteReader();
                while (dataReader.Read())
                {
                    booking.bookingID = Convert.ToInt32(dataReader["BookingID"].ToString());
                    booking.customerID = Convert.ToInt32(dataReader["CustomerID"].ToString());
                    booking.roomID = Convert.ToInt32(dataReader["RoomID"].ToString());
                    booking.noOfPerson = Convert.ToInt32(dataReader["NumberOfPerson"].ToString());
                    booking.bookingDate = dataReader["BookingDate"].ToString();
                    booking.inDate = dataReader["InDate"].ToString();
                    booking.outDate = dataReader["OutDate"].ToString();
                    booking.cancelStatus = dataReader["CancelStatus"].ToString();
                }
            }
            catch (Exception ex)
            {
                message = ex.Message;
            }
            conn.Close();
            return booking;
        }
        public int payBill(Booking booking_)
        {
            int effectedRows = 0;
            cmd = new SqlCommand("PayBill", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@bookingID", booking_.bookingID));
            cmd.Parameters.Add(new SqlParameter("@otherServices", otherServices.Value));
            cmd.Parameters.Add(new SqlParameter("@roomBill", roomBill.Value));
            cmd.Parameters.Add(new SqlParameter("@totalBill", totalBill.Value));
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

            if (effectedRows == 1)
            {
                effectedRows=updateBooking(booking_);
                effectedRows = roomUpdateBooking(booking_);
            }
            else
            {
                effectedRows = 0;
            }

            return effectedRows;
        }
        public int updateBooking(Booking booking_)
        {
            int effectedRows = 0;
            cmd = new SqlCommand("BookingUpdate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@bookingID", booking_.bookingID));
            cmd.Parameters.Add(new SqlParameter("@outDate", outDate.Value));
            cmd.Parameters.Add(new SqlParameter("@cancelStatus", "Completed"));
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
        public int roomUpdateBooking(Booking booking_)
        {
            int effectedRows = 0;
            cmd = new SqlCommand("BookingRoomUpdate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@roomID", booking_.roomID));
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
    }
}