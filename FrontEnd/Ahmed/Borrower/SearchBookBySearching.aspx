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

    <!-- display books -->
      <div class="container">
          <div class="one-col">
          <div class="tables">
        
        <div class="center-text">
        
    <form id="form1" runat="server" action="SearchBookToReserve.aspx">
   <%      
       string search = Request["txtSearch"];
       //variables to store data about the book
       string ISBN = "";
       string CopyBarCode = "";
       string Title = "";
       string Author = "";
       string Publisher = "";
       string ShelfNo = "";
       string PublishedYear = "";
       string EditionNo = "";
       string CopyCondition = "";
       string CopyStatus = "";
       Int32 Index = 0;
       //connection to the database
       clsDataConnection DB = new clsDataConnection();
       //send the parameter 
       DB.AddParameter("@search", search);
       //execute procedure displaying all book copies
       DB.Execute("sproc_BookCopyTable_SearchByGuest");
       //start of table in which we display the results
       Response.Write("<table border=1 cellpadding=4><tr>");
       Response.Write("<th>ISBN</th>");
       Response.Write("<th>Copy Barcode</th>");
       Response.Write("<th>Title</th>");
       Response.Write("<th>Author</th>");
       Response.Write("<th> Publisher</th>");
       Response.Write("<th>Shelf No</th>");
       Response.Write("<th> Published Year </th>");
       Response.Write("<th>Edition No</th>");
       Response.Write("<th>Condition</th>");
       Response.Write("<th>Status</th>");
       Response.Write("<th colspan=2>Reserve Book</th>");
       Response.Write("</tr>");
       //loop to write all found records
       while (Index < DB.Count)
       {
           //start the row of output table
           Response.Write("<tr>");
           //get the menu code
           ISBN = Convert.ToString(DB.DataTable.Rows[Index]["ISBN"]);
           //get the barcode
           CopyBarCode = Convert.ToString(DB.DataTable.Rows[Index]["CopyBarCode"]);
           //get the name
           Title = Convert.ToString(DB.DataTable.Rows[Index]["Title"]);
           //get the author
           Author = Convert.ToString(DB.DataTable.Rows[Index]["Author"]);
           //get the publisher
           Publisher = Convert.ToString(DB.DataTable.Rows[Index]["Publisher"]);
           //get the shelf no
           ShelfNo = Convert.ToString(DB.DataTable.Rows[Index]["ShelfNo"]);
           //get the pub yr
           PublishedYear = Convert.ToString(DB.DataTable.Rows[Index]["PublishedYear"]);
           //get the edition no
           EditionNo = Convert.ToString(DB.DataTable.Rows[Index]["EditionNo"]);
           //get the condition
           CopyCondition = Convert.ToString(DB.DataTable.Rows[Index]["CopyCondition"]);
           //get the status
           CopyStatus = Convert.ToString(DB.DataTable.Rows[Index]["CopyStatus"]);
           //write the ISBN column
           Response.Write("<td><b>" + ISBN + "</b></td>");
           //write the barcode
           Response.Write("<td><b>" + CopyBarCode + "</b></td>");
           //write the title column
           Response.Write("<td><b>" + Title + "</b></td>");
           //write the author column
           Response.Write("<td><b>" + Author + "</b></td>");
           //write the publisher column
           Response.Write("<td><b>" + Publisher + "</b></td>");
           //write the author shelf no
           Response.Write("<td><b>" + ShelfNo + "</b></td>");
           //write the pub yr
           Response.Write("<td><b>" + PublishedYear + "</b></td>");
           //write the edition no column
           Response.Write("<td><b>" + EditionNo + "</b></td>");
           //write the pub yr
           Response.Write("<td><b>" + CopyCondition + "</b></td>");
           //write the edition no column
           Response.Write("<td><b>" + CopyStatus + "</b></td>");
           //Output the action button
           Response.Write("<td colspan=2>" + "<button id='" + ISBN + " 'type='submit' name='btnReserveBook' value='" + CopyBarCode + "'>Reserve Book</button><span></td>");
           //point at the next record
           Index++;
           //end the row of output table
           Response.Write("</tr>");
       }
       //end the table
       Response.Write("</table>");
       %>
            <input type="hidden" name="txtbor_id" value="<%Response.Write(loggedUserID); %>" />
        <input type="hidden" name="txtisbn" value="<%Response.Write(ISBN); %>" />
    </form>
</div></div>
    
        </div>  
    
        </div>    
            
<!-- FOOTER -->
    <footer class="site-footer">
        
    </footer>
    <!-- FOOTER -->
</body>
</html>
