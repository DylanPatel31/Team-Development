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



    </header>

        <!-- return book info -->
        <div class="container">
            <div class="title"><h2 class="center-text">Return book details</h2></div>
            <div class="col-one">
                <div class="center-text">

    <form id="form1" runat="server">
    <div>
    
        <%

            //variables to store copy details
            string CopyCondition = Request.Form["ddlCondition"];
            string CopyBarCode = Request.Form["txtBarcode"];

            //variables to count fine
            string LoanID = "";
            string BorrowerID = "";
            DateTime LoanDueDate ;
            Int32 Days = 0;
            DateTime LoanReturnDate;
            decimal new_fine = 0;
            string FineID = "";
            TimeSpan between;
            LoanReturnDate = DateTime.Today;
            //connect to DB
            clsDataConnection DB = new clsDataConnection();
            //add parameter to the sproc
            DB.AddParameter("@CopyBarCode", CopyBarCode);
            //execute sproc
            DB.Execute("sproc_LoanTable_CopiesOnLoan");
            LoanID = Convert.ToString(DB.DataTable.Rows[0]["LoanID"]);
            LoanDueDate = Convert.ToDateTime(DB.DataTable.Rows[0]["LoanDueDate"]);
            BorrowerID = Convert.ToString(DB.DataTable.Rows[0]["FK_BorrowerID"]);
            //add parameter for sproc - without fines
            DB.AddParameter("@LoanID", LoanID);
            if(LoanDueDate < DateTime.Today ){
                //connect to the DB
                clsDataConnection NewDB = new clsDataConnection();
                //calculate fine number
                NewDB.Execute("sproc_FineTable_All");
                //create new primary key
                FineID = "F0" + (NewDB.Count);
                //calculate days between today and due date from db
                between = LoanReturnDate - LoanDueDate;
                //convert to int32 number of days
                Days = Convert.ToInt32(between.TotalDays);
                //calculate new fine
                new_fine = Convert.ToDecimal(Days * 0.20);
                //send parameters to the sproc
                NewDB.AddParameter("@BorrowerID", BorrowerID);
                NewDB.AddParameter("@LoanID", LoanID);
                NewDB.AddParameter("@FineID", FineID);
                NewDB.AddParameter("@fine_amount", new_fine);
                NewDB.AddParameter("@LoanDueDate", LoanDueDate);
                //execute sproc to add new fine
                NewDB.Execute("sproc_FineTable_LatestFine");
                //message about new fine
                Response.Write("<h4 class='center-text'>User have new fine - " + new_fine + "£.</h4>");
            }
            else { }

            //reconnect to Db
            clsDataConnection DB2 = new clsDataConnection();
            //send parameters to DB
            DB2.AddParameter("@BorrowerID", BorrowerID);
            DB2.AddParameter("@CopyBarCode", CopyBarCode);
            DB2.AddParameter("@CopyCondition", CopyCondition);
            //execute the sproc
            DB2.Execute("sproc_CopyTable_ReturnBook");
            Response.Write("<h4 class='center-text'>Copy returned.</h4>");
   %>
         <button type="button" class="button button-dark" id="Back" value="back" onclick="goBack()">Back</button>
    </div>
    </form></div></div></div>

    <!-- FOOTER -->
        <section class="footer">
    <footer class="site-footer">
       
    </footer>
        </section>
    <!-- FOOTER -->
</body>
</html>
