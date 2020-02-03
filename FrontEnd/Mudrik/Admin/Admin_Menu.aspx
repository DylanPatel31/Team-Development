<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <title>Library Manager Menu</title>
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
                    <li><a href="Admin_Menu.aspx">Menu</a></li>
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
                             <form method="post" action="Admin_Menu.aspx">
            <div class="col-one-third">
                <div class="center-text">
                   
                        <a href="AddBooks.aspx" type="button" class="button button-dark" id="AddFilm"  > Add Film</a><br />
                        <a href="SearchBooks_Manager.aspx" type="button" class="button button-dark" id="SearchFilm" >Search Film</a><br />
                        <a href="SuspendUser.aspx" type="button" class="button button-dark" id="SuspendCustomer">Suspend Customer</a><br />
                        <a href="AddBooks.aspx" type="button" class="button button-dark" id="AddNewStaff"  > Add New Staff</a><br />

                </div>
            </div>
            <div class="col-one-third">
                <div class="center-text">
                     <a href="Reports.aspx" type="button" class="button button-dark" id="Reports">Generate Sales Reports </a><br />
                     <a href="SearchUsers.aspx" type="button" class="button button-dark" id="SearchStaff" >Search Staff</a><br />
                                            <a href="EditDetails_Manager.aspx" type="button" class="button button-dark" id="EditPersonalDetails"  > Edit Personal Details </a><br />
                        
                    </div>
                </div>
                                  <div class="col-one-third">
                <div class="center-text">     
                      <a href="../CounterStaff/IssueBook_Counter1.aspx" type="button" class="button button-dark" id="IssueBook">Make Booking</a><br />        
                    <a href="../Users/SearchBook.aspx" type="button" class="button button-dark" id="NewReservation"  >New Reservation</a><br />    
                       <a href="RemoveReservation.aspx" type="button" class="button button-dark" id="RemoveReservation" >Remove Reservation</a><br /> 
                    </div>
                   
                    </div>
            </form>
                </div>
             
    </section>

</body>
</html>