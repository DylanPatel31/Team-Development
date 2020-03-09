<%@ Page Language="C#" %>

<!DOCTYPE html>

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
    <form id="form2" action="SearchBooksDislay.aspx">
        <div class="container">
     <div class="one-col">
          <div class="center-text">
         
                      <label for="Search">
                            <strong>Book Title: </strong>
                        </label>
                        <input type="text" name="txtSearch" id="txtSearch" />
                        <button type="submit" class="button button-dark" id="submit" value="submit">Search</button>
                            
       </div></div> </div> </form>
    <!-- form to search -->

    <!-- display copies -->
      <div class="container">
          <div class="one-col">
          <div class="tables">
        
        <div class="center-text">
        
    <form id="form1" runat="server" action="SearchBooksDisplay.aspx">
       
   <%      
       //variables to store data about the book
       string ISBN = "";
       string Author = "";
       string Title = "";
       string Publisher = "";
       string ShelfNo = "";
       string PublishedYear = "";
       string EditionNo = "";
       string CopyCondition = "";
       string CopyStatus = "";
       Int32 Index = 0;
       //connection to the database
       clsDataConnection DB = new clsDataConnection();
       //execute procedure displaying all book copies
       DB.Execute("sproc_BookCopyTable_SearchByGuest");
       //start of table in which we display the results
       Response.Write("<table border=1 cellpadding=4><tr>");
       Response.Write("<td>ISBN</td>");
       Response.Write("<td>Title</td>");
       Response.Write("<td>Author</td>");
       Response.Write("<td>Shelf No</td>");
       Response.Write("<td> Publisher</td>");
       Response.Write("<td> Published Year </td>");
       Response.Write("<td>Edition No</td>");
        Response.Write("<td>Condition</td>");
       Response.Write("<td>Status</td>");
       Response.Write("<td colspan=2>Reserve book</td>");
       Response.Write("</tr>");
       //loop to write all found records
       while (Index < DB.Count)
       {
           //start the row of output table
           Response.Write("<tr>");
            //get the menu code
           ISBN = Convert.ToString(DB.DataTable.Rows[Index]["ISBN"]);
           //get the barcode
           Title = Convert.ToString(DB.DataTable.Rows[Index]["Title"]);
           //get the name
           Author = Convert.ToString(DB.DataTable.Rows[Index]["Author"]);
           //get the author
           Publisher = Convert.ToString(DB.DataTable.Rows[Index]["Publisher"]);
           //get the publisher
           ShelfNo = Convert.ToString(DB.DataTable.Rows[Index]["ShelfNo"]);
           //get the shelf no
           PublishedYear = Convert.ToString(DB.DataTable.Rows[Index]["PublishedYear"]);
           //get the pub yr
           EditionNo = Convert.ToString(DB.DataTable.Rows[Index]["EditionNo"]);
           //get the edition no
           CopyCondition = Convert.ToString(DB.DataTable.Rows[Index]["CopyCondition"]);
           //get the condition
           CopyStatus = Convert.ToString(DB.DataTable.Rows[Index]["CopyStatus"]);
           //write the ISBN column
           Response.Write("<td><b>" + ISBN + "</b></td>");
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

Response.Write("<td colspan=2><a class='adnotation' href='#'>" + "<button id='" + ISBN + " 'type='submit' name='btnReserveBook' href='LoginPage.html' name='ReserveBook'value=' " + ISBN + "'>Reserve Book</button><span>Please, login to reserve this book.</span></a></td>");
           Response.Write("</td>");
           //point at the next record
           Index++;
           //end the row of output table
           Response.Write("</tr>");
       }
       //end the table
       Response.Write("</table>");
       %>
                
            
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
