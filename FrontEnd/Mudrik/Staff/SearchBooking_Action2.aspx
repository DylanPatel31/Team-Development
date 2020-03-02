<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchBooking_Action2.aspx.cs" Inherits="FrontEnd.Mudrik.Staff.SearchBooking_Action2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <title>Staff Menu</title>
    <link rel="stylesheet" href="../style/style.css"/>
    


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
   <!-- Header -->
    <header class="top">
        <div class="container">
            <div class="logo">
                <a href="index.html">Timeless Films</a>
            </div>
            <div class="main-menu">
                <ul>
                    <li><a href="StaffMenu.aspx">Menu</a></li>
                    <li><a href="../index.html">Logout</a></li>
                </ul>
            </div>
        </div>
    </header>>
    <!-- HEADER -->
    <!-- form to search -->
    <div class="one-col"><div class="center-text">
    <div class="title"><h2>Search Booking</h2></div></div></div>
    <form id="form1" action="SearchCustomer_Action.aspx">
        <div class="container">
     <div class="one-col">
          <div class="center-text">
         
                      <label for="Search">
                            <strong>Enter Customer's Name: </strong>
                        </label>
                        <input type="text" name="txtSearch" id="txtSearch" />
                        <button type="submit" class="button button-dark" id="submit" value="submit">Search</button><br/>
                        <button type="submit" class="button button-dark" id="displayall" value="displayall" onclick="goBack()">Display All</button><br/>
       </div></div> </div> </form>
    <!-- form to search -->
     <!-- display Films -->
      <div class="container">
          <div class="tables">
        <div class="one-col">
        <div class="center-text">
        
    
    <%
        //get the value from the delete button
        string delete = Request.Form["btnDeleteBooking"];
        //connect to the db
        Class_Library.clsDataConnection DB = new Class_Library.clsDataConnection();
        //check delete value
        if (delete != null)
        {
            //send the isbn number to the delete procedue
            DB.AddParameter("@delete", delete);
            //execute procedure deleting the book and all associated copies
            DB.Execute("sproc_tblBooking_Delete");
            Response.Redirect("SearchBooking.aspx");
        }
        else
        {
            //if delete is null
            Response.Redirect("SearchBooking.aspx");
        }
       %>
       
                
            
 
</div></div>
    
        </div>  
    
        </div>
</body>
</html>
