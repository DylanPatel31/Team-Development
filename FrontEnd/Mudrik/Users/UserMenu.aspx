<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserMenu.aspx.cs" Inherits="FrontEnd.Mudrik.Users.UserMenu" %>

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

    <!-- Menu Buttons-->
    <section class="CustomerMenu">
        <div class="container">
            <h2 class="center-text">Customer Menu</h2>
                             <form method="post" action="MainMenu.aspx.aspx">
           
                   
                        <a href="EditDetails_Customer.aspx" type="button" class="button button-dark" id="EditDetails"  >Edit My Personal Details </a><br />    
                        <a href="SearchFilm.aspx" type="button" class="button button-dark" id="SearchFilm" >Search Film</a><br />
                        <a href="SearchShowing.aspx" type="button" class="button button-dark" id="NewShowing"  >View Showing List</a><br />  
                        <a href="BookFilm.aspx" type="button" class="button button-dark" id="NewMakeBooking"  >Make Booking</a><br />    
                        <a href="SearchBooking.aspx" type="button" class="button button-dark" id="RemoveBooking" >Cancel My Booking</a><br /> 

                
            </form>
                </div>
             
    </section>










    <!-- Background-Colour changer -->
    <article>
        <time>
            <th width="234" height="128" scope="col">
                <div id="backgroundchange">
                    <select name="select" onChange="if(this.selectedIndex!=0)
document.bgColor=this.options[this.selectedIndex].value">
                        <option value="choose" selected>Change Background Colour : </option>
                        <option value="FFFFFF">White </option>
                        <option value="2c50a2">Dark blue </option>
                        <option value="663399">Purple</option>
                        <option value="f60000">Blood Red</option>
                        <option value="e800f6">Pink</option>
                        <option value="00a5f6">Sky Blue</option>
                        <option value="75ab00">Green</option>
                        <option value="91f600">Grass Green</option>
                        <option value="000000">Black</option>
                        <option value="ffa500">Orange</option>
                        <option value="ff69b4">Light Pink</option>
                        <option value="00c5cd">Turquoise</option>
                        <option value="551a8b">Dark Purple</option>
                        <option value="a020f0">Light Purple</option>
                        <option value="ffdab9">Peach</option>
                    </select>
                </div>
            </th>
        </time>
    </article>
    <!-- Background-Colour changer -->
    </body>
</html>
