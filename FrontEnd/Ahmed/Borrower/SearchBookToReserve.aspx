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
    <title>BORROWER MAIN MENU</title>
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
                    
                    <li><a href="BorrowerMainMenu.aspx">Dashboard</a></li>
                    <li><a href="../HomePage.html">Sign Out</a></li>
                </ul>
            </div>
        </div>

    </header>
    <!-- HEADER -->

    <!-- form to search -->
    <div class="one-col"><div class="center-text">
    <div class="title"><h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Search book</h2></div></div></div>
    <form id="form2" action="SearchBookBySearching.aspx">
        <div class="container">
     <div class="one-col">
          <div class="center-text">
         
                      <label for="Search">
                            <strong>Book Title: </strong>
                        </label>
                        <input type="text" name="txtSearch" id="txtSearch" />
                        <button type="submit" class="button button-dark" id="submit" value="submit">Search</button>
              <button type="button" class="button button-dark" id="back" value="back" onclick="goBack()">Back</button>
                            
       </div></div> </div> </form>
    <!-- form to search -->
    <form id="form1">
        <%
            //get the value from the form
            string CopyBarCode = Request.Form["btnReserveBook"];
            string ISBN = Request.Form["txtisbn"];
            string BorrowerID = Request.Form["txtbor_id"];
            //connect to the database
            clsDataConnection DB = new clsDataConnection();
            if (CopyBarCode !=null)
            {
                //send the data to the procedure
                DB.AddParameter("@CopyBarCode", CopyBarCode);
                DB.AddParameter("@ISBN", ISBN);
                DB.AddParameter("@BorrowerID", BorrowerID);
                //execute the stored procedure
                DB.Execute("sproc_ReservationTable_MakeNewReservation");
                //redirect
                Response.Redirect("SearchBookByBorrower.aspx");
            }
            else
            {
                Response.Write("Something went wrong");

            }




             %>
    </form>




    <!-- FOOTER -->
    <footer class="site-footer">
   
    </footer>
    <!-- FOOTER -->
</body>
</html>