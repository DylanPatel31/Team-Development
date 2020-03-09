<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    string loggedUserID;

    protected void Page_Load(object sender, EventArgs e)
    {
        loggedUserID= (string)(Session["loggedUserID"]);
        if (loggedUserID == null)
        {
            Response.Redirect("../LoginPage.html");
        }
        else {

        }
    }

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
    <!-- Fines form-->
    <section class="Fines">
        <div class="container">
          <div class="one-col">
          <div class="tables">
        <div class="center-text">
               <div class="title"><h1 class="center-text">Books on loan</h1></div>
                    <form method="post">
                        <%
                            //declare user id
                            string BorrowerID = loggedUserID;
                            //declare index
                            Int32 Index = 0;
                            //variables to store the data about the loans
                            string LoanIssueDate = "";
                            string LoanDueDate = "";
                            string LoanReturnDate = "";
                            string Title = "";
                            string Author = "";
                            string PublishedYear = "";
                            string ISBN = "";
                            //connection to the database
                            clsDataConnection DB = new clsDataConnection();
                            //send the parameter to the sproc
                            DB.AddParameter("@BorrowerID", BorrowerID);
                            //execute the sproc
                            DB.Execute("sproc_LoanTable_BorrowersLoan");
                            //start of the table to show loans
                            Response.Write("<table><tr>");
                            Response.Write("<th>Issue date</th>");
                            Response.Write("<th>Due date</th>");
                            Response.Write("<th>Return date</th>");
                            Response.Write("<th>Title</th>");
                            Response.Write("<th>Author</th>");
                            Response.Write("<th>Publication Year</th>");
                            Response.Write("<th>ISBN</th>");
                            //end of the title row
                            Response.Write("</tr>");
                            //loop to show all matching records
                            while(Index < DB.Count)
                            {
                                //get the data
                                LoanIssueDate = Convert.ToString(DB.DataTable.Rows[Index]["LoanIssueDate"]);
                                LoanDueDate = Convert.ToString(DB.DataTable.Rows[Index]["LoanDueDate"]);
                                LoanReturnDate = Convert.ToString(DB.DataTable.Rows[Index]["LoanReturnDate"]);
                                Title = Convert.ToString(DB.DataTable.Rows[Index]["Title"]);
                                Author = Convert.ToString(DB.DataTable.Rows[Index]["Author"]);
                                PublishedYear = Convert.ToString(DB.DataTable.Rows[Index]["PublishedYear"]);
                                ISBN = Convert.ToString(DB.DataTable.Rows[Index]["ISBN"]);
   
                                //display data
                                Response.Write("<tr>");
                                Response.Write("<td><b>" + LoanIssueDate + "</b></td>");
                                Response.Write("<td><b>" + LoanDueDate + "</b></td>");
                                Response.Write("<td><b>" + LoanReturnDate + "</b></td>");
                                Response.Write("<td><b>" + Title + "</b></td>");
                                Response.Write("<td><b>" + Author + "</b></td>");
                                Response.Write("<td><b>" + PublishedYear + "</b></td>");
                                Response.Write("<td><b>" + ISBN + "</b></td>");
                                //increase the index
                                Index++;
                                //end row
                                Response.Write("</tr>");
                            }
                            //end table
                            Response.Write("</table>");
                             %>
                     
                            <button type="button" class="button button-dark" id="Back" value="Back" onclick="goBack()">Back</button>
                      </form>
        </div>
        </div>
        </div>  
            </div>  
    </section>

    <!-- FOOTER -->
    
    <!-- FOOTER -->
</body>
</html>


