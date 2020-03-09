<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">




</script>
<script>
    function goBack() {
        window.history.back();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <title>LIBRARY STAFF MENU</title>
    <link rel="stylesheet" href="../Style Sheikhz Library/StyleSheet.css"/>
   
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
    < <!-- HEADER -->
    <!-- Header -->
        <header class="top">
        <div class="container">
            <div class="logo">
                <img src="../imgfolder/SHEIKHZ LIBRARY 1.png" alt="SHEIKHZ LIBRARY1" height="80" width="150" />
                <a href="index.html">SHEIKHZ LIBRARY</a>
            </div>
            <div class="main-menu">
                <ul>
                    
                    <li><a href="LibraryStaffMainManu.aspx">Dashboard</a></li>
                    <li><a href="../HomePage.html">Sign Out</a></li>
                </ul>
            </div>
        </div>
    </header>

    <!-- HEADER -->
    <!-- Reservations form-->
    <section class="Reservations">
      <!-- display reservtions -->
      <div class="container">
          <div class="one-col">
          <div class="tables">
        
        <div class="center-text">
        
                    <form method="post" action="RemoveReservedBooks.aspx">
                         <%
                             //variables to store details about the reservation
                             //variables to store data about the book
                             string ReservationID = "";
                             string Author = "";
                             string Title = "";
                             string FirstName = "";
                             string LastName = "";
                             string ReservationDate = "";
                             Int32 Index = 0;
                             //connection to the db
                             clsDataConnection DB = new clsDataConnection();
                             //execute the sproc
                             DB.Execute("sproc_ReservationTable_All");
                             //start the table 
                             Response.Write("<table><tr>");
                             Response.Write("<th>User name</th>");
                             Response.Write("<th>Surname</th>");
                             Response.Write("<th>Book author</th>");
                             Response.Write("<th>Title</th>");
                             Response.Write("<th>Reservation date</th>");
                             Response.Write("<th colspan=2>Remove reservation</th>");
                             Response.Write("</tr>");
                             //loop to write all found records
                             while (Index < DB.Count)
                             {
                                 //start the row of output table
                                 Response.Write("<tr>");
                                 //get the firstname
                                 FirstName = Convert.ToString(DB.DataTable.Rows[Index]["FirstName"]);
                                 //get the surname
                                 LastName = Convert.ToString(DB.DataTable.Rows[Index]["LastName"]);
                                 //get the author
                                 Author = Convert.ToString(DB.DataTable.Rows[Index]["Author"]);
                                 //get the title
                                 Title = Convert.ToString(DB.DataTable.Rows[Index]["Title"]);
                                 //get the res date
                                 ReservationDate = Convert.ToString(DB.DataTable.Rows[Index]["ReservationDate"]);
                                 ReservationID = Convert.ToString(DB.DataTable.Rows[Index]["ReservationID"]);
                                 //display firstname
                                 Response.Write("<td><b>" + FirstName + "</b></td>");
                                 //display surname
                                 Response.Write("<td><b>" + LastName + "</b></td>");
                                 //display the author column
                                 Response.Write("<td><b>" + Author + "</b></td>");
                                 //display the title column
                                 Response.Write("<td><b>" + Title + "</b></td>");
                                 //display res_date
                                 Response.Write("<td><b>" + ReservationDate + "</b></td>");
                                 //display remove button
                                 Response.Write("<td colspan=2>" + "<button id='" + ReservationID + " 'type='submit' name='btnDeleteRes' name='Remove'value='" + ReservationID + "'>Remove</button></td>");
                                 Response.Write("</td>");
                                 //point at the next record
                                 Index++;
                                 //end the row of output table
                                 Response.Write("</tr>");
                             }
                             //end the table
                             Response.Write("</table>");
       %>
                    <button type="button" class="button button-dark" id="back" value="back" onclick="goBack()">Back</button>

                      
                    </form>
                </div></div></div>
            </div>

    </section>>


    <!-- FOOTER -->
   
    <!-- FOOTER -->
</body>
</html>
