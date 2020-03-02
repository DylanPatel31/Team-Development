<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCustomer.aspx.cs" Inherits="FrontEnd.Mudrik.Admin.AddCustomer" %>

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
    <!-- Withdraw Book form-->
    <section class="customer_details">
        <div class="container">
            <h2 class="center-text">Add New Customer</h2>
            <div class="col-one">
                <div class="center-text">
                    <form method="post" action="AddCustomer2.aspx" id="form1">
                        <label for="Booking ID">
                            <strong>Customer ID: </strong>
                        </label>
                        <input type="text" name="txtuser_id" id="user_id" placeholder="Enter Customer ID" />

                        <br /><br />


                         <label for="First Name">
                            <strong>First Name: </strong>
                        </label>
                        <input type="text" name="txtfirstName" id="firstName" placeholder="Enter First Name" />

                        <br /><br />

                        <label for="Surname">
                            <strong>Surname: </strong>
                        </label>
                        <input type="text" name="txtsurname" id="surname" placeholder="Enter Surname" />

                        <br /><br />


                         <label for="Email">
                            <strong>Email: </strong>
                        </label>
                        <input type="text" name="txtemail" id="email" placeholder="Enter Email" />

                        <br /><br />


                        <label for="Password">
                            <strong>Password: </strong>
                        </label>
                        <input type="text" name="txtpassword" id="password" placeholder="Enter Password" />

                        <br /><br />



                        <label for="User Type ID">
                            <strong> User Type ID. </strong>
                        </label>
                        <input type="text" name="txtfk1_userType_id" id="fk1_userType_id" placeholder="Enter 'U2' Here."/><br />
                        <button type="submit" class="button button-dark" id="Book" value="Book">Add Customer</button><br />
                    </form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
