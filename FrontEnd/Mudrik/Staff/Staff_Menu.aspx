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
    <title>Library Staff Menu</title>
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
                    <li><a href="Staff_Menu.html">Menu</a></li>
                    <li><a href="../index.html">Logout</a></li>
                </ul>
            </div>
        </div>
    </header>

    <!-- Staff Menu-->
    <section class="StaffMenu">
        <div class="container">
            <h2 class="center-text">Staff Menu</h2>
            <div class="col-one">
                <div class="center-text">
                    
                    <form method="post" action="LibraryStaffMenu1.aspx" id="form1">
                        <button type="button" class="button button-dark" id="SearchCustomers" value="SearchCustomers" onclick="location.href='SearchUserID.aspx';">Search Customers</button><br />
                        <button type="button" class="button button-dark" id="MakeBooking" value="MakeBooking" onclick="location.href='IssueBook_Counter1.aspx';">Make Booking</button><br />
                        <button type="button" class="button button-dark" id="ReturnBook" value="ReturnBook" onclick="location.href='ReturnBook_Counter1.aspx';">Register New Customer</button><br />
                         <button type="button" class="button button-dark" id="SearchFilms" value="SearchFilms" onclick="location.href='SearchUserID.aspx';">Search Films</button><br />
                        <button type="button" class="button button-dark" id="Reservation" value="Reservations" onclick="location.href='Reservations_Counter.aspx';">View Bookings</button><p />
                        <button type="button" class="button button-dark" id="ProcessPayment" value="ProcessPayment" onclick="location.href='ReturnBook_Counter1.aspx';">Process Payment</button><br />
                        <button type="button" class="button button-dark" id="LogOut" value="LogOut" onclick="goBack()">Log Out </button>
                    </form>
                </div>
                </div>
        </div>
    </section>

 
</body>
</html>
