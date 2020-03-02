<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
    <!-- Edit details form-->
    <section class="edit_details">
        <div class="container">
            <h2 class="center-text">Edit Details</h2>
            <form method="post" action="EditDetails_Staff_Script.aspx" id="Form1">
                <div>
                    <%
                        //Declare primary key
                        string user_id = loggedUserIDStaff;
                        //declare bor first name
                        string firstName = "";
                        //declare bor last name 
                        string surname = "";
                        //Declare a variable to store the address1
                        string email = "";
                        //Declare a variable to store the address3
                        string dateOfBirth = "";
                       


                        //connect to the database
                        Class_Library.clsDataConnection DB = new Class_Library.clsDataConnection();
                        //send the primary key
                        DB.AddParameter("@query_user_id", user_id);
                        //execute the stored procedure
                        DB.Execute("sproc_FilterBy_UserID");

                        //if one record is found
                        if (DB.Count == 1)
                        {

                            //get the following details
                            user_id = Convert.ToString(DB.DataTable.Rows[0]["user_id"]);
                            firstName = Convert.ToString(DB.DataTable.Rows[0]["firstName"]);
                            surname = Convert.ToString(DB.DataTable.Rows[0]["surname"]);
                            email = Convert.ToString(DB.DataTable.Rows[0]["email"]);
                            dateOfBirth = Convert.ToString(DB.DataTable.Rows[0]["dateOfBirth"]);
                        }


                         %>


                </div>
                <div class="col-half">
                    <div class="center-text">
                       
                        <label for="user_id">
                               <strong> user_id</strong>
                        </label><br />
                        <input type="text" name="txuser_id" id="user_id" value="<% Response.Write(user_id);%>" readonly="readonly" /><br />

                        <label for="firstName">
                            <strong>firstName: </strong>
                        </label><br />
                        <input type="text" name="txtfirstName" id="firstName" value="<% Response.Write(firstName);%> " /><br />


                        <label for="surname">
                            <strong>surname: </strong>
                        </label><br />
                        <input type="text" name="txtsurname" id="surname" value="<% Response.Write(surname);%>" /><br />

                         <label for="email">
                            <strong>email: </strong>
                        </label><br />
                        <input type="text" name="txtemail" id="email" value="<% Response.Write(email);%>" /><br />

                        <label for="NewPassword">
                            <strong>New Password: </strong>
                        </label><br />
                        <input type="password" name="txtPassword" id="newPassword" placeholder="Please enter New Password" /><br />

                         <label for="dateOfBirth">
                            <strong>dateOfBirth: </strong>
                        </label><br />
                        <input type="text" name="txtdateOfBirth" id="dateOfBirth" value="<% Response.Write(dateOfBirth);%>" /><br />


                        
                    
                    </div>
                </div>
                
                <div class="one-col">
                    <div class="center-text">
                        <button type="submit" class="button button-dark" id="submit" value="submit">Update Details</button>
                        <br />
                        <p>
                            <a href="StaffMenu.aspx" type="button" class="button button-dark" id="StaffMenu">Back </a><br />
                        </p>
                        <label for="Error">  </label>
                    </div>
                    </div>

        </form>

        </div>
    </section>

    </body>
</html>