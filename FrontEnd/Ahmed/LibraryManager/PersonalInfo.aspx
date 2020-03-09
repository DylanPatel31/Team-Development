<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta charset="utf-8"/>
   <title>LIBRARY MANAGER MAIN MENU</title>
   <link rel="stylesheet" href="../Style Sheikhz Library/StyleSheet.css"/>
    

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
    <!-- Edit details form-->
    <section class="edit_details">
        <div class="container">
            <h2 class="center-text">Edit Details</h2>
            <form method="post" action="EditPersonalInfo.aspx" id="Form1">
                <div>
                    <%
                        //Declare primary key
                        string BorrowerID = loggedUserIDManager;
                        //declare bor first name
                        string FirstName = "";
                        //declare bor last name 
                        string LastName = "";
                        //Declare a variable to store the address1
                        string Address1 = "";
                        //Declare a variable to store the address2
                        string Address2 = "";
                        //Declare a variable to store the address2
                        string City = "";
                        //Declare a variable to store the address3
                        string PostCode = "";
                        //Declare a variable to store the telephone
                        string TelephoneNo = "";
                        //Declare a variable to store the email
                        string Email = "";


                        //connect to the database
                        clsDataConnection DB = new clsDataConnection();
                        //send the primary key
                        DB.AddParameter("@Query_BorrowerID", BorrowerID);
                        //execute the stored procedure
                        DB.Execute("sproc_BorrowerTable_FilterByBororrowerID");

                        //if one record is found
                        if (DB.Count == 1)
                        {

                            //get address1
                            BorrowerID = Convert.ToString(DB.DataTable.Rows[0]["BorrowerID"]);
                            //get first Name
                            FirstName = Convert.ToString(DB.DataTable.Rows[0]["FirstName"]);
                            //get last name
                            LastName = Convert.ToString(DB.DataTable.Rows[0]["LastName"]);
                            //get address1
                            Address1 = Convert.ToString(DB.DataTable.Rows[0]["Address1"]);
                            //get address2
                            Address2 = Convert.ToString(DB.DataTable.Rows[0]["Address2"]);
                            //get city
                            City = Convert.ToString(DB.DataTable.Rows[0]["City"]);
                            //get postcode
                            PostCode = Convert.ToString(DB.DataTable.Rows[0]["PostCode"]);
                            //get the tel
                            TelephoneNo = Convert.ToString(DB.DataTable.Rows[0]["TelephoneNo"]);
                            //get the email
                            Email = Convert.ToString(DB.DataTable.Rows[0]["Email"]);

                        }


                         %>


                </div>
                <div class="col-half">
                    <div class="center-text">
                        <label for="Address">
                            <strong>Address: </strong>
                        </label><br />
                        <input type="text" name="txtAddress1" id="Address1" value="<% Response.Write(Address1);%> " /><br />
                        <input type="text" name="txtAddress2" id="Address2" value="<% Response.Write(Address2);%> " /><br />
                        <input type="text" name="txtCity" id="City" value="<% Response.Write(City);%>" /><br />
                        <input type="text" name="txtPostCode" id="PostCode" value="<% Response.Write(PostCode);%> " /><br />
                        <label for="Telephone">
                            <strong>Telephone Number: </strong>
                        </label><br />
                        <input type="text" name="txtTelephoneNo" id="Telephone Number" value="<% Response.Write(TelephoneNo);%>" /><br />
                    </div>
                </div>
                <div class="col-half">
                    <div class="center-text">
                        <label for="borrower ID">
                               <strong> Borrower ID</strong>
                        </label><br />
                        <input type="text" name="txtBorID" id="BorrowerID" value="<% Response.Write(BorrowerID);%>" readonly="readonly" /><br />
                        <label for="Email">
                            <strong>Email: </strong>
                        </label><br />
                        <input type="email" name="txtEmail" id="Email" value="<% Response.Write(Email);%>" /><br />
                        <!--   <label for="CurrentPassword">
                       <strong>Current Password: </strong>
                   </label><br />
                   <input type="password" name="CurrentPassword" id="currentPassword" placeholder="Please enter Current Password" /><br />
                    -->
                        <label for="NewPassword">
                            <strong>New Password: </strong>
                        </label><br />
                        <input type="password" name="txtPassword" id="newPassword" placeholder="Please enter New Password" /><br />

                        <!--  <label for="ConfirmPassword">
                       <strong>Confirm Password: </strong>
                   </label><br />
                   <input type="password" name="ConfirmPassword" id="confirmPassword" placeholder="Please Confirm Password" /><br />
                   <br />
                    -->
                    </div>
                </div>
                <div class="one-col">
                    <div class="center-text">
                        <button type="submit" class="button button-dark" id="submit" value="submit">Update Details</button>
                        <br />
                        <p>
                            <a href="ManagerMenu.aspx" type="button" class="button button-dark" id="ManagerMenu">Back </a><br />
                        </p>
                        <label for="Error">  </label>
                    </div>
                    </div>

        </form>

        </div>
    </section>


    <!-- FOOTER -->
   
    <!-- FOOTER -->
    </body>
</html>