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
    <title>Issue Book</title>
    <link rel="stylesheet" href="../Style Sheikhz Library/StyleSheet.css"/>
   
  
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
    <form id="form1" runat="server">
    <div>
        <%

            //get the borrower id from the the form
            string BorrowerID = Request.Form["txtbor_id"];
            //get the copy No from the form
            string CopyBarCode = Request.Form["txtBookNo"];
            //connect to the database
            clsDataConnection DB = new clsDataConnection();
            //get the data from the DB
            string CopyLoanType ="";
            //add parameter to the sproc
            DB.AddParameter("@CopyBarCode", CopyBarCode);
            DB.Execute("sproc_CopyTable_LoanType");
            CopyLoanType = Convert.ToString(DB.DataTable.Rows[0]["CopyLoanType"]);
            string LoanID = "";
            Int32 NoLoan = 0;
            //reset the connection
            DB = new clsDataConnection();
            DB.Execute("sproc_LoanTable_LoanNumber");
            NoLoan = DB.Count + 1;
            LoanID = "1" + NoLoan;
            //check type of loan
            try {
                if (CopyLoanType == "Short")
                {
                    //send the data to the store procedure
                    DB.AddParameter("@BorrowerID", BorrowerID);
                    DB.AddParameter("@CopyBarCode", CopyBarCode);
                    DB.AddParameter("@LoanID", LoanID);
                    //exec the sproc
                    DB.Execute("sproc_CopyTable_ShortIssues");
                    Response.Redirect("LibraryManagerMainMenu.aspx");
                }
                else if (CopyLoanType == "Normal")
                {
                    //send the data to the store procedure
                    DB.AddParameter("@BorrowerID", BorrowerID);
                    DB.AddParameter("@CopyBarCode", CopyBarCode);
                    DB.AddParameter("@LoanID", LoanID);
                    //exec the sproc
                    DB.Execute("sproc_CopyTable_NormalIssues");
                    Response.Redirect("LibraryManagerMainMenu.aspx");

                }
                else if (CopyLoanType == "Long") ;
                {
                    //send the data to the store procedure
                    DB.AddParameter("@BorrowerID", BorrowerID);
                    DB.AddParameter("@CopyBarCode", CopyBarCode);
                    DB.AddParameter("@LoanID", LoanID);
                    //exec the sproc
                    DB.Execute("sproc_CopyTable_LongIssues");
                    Response.Redirect("LibraryManagerMainMenu.aspx");
                }
            }
            catch{
                Response.Write("There is some error.");
            }
















             %>
    </div>
    </form>
</body>
</html>
