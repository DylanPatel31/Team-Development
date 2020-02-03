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
                    <li><a href="Users_Menu.aspx">Menu</a></li>
                    <li><a href="../index.html">Logout</a></li>
                </ul>
            </div>
        </div>
    </header>>

    <!-- Users Menu-->
    <section class="UserMenu">
        <div class="container">
            <h2 class="center-text">User Menu</h2>
            <div class="col-one">
                <div class="center-text">
                    <form method="post" action="Users_Menu.aspx">
                        <button type="button" class="button button-dark" id="MyBookings" value="MyBookings"  onclick="location.href='LoanUsers1.aspx';">My Bookings</button><br />
                        <button type="button" class="button button-dark" id="SearchFilms " value="SearchFilm"  onclick="location.href='SearchBook.aspx';">Search Film</button><br />
                        <button type="button" class="button button-dark" id="EditPersonalDetails" value="EditPersonalDetails"  onclick="location.href='Update_User_details1.aspx';">Edit Personal Details</button><br />                        
                        <button type="button" class="button button-dark" id="DeleteAccount " value="DeleteAccount"  onclick="location.href='SearchBook.aspx';">Delete Account</button><p />
                        <button type="button" class="button button-dark" id="LogOut" value="LogOut" onclick="goBack()">Log Out </button>
                    </form>
                    </div>
                </div>

        </div>
    </section>
  


</body>
</html>