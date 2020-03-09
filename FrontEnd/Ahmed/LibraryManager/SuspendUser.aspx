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
    <title>LIBRARY MANAGER MAIN MENU</title>
    <link rel="stylesheet" href="../Style Sheikhz Library/StyleSheet.css"/>
   

 
      
    <style type="text/css">
        .auto-style1 {
            width: 749px;
            height: 178px;
        }
        .auto-style2 {
            width: 217px;
            height: 43px;
        }
    </style>
   

 
      
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

    </header>>
    <!-- HEADER -->

    <!-- Suspended Borrowers form-->
    <section class="Suspend Borrowers">
        <div class="container">
           <div class="title"> <h2 class="center-text">Suspend Borrower</h2></div>
            <div class="col-one">
                <div class="center-text">
                    <form method="post" action="Suspend.aspx" id="form1">
                     <label for="BorID">
                            <strong>Borrower ID: </strong>
                        </label>
                         <input type="text" name="txtBorID" id="borid" placeholder="Please enter Borrower ID" class="auto-style2" /><br />
                        <label for="Reason for Suspension">
                            <strong>Reason For Suspension: </strong><br/>
                        </label>
                         <textarea maxlength="255" name="txtAdnotation" class="auto-style1"></textarea><br />
                        <button type="submit" class="button button-dark" id="submit" value="Suspend" style="width: 120px; height: 37px">Suspend</button><br />
                        <button type="button" class="button button-dark" id="Back" value="Back" onclick="goBack()" style="width: 117px; height: 37px">Back</button>
                    </form>
                </div>
            </div>

        </div>
    </section>
    <!-- FOOTER -->
   
    <!-- FOOTER -->
</body>
</html>

