<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchBooking.aspx.cs" Inherits="FrontEnd.Mudrik.Staff.SearchBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <title>Staff Menu</title>
    <link rel="stylesheet" href="../style/style.css"/>


    <%

        string loggedUserIDStaff= (string)(Session["loggedUserIDStaff"]);
        if (loggedUserIDStaff == null)
        {
            Response.Redirect("../LoginPage.html");
        }
        else {

        }

     %>
</head>
<body>
   <!-- Header -->
    <header class="top">
        <div class="container">
            <div class="logo">
                <a href="index.html">Timeless Films</a>
            </div>
            <div class="main-menu">
                <ul>
                    <li><a href="StaffMenu.aspx">Menu</a></li>
                    <li><a href="../index.html">Logout</a></li>
                </ul>
            </div>
        </div>
    </header>>
    <!-- HEADER -->
    <!-- form to search -->
    <div class="one-col"><div class="center-text">
    <div class="title"><h2>Search Booking</h2></div></div></div>
    <form id="form2" action="SearchBooking_Action.aspx">
        <div class="container">
     <div class="one-col">
          <div class="center-text">
         
                      <label for="Search">
                            <strong>Enter Customer's Name: </strong>
                        </label>
                        <input type="text" name="txtSearch" id="txtSearch" />
                        <button type="submit" class="button button-dark" id="submit" value="submit">Search</button>
                            
       </div></div> </div> </form>
    <!-- form to search -->

    <!-- display Staffs -->
      <div class="container">
          <div class="one-col">
          <div class="tables">
        
        <div class="center-text">
        
    <form id="form1" runat="server" action="SearchBooking_Action2.aspx">
       
   <%      
        //variables to store data about the book
            string booking_id = "";
            string firstName = "";
            string fk1_user_id = "";
            string fk2_seat_id = "";
            string fk3_screening_id = "";
            string price = "";
            Int32 Index = 0;
            //connection to the database
            clsDataConnection DB = new clsDataConnection();
            //execute procedure displaying all book copies
            DB.Execute("sproc_tblBooking_AllBookings");
            //start of table in which we display the results
            Response.Write("<table border=1 cellpadding=4><tr>");
            Response.Write("<th>booking_id</th>");
            Response.Write("<th>firstName</th>");
            Response.Write("<th>fk1_user_id</th>");
            Response.Write("<th>fk2_seat_id</th>");
            Response.Write("<th>fk3_screening_id</th>");
            Response.Write("<th>price</th>");
            Response.Write("<th colspan=2>Delete Booking</td>");
            Response.Write("</tr>");
            //loop to write all found records
       while (Index < DB.Count)
       {
           //start the row of output table
                Response.Write("<tr>");
                //get the film_id
                booking_id = Convert.ToString(DB.DataTable.Rows[Index]["booking_id"]);
                //get the filmName
                firstName = Convert.ToString(DB.DataTable.Rows[Index]["firstName"]);
                //get the genre
                fk1_user_id = Convert.ToString(DB.DataTable.Rows[Index]["fk1_user_id"]);
                //get the duration
                fk2_seat_id = Convert.ToString(DB.DataTable.Rows[Index]["fk2_seat_id"]);
                //get the ageRated
                fk3_screening_id = Convert.ToString(DB.DataTable.Rows[Index]["fk3_screening_id"]);
                //get the director
                price = Convert.ToString(DB.DataTable.Rows[Index]["price"]);
                //write the film_id column
                Response.Write("<td><b>" + booking_id + "</b></td>");
                //write the filmName column
                Response.Write("<td><b>" + firstName + "</b></td>");
                //write the genre column
                Response.Write("<td><b>" + fk1_user_id + "</b></td>");
                //write the duration column
                Response.Write("<td><b>" + fk2_seat_id + "</b></td>");
                //write the ageRated column
                Response.Write("<td><b>" + fk3_screening_id + "</b></td>");
                //write the director column
                Response.Write("<td><b>" + price + "</b></td>");
                //Output the action button
                Response.Write("<td colspan=2><a class='adnotation' href='#'>" + "<button id='" + booking_id + " 'type='submit' name='btnDeleteBooking' name='DeleteBooking'value='" + booking_id + "'>Delete  Booking</button><span>Warning: You are about to delete this  Booking.</span></a></td>");

                Response.Write("</td>");
                //point at the next record
                Index++;
                //end the row of output table
                Response.Write("</tr>");
       }
       //end the table
       Response.Write("</table>");
       %>
                
            
    </form>
</div></div>
    
        </div>  
    
        </div>    
</body>
</html>
