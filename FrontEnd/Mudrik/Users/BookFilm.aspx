<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BookFilm.aspx.cs" Inherits="FrontEnd.Mudrik.Users.BookFilm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8"/>
    <title>Customer Menu</title>
    <link rel="stylesheet" href="../style/style.css"/>


    <%

        string loggedUserID= (string)(Session["loggedUserID"]);
        if (loggedUserID == null)
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
                    <li><a href="UserMenu.aspx">Menu</a></li>
                    <li><a href="../index.html">Logout</a></li>
                </ul>
            </div>
        </div>
    </header>>
    <!-- HEADER -->
    <!-- Withdraw Book form-->
    <section class="film_details">
        <div class="container">
            <h2 class="center-text">Book Film For Customer</h2>
            <div class="col-one">
                <div class="center-text">
                    <form method="post" action="BookFilm2.aspx" id="form1">
                        <label for="Booking ID">
                            <strong>Booking ID: </strong>
                        </label>
                        <input type="text" name="txtbooking_id" id="booking_id" placeholder="Enter Booking ID" />

                        <br /><br />


                         <label for="First Name">
                            <strong>First Name: </strong>
                        </label>
                        <input type="text" name="txtfirstName" id="firstName" placeholder="Enter Customer's First Name" />

                        <br /><br />

                        <label for="User ID">
                            <strong>User ID: </strong>
                        </label>
                        <input type="text" name="txtfk1_user_id" id="fk1_user_id" placeholder="Enter Customer ID" />

                        <br /><br />


                         <label for="Seat ID">
                            <strong>Seat ID: </strong>
                        </label>
                        <input type="text" name="txtfk2_seat_id" id="fk2_seat_id" placeholder="Enter Seat Number" />

                        <br /><br />


                        <label for="ScreeningID">
                            <strong>ScreeningID: </strong>
                        </label>
                        <input type="text" name="txtfk3_screening_id" id="fk3_screening_id" placeholder="Enter Screening ID" />

                        <br /><br />


                        <label for="Price">
                            <strong> Price. </strong>
                        </label>
                        <input type="text" name="txtprice" id="price" placeholder="Enter the Price."/><br />
                        <button type="submit" class="button button-dark" id="Book" value="Book">Place Booking</button><br />
                    </form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
