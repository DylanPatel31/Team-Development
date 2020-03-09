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
    <title>Reserve Book</title>
    <link rel="stylesheet" href="../Style Sheikhz Library/StyleSheet.css"/>

   
  
    
 
    </head>
    <body>
    <!-- Header -->
    <header class="top">
        <div class="container">
            <div class="logo">
                <img src="../imgfolder/SHEIKHZ LIBRARY 1.png" alt="SHEIKHZ LIBRARY1" height="80" width="150" />
                <a href="index.html">SHEIKHZ LIBRARY</a>
            </div>
            <div class="main-menu">
                <ul>
                    
                    <li><a href="LibraryManagerMainMenu.aspx">Dashboard</a></li>
                    <li><a href="../HomePage.html">Sign Out</a></li>
                </ul>
            </div>
        </div>
    </header>
    <!-- HEADER -->
    <!-- Reserve Book form-->
    <section class="Reserve Book">
        <div class="container">
            <h2 class="center-text">Reserve Book </h2>
            <div class="col-one">
                <div class="center-text">
                    <form method="post" action="ReservationByManager.aspx">
                        <label for="Search">
                            <strong>Search For User : </strong>
                        </label>
                        <input type="text" name="Search" id="Search" placeholder="Search by Name or UserNo." />
                        <button type="button" class="button button-dark" id="Search" value="Search">Search</button><p />
                        <textarea name="details" cols="60" rows="20"></textarea><br />
                        <label for="Reason for Suspension">

                            <button type="button" class="button button-dark" id="Reserve" value="Reserve" onclick="location.href='ReserveBook_Details_Users.html';">Reserve Book</button><br />
                            <button type="button" class="button button-dark" id="Back" value="Back" onclick="goBack()">Back</button>
                    </form>
                </div>
            </div>

        </div>
    </section>
    <!-- FOOTER -->
   
    <!-- FOOTER -->
</body>
</html>

