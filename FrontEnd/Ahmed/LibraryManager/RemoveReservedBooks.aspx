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
    <title>Library Manager Menu</title>
    <link rel="stylesheet" href="../Style Sheikhz Library/StyleSheet.css"/>
   
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
                    
                    <li><a href="LibraryManagerMainMenu.aspx">Dashboard</a></li>
                    <li><a href="../HomePage.html">Sign Out</a></li>
                </ul>
            </div>
        </div>
    </header>

    <!-- HEADER -->

    <form id="form1" runat="server">
    <div>
    <%
        //get the value from the form
        string ReservationID = Request.Form["btnDeleteRes"];
        //connect to the database
        clsDataConnection DB = new clsDataConnection();
        //check if the res_id is not null
        if (ReservationID !=null)
            {
                //send the data to the procedure     
                DB.AddParameter("@ReservationID", ReservationID);
                //execute the stored procedure
                DB.Execute("sproc_ReservationTable_RemoveReservedBooks");
                //redirect
                Response.Redirect("ReservationByManager.aspx");
            }
            else
            {
                Response.Write("Something went wrong");

            }


         %>
    </div>
    </form>
</body>
</html>
