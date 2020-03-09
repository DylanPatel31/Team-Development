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

    <!-- Personal details form-->
    <section class="Search">
        <div class="container">
           <div class="title"> <h2 class="center-text">Fine Payment</h2></div>
            <div class="col-one">
                <div class="center-text">
                    <form method="post" action="ViewFines.aspx">
                        <label for="Search">
                            <strong>Borrower ID: </strong>
                        </label>
                        <input type="text" name="txtSearch" id="txtSearch" /> 

                        <button type="button" class="button button-dark" id="SearchUser" value="SearchUser">Search User</button>
                        <button type="button" class="button button-dark" id="back" value="back" onclick="goBack()">Back</button>

                    </form>
                </div>
            </div>  
            </div>   
                               
</section>

        
         <section class="Fines">
      <!-- display fines -->
      <div class="container">
          <div class="one-col">
          <div class="tables">
        
        <div class="center-text">
        
                    <form method="post" action="PaymentRegistrationManager.aspx">
                        <%
                            //variables to store data about the users fines
                            string BorrowerID = Request["txtSearch"];
                            string FineID = "";
                            string FineDate = "";
                            string FineStatus = "";
                            string FineAmount = "";
                            string FirstName = "";
                            string LastName = "";
                            //declare index
                            Int32 Index = 0;
                            //connect to the db
                            clsDataConnection DB = new clsDataConnection();
                            //add parameter to the sproc
                            DB.AddParameter("@BorrowerID", BorrowerID);
                            //execute the sproc
                            DB.Execute("sproc_FineTable_ViewFines");
                            //start the table
                            Response.Write("<table><tr>");
                            Response.Write("<th>Borrower ID</th>");
                            Response.Write("<th>Firstname</th>");
                            Response.Write("<th>LastName</th>");
                            Response.Write("<th>FineID</th>");
                            Response.Write("<th>FineDate</th>");
                            Response.Write("<th>FineStatus</th>");
                            Response.Write("<th>FineAmount</th>");
                            Response.Write("<th colspan=2>Register Payment</th>");
                            Response.Write("</tr>");
                            //loop to write all found records
                            while (Index < DB.Count)
                            {
                                //start the row of output table
                                Response.Write("<tr>");
                                //get the firstname
                                BorrowerID = Convert.ToString(DB.DataTable.Rows[Index]["BorrowerID"]);
                                //get the firstname
                                FirstName = Convert.ToString(DB.DataTable.Rows[Index]["FirstName"]);
                                //get the surname
                                LastName = Convert.ToString(DB.DataTable.Rows[Index]["LastName"]);
                                //get the fine id
                                FineID = Convert.ToString(DB.DataTable.Rows[Index]["FineID"]);
                                //get the fine date
                                FineDate = Convert.ToString(DB.DataTable.Rows[Index]["FineDate"]);
                                //get the fine status
                                FineStatus = Convert.ToString(DB.DataTable.Rows[Index]["FineStatus"]);
                                //get the fine amout
                                FineAmount = Convert.ToString(DB.DataTable.Rows[Index]["FineAmount"]);
                                //display bor_id
                                Response.Write("<td><b>" + BorrowerID + "</b></td>");
                                //display firstname
                                Response.Write("<td><b>" + FirstName + "</b></td>");
                                //display the surname
                                Response.Write("<td><b>" + LastName + "</b></td>");
                                //display the fine id
                                Response.Write("<td><b>" + FineID + "</b></td>");
                                //display fine date
                                Response.Write("<td><b>" + FineDate + "</b></td>");
                                //display the fine status
                                Response.Write("<td><b>" + FineStatus + "</b></td>");
                                //display fine amount
                                Response.Write("<td><b>" + FineAmount + "</b></td>");
                                //display button to register payment 
                                Response.Write("<td colspan=2>" + "<button id='" + FineID + " 'type='submit' name='btnPayFine' name='Pay'value='" + FineID + "'>Register </button></td>");
                                //point at the next record
                                Index++;
                                //end the row of output table
                                Response.Write("</tr>");

                            }
                            //end the table
                            Response.Write("</table>");

       %>
                  <input type="hidden" name="txtbor_id" value="<%Response.Write(BorrowerID); %>" />

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
