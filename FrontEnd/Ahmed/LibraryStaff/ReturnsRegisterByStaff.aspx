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
            height: 44px;
            width: 231px;
        }
        .auto-style2 {
            width: 210px;
            height: 42px;
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
    <!-- Return Book form-->
    <section class="Return Book">
        <div class="container">
            <h2 class="center-text">Return Books</h2>
            <div class="col-one">
                <div class="center-text">
                    <form method="post" action="ReturnBooks.aspx" id="form1">
                        <label for="Barcode">
                            <strong>Copy Bardcode</strong>
                        </label>
                        <input type="text" name="txtBarcode" id="barcode" placeholder="Please enter the Barcode" class="auto-style1" />

                        <label for="Condition">
                            <strong>Condition: </strong>
                            <select name="ddlCondition" required class="auto-style2">
                                <option value="Condition" selected disabled>Condition</option>
                                <option value="Good">Good</option>
                                <option value="Damaged">Damaged</option>
                                <option value="Vandalised">Vandalised</option>
                            </select>
                        </label><br />
                        
                            <button type="submit" class="button button-dark" id="ReturnBook" value="ReturnBook">Return Book</button><br />
                            <button type="button" class="button button-dark" id="Back" value="Back" onclick="goBack()">Back</button>
                    </form>
                </div>
            </div>

        </div>
    </section>
    <!-- FOOTER -->
    <footer class="site-footer">
   
    </footer>
    <!-- FOOTER -->
</body>
</html>

