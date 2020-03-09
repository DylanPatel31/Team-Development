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
               <div class="title"> <h1 class="center-text">Fines</h1></div>
                <h4 class="center-text">To pay the fine, please visit library staff as they will help you with the payment processs.</h4>
                    <form method="post">
                        <%
                            //declare user id
                            string BorrowerID = loggedUserID;
                            Int32 Index = 0;
                            string FineDate = "";
                            decimal FineAmount = 0;
                            string FineStatus = "";
                            decimal total = 0;
                            //connection to the database
                            clsDataConnection DB = new clsDataConnection();
                            //send the parameter to the sproc
                            DB.AddParameter("@BorrowerID", BorrowerID);
                            //execute the sproc
                            DB.Execute("sproc_FineTable_BorrowersFines");
                            //start of the table to show fines
                            Response.Write("<table><tr>");
                            Response.Write("<th>Fine Date</th>");
                            Response.Write("<th>Fine Amount</th>");
                            Response.Write("<th>Fine Status</th>");
                            //end of the title row
                            Response.Write("</tr>");
                            //loop to show all matching records
                            while(Index < DB.Count)
                            {
                                //get the data
                                FineDate = Convert.ToString(DB.DataTable.Rows[Index]["FineDate"]);
                                FineAmount = Convert.ToDecimal(DB.DataTable.Rows[Index]["FineAmount"]);
                                FineStatus = Convert.ToString(DB.DataTable.Rows[Index]["FineStatus"]);

                                //display data
                                Response.Write("<tr>");
                                Response.Write("<td><b>" + FineDate + "</b></td>");
                                Response.Write("<td><b>" + FineAmount + "</b></td>");
                                Response.Write("<td><b>" + FineStatus + "</b></td>");
                                if (FineStatus != "PAID") {
                                    //calculate total
                                    total = total + FineAmount;
                                }
                                //increase the index
                                Index++;
                                //end row
                                Response.Write("</tr>");
                            }
                            //end table
                            Response.Write("</table>");
                            if (total > 0) { 
                            Response.Write("<h2 class='center-text'>Total amount of fines need to be paid: " + total + ".</h2><br/>");
                                }
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

