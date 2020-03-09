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
    <meta charset="utf-8">
    <title>LIBRARY STAFF MAIN MENU</title>
    <link rel="stylesheet" href="../Style Sheikhz Library/StyleSheet.css"/>
  


    <style type="text/css">
        .auto-style1 {
            width: 195px;
            height: 30px;
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
    <!-- Withdraw Book form-->
    <section class="issue_details">
        <div class="container">
            <h2 class="center-text">Issue Book </h2>
            <div class="col-one">
                <div class="center-text">
                    <form method="post" action="IssueBook_Manager.aspx" id="form1">
                        <label for="Borrower ID">
                            <strong>Borrower ID: </strong>
                        </label>
                        <input type="text" name="txtbor_id" id="bor_id" placeholder="Enter Borrower ID" class="auto-style1" />

                        <br /><br />
                        <label for="NoOfCopies">
                            <strong> CopyNo.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
                        </label>
                        <input type="text" name="txtBookNo" id="BookNo" placeholder="Enter Book Number." class="auto-style1"/><br />
                        <button type="submit" class="button button-dark" id="Issue" value="Issue">Issue Book</button><br />
                        <button type="button" class="button button-dark" id="Back" value="Back" onclick="goBack()" style="width: 108px; height: 38px">Back</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- FOOTER -->
   
    <!-- FOOTER -->
</body>
</html>
