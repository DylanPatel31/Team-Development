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
     <title>LIBRARY STAFF MAIN MENU</title>
    <link rel="stylesheet" href="../Style Sheikhz Library/StyleSheet.css"/>
   
  
 
    <style type="text/css">
        .auto-style1 {
            width: 228px;
            height: 33px;
        }
    </style>
   
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

    <!-- Personal details form-->
    <section class="Fines">
        <div class="container">
         <div class="title"> <h2 class="center-text">Fine Payment</h2></div>
            <div class="col-one">        
                <div class="center-text"> 
                    <form method="post" action="ViewFines.aspx">
                        <label for="Search">
                            <strong>Borrower ID: </strong>
                        </label>
                        <input type="text" name="txtSearch" id="txtSearch" class="auto-style1" /> 

                        <button type="submit" class="button button-dark" id="SearchUser" value="SearchUser">Search User</button><br />
                        <button type="button" class="button button-dark" id="back" value="back" onclick="goBack()">Back</button>

                    </form>
                </div>
            </div>  
            </div>   
                               
</section>

    <!-- FOOTER -->
    
    <!-- FOOTER -->
</body>
</html>

