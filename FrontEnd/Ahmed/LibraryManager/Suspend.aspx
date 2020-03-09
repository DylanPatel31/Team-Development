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
    <div class="container">
        <div class="col-one">
        <div class="center-text">
        <div class="tables">
    <form id="form1" runat="server">
    <div>
     <%
         //get the bor id
         string BorrowerID = Request.Form["txtBorID"];
         //get the adnotation
         string BorrowerRecords = Request.Form["txtAdnotation"];

         //declare variables to display results of suspending
         string bor_id_display = "";
         string bor_firstname = "";
         string bor_surname = "";
         string bor_status = "";
         string show_adnotation = "";

         //connect to the database
         clsDataConnection DB = new clsDataConnection();
         //send the bor_id to the stored procedure
         DB.AddParameter("@BorrowerID", BorrowerID);
         //send the adnotation to the stored procedure
         DB.AddParameter("@BorrowerRecords", BorrowerRecords);
         //execute the stored procedure
         DB.Execute("sproc_BorrowerTable_Suspend");

         //reset the connection
         DB = new clsDataConnection();
         //send the primary key
         DB.AddParameter("@BorrowerID",BorrowerID);
         //execute the stored procedure
         DB.Execute("sproc_BorrowerTable_SuspendedUser");
         //start the html table
         Response.Write("<table cellpadding=4><th>User ID</th><th>Name</th><th>Surname</th><th>Status</th><th>Adnotation</td><tr>");
         //if one record is found
         if (DB.Count == 1)
         {
             //get bor_id
             bor_id_display = Convert.ToString(DB.DataTable.Rows[0]["BorrowerID"]);
             //get bor names
             bor_firstname = Convert.ToString(DB.DataTable.Rows[0]["FirstName"]);
             bor_surname = Convert.ToString(DB.DataTable.Rows[0]["LastName"]);
             //get or status
             bor_status = Convert.ToString(DB.DataTable.Rows[0]["Borrowerstatus"]);
             show_adnotation = Convert.ToString(DB.DataTable.Rows[0]["BorrowerRecords"]);
         }

          Response.Write("<td><b>" + bor_id_display + "</b></td><td><b>" + bor_firstname + "</b></td><td><b>" + bor_surname + "</b></td><td><b>" + bor_status + "</b></td><td><b>" + show_adnotation + "</b></td>");
            

            //close the table row
            Response.Write("</tr>");
            //close the table
            Response.Write("</table>");

             %>
         <br/><button type="button" class="button button-dark" id="Back" onclick="goBack()">Back</button>
    </div>
    </form>
            
           
        </div></div></div></div>
    <!-- FOOTER -->
   
    <!-- FOOTER -->
    </body>
</html>
