<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchShowing.aspx.cs" Inherits="FrontEnd.Mudrik.Staff.SearchShowing" %>

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
    <div class="title"><h2>Search Showing</h2></div></div></div>
    <form id="form2" action="SearchShowing_Action.aspx">
        <div class="container">
     <div class="one-col">
          <div class="center-text">
         
                      <label for="Search">
                            <strong>Enter Film Name: </strong>
                        </label>
                        <input type="text" name="txtSearch" id="txtSearch" />
                        <button type="submit" class="button button-dark" id="submit" value="submit">Search</button>
                            
       </div></div> </div> </form>
    <!-- form to search -->

    <!-- display Staffs -->
      <div class="container">
          <div class="one-col">
          <div class="tables">
        
        <div class="center-text">
        
    <form id="form1" runat="server" action="SearchShowing_Action2.aspx">
       
   <%      
        //variables to store data about the book
            string screening_id = "";
            string filmName = "";
            string theaterNo = "";
            string theaterType = "";
            string startTime = "";
            string dateOfScreeening = "";
            Int32 Index = 0;
            //connection to the database
            Class_Library.clsDataConnection DB = new Class_Library.clsDataConnection();
            //execute procedure displaying all book copies
            DB.Execute("sproc_tblScreening_AllShowings");
            //start of table in which we display the results
            Response.Write("<table border=1 cellpadding=4><tr>");
            Response.Write("<th>screening_id</th>");
            Response.Write("<th>filmName</th>");
            Response.Write("<th>theaterNo</th>");
            Response.Write("<th>theaterType</th>");
            Response.Write("<th>startTime</th>");
            Response.Write("<th>dateOfScreeening</th>");
            Response.Write("<th colspan=2>Delete Showing</td>");
            Response.Write("</tr>");
            //loop to write all found records
       while (Index < DB.Count)
       {
           //start the row of output table
                Response.Write("<tr>");
                //get the film_id
                screening_id = Convert.ToString(DB.DataTable.Rows[Index]["screening_id"]);
                //get the filmName
                filmName = Convert.ToString(DB.DataTable.Rows[Index]["filmName"]);
                //get the genre
                theaterNo = Convert.ToString(DB.DataTable.Rows[Index]["theaterNo"]);
                //get the duration
                theaterType = Convert.ToString(DB.DataTable.Rows[Index]["theaterType"]);
                //get the ageRated
                startTime = Convert.ToString(DB.DataTable.Rows[Index]["startTime"]);
                //get the director
                dateOfScreeening = Convert.ToString(DB.DataTable.Rows[Index]["dateOfScreeening"]);
                //write the film_id column
                Response.Write("<td><b>" + screening_id + "</b></td>");
                //write the filmName column
                Response.Write("<td><b>" + filmName + "</b></td>");
                //write the genre column
                Response.Write("<td><b>" + theaterNo + "</b></td>");
                //write the duration column
                Response.Write("<td><b>" + theaterType + "</b></td>");
                //write the ageRated column
                Response.Write("<td><b>" + startTime + "</b></td>");
                //write the director column
                Response.Write("<td><b>" + dateOfScreeening + "</b></td>");
                //Output the action button
                Response.Write("<td colspan=2><a class='adnotation' href='#'>" + "<button id='" + screening_id + " 'type='submit' name='btnDeleteShowing' name='DeleteShowing'value='" + screening_id + "'>Delete  Showing</button><span>Warning: You are about to delete this  Showing.</span></a></td>");

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
</body>
</html>
