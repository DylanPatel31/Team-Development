<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchStaff.aspx.cs" Inherits="FrontEnd.Mudrik.Admin.SearchStaff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <title>Admin Menu</title>
    <link rel="stylesheet" href="../style/style.css"/>


    <%

        string loggedUserIDManager= (string)(Session["loggedUserIDManager"]);
        if (loggedUserIDManager == null)
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
                    <li><a href="MainMenu.aspx">Menu</a></li>
                    <li><a href="../index.html">Logout</a></li>
                </ul>
            </div>
        </div>
    </header>>
    <!-- HEADER -->
    <!-- form to search -->
    <div class="one-col"><div class="center-text">
    <div class="title"><h2>Search Staff</h2></div></div></div>
    <form id="form2" action="SearchStaff_Action.aspx">
        <div class="container">
     <div class="one-col">
          <div class="center-text">
         
                      <label for="Search">
                            <strong>First Name: </strong>
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
        
    <form id="form1" runat="server" action="SearchStaff_Action2.aspx">
       
   <%      
        //variables to store data about the book
            string user_id = "";
            string firstName = "";
            string surname = "";
            string email = "";
            string password = "";
            string dateOfBirth = "";
            string fk1_userType_id = "";
            Int32 Index = 0;
            //connection to the database
            Class_Library.clsDataConnection DB = new Class_Library.clsDataConnection();
            //execute procedure displaying all book copies
            DB.Execute("sproc_tblUser_AllStaffs");
            //start of table in which we display the results
            Response.Write("<table border=1 cellpadding=4><tr>");
            Response.Write("<th>user_id</th>");
            Response.Write("<th>firstName</th>");
            Response.Write("<th>surname</th>");
            Response.Write("<th>email</th>");
            Response.Write("<th>password</th>");
            Response.Write("<th>dateOfBirth</th>");
            Response.Write("<th>fk1_userType_id</th>");
            Response.Write("<th colspan=2>Delete Staff</td>");
            Response.Write("</tr>");
            //loop to write all found records
       while (Index < DB.Count)
       {
           //start the row of output table
                Response.Write("<tr>");
                //get the film_id
                user_id = Convert.ToString(DB.DataTable.Rows[Index]["user_id"]);
                //get the filmName
                firstName = Convert.ToString(DB.DataTable.Rows[Index]["firstName"]);
                //get the genre
                surname = Convert.ToString(DB.DataTable.Rows[Index]["surname"]);
                //get the duration
                email = Convert.ToString(DB.DataTable.Rows[Index]["email"]);
                //get the ageRated
                password = Convert.ToString(DB.DataTable.Rows[Index]["password"]);
                //get the director
                dateOfBirth = Convert.ToString(DB.DataTable.Rows[Index]["dateOfBirth"]);
                //get the description
                fk1_userType_id = Convert.ToString(DB.DataTable.Rows[Index]["fk1_userType_id"]);
                //write the film_id column
                Response.Write("<td><b>" + user_id + "</b></td>");
                //write the filmName column
                Response.Write("<td><b>" + firstName + "</b></td>");
                //write the genre column
                Response.Write("<td><b>" + surname + "</b></td>");
                //write the duration column
                Response.Write("<td><b>" + email + "</b></td>");
                //write the ageRated column
                Response.Write("<td><b>" + password + "</b></td>");
                //write the director column
                Response.Write("<td><b>" + dateOfBirth + "</b></td>");
                //write the description column
                Response.Write("<td><b>" + fk1_userType_id + "</b></td>");
                //Output the action button
                Response.Write("<td colspan=2><a class='adnotation' href='#'>" + "<button id='" + user_id + " 'type='submit' name='btnDeleteStaff' name='DeleteStaff'value='" + user_id + "'>Delete Staff</button><span>Warning: You are about to delete this Staff.</span></a></td>");

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
