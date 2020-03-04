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
    <!-- results of update -->
        <div class="container">
        <div class="col-one">
        <div class="center-text">
        <div class="tables">
    <form id="Form1" runat="server">
        <%
            //get the value from the form
            string query_user_id = Request.Form["txuser_id"];
            //get the value from the form
            string query_firstName = Request.Form["txtfirstName"];
            //get the value from the form
            string query_surname = Request.Form["txtsurname"];
            //get the value from the form
            string query_email = Request.Form["txtemail"];
            //get the value from the form
            string query_password = Request.Form["txtPassword"];
            //get the value from the form
            string query_dateOfBirth = Request.Form["txtdateOfBirth"];



            //Declare primary key
            string user_id = "";
            //declare variable
            string firstName = "";
            //declare variable
            string surname = "";
            //declare variable
            string email = "";
            //declare variable
            string dateOfBirth = "";


            //connect to the database
            clsDataConnection DB = new clsDataConnection();
            //send to the stored procedure
            DB.AddParameter("@query_user_id", query_user_id);
            //send to the stored procedure
            DB.AddParameter("@query_firstName", query_firstName);
            //send to the stored procedure
            DB.AddParameter("@query_surname", query_surname);
            //send to the stored procedure
            DB.AddParameter("@query_email", query_email);
            //send to the stored procedure
            DB.AddParameter("@query_dateOfBirth", query_dateOfBirth);
            if (query_password != "")
            {
                //send the password to the stored procedure
                DB.AddParameter("@query_password", query_password);
                //execute the stored procedure
                 DB.Execute("sproc_tblUser_Update");
            }
            else { 
            //execute the stored procedure
            DB.Execute("sproc_tblUser_Update_No_Password");

                }
            //reset the connection
            DB = new clsDataConnection();
            //send the primary key
            DB.AddParameter("@query_user_id", query_user_id);
            //execute the stored procedure
            DB.Execute("sproc_FilterBy_UserID");
            //if one record is found
            if (DB.Count == 1)
            {

                //get 
                user_id = Convert.ToString(DB.DataTable.Rows[0]["user_id"]);
                //get 
                firstName = Convert.ToString(DB.DataTable.Rows[0]["firstName"]);
                surname = Convert.ToString(DB.DataTable.Rows[0]["surname"]);
                //get 
                email = Convert.ToString(DB.DataTable.Rows[0]["email"]);
                //get 
                dateOfBirth = Convert.ToString(DB.DataTable.Rows[0]["dateOfBirth"]);

            }

              //Redirect
                Response.Redirect("EditDetails_Admin.aspx");
             %>
        
 
         <a href="MainMenu.aspx" type="button" class="button button-dark" id="MainMenu">Back </a><br />
    </form>
            
        </div></div></div></div>
    </body>
</html>
