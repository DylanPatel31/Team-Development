<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="utf-8"/>
    <title>Admin Menu</title>
    <link rel="stylesheet" href="../style/style.css"/>
   


    <%

        string loggedUserIDManager= (string)(Session["loggedUserIDManager"]);
        if (loggedUserIDManager == null)
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
                    <li><a href="MainMenu.aspx">Menu</a></li>
                    <li><a href="../index.html">Logout</a></li>
                </ul>
            </div>
        </div>
    </header>>
    <!-- HEADER --> 

    <!-- Menu Buttons-->
    <section class="AdminMenu">
        <div class="container">
            <h2 class="center-text">Admin Menu</h2>
                             <form method="post" action="MainMenu.aspx">
           
                   
                        <a href="EditDetails_Admin.aspx" type="button" class="button button-dark" id="EditDetails"  > My Details </a><br />    
                        <a href="AddFilm.aspx" type="button" class="button button-dark" id="AddFilm"  >Add Film</a><br />
                        <a href="SearchFilm.aspx" type="button" class="button button-dark" id="SearchFilm" >Search Film</a><br />
                        <a href="AddStaff.aspx" type="button" class="button button-dark" id="AddStaff">Add Staff</a><br />
                        <a href="SearchStaff.aspx" type="button" class="button button-dark" id="SearchStaff">Search Staff</a><br />
                        <a href="AddCustomer.aspx" type="button" class="button button-dark" id="AddCustomer">Add Customer</a><br />
                        <a href="SearchCustomer.aspx" type="button" class="button button-dark" id="SearchCustomer" >Search Customer</a><br />  
                        <a href="AddShowing.aspx" type="button" class="button button-dark" id="NewShowing"  >New Showing</a><br /> 
                        <a href="SearchShowing.aspx" type="button" class="button button-dark" id="SearchShowing">Search Showing</a><br />
                        <a href="BookFilm.aspx" type="button" class="button button-dark" id="NewMakeBooking"  >Make Booking</a><br />    
                        <a href="SearchBooking.aspx" type="button" class="button button-dark" id="RemoveBooking" >Remove Booking</a><br /> 
                        <a href="Reports.aspx" type="button" class="button button-dark" id="Reports">Reports </a><br />

                
            </form>
                </div>
             
    </section>
   
</body>
</html>