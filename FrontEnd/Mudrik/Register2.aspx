<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register2.aspx.cs" Inherits="FrontEnd.Mudrik.Register2" %>

<!DOCTYPE html>
<script runat="server">




</script>
<script>
    function goBack() {
        window.history.back();
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <title>Main Menu</title>
    <link rel="stylesheet" href="../style/style.css"/>


    <%

       

     %>
</head>
<body>
     <form id="form1" runat="server">
    <div>
        <%

            //get the borrower id from the the form
            string user_id = Request.Form["txtuser_id"];
            //get the borrower id from the the form
            string firstName = Request.Form["txtfirstName"];
            //get the borrower id from the the form
            string surname = Request.Form["txtsurname"];
            //get the copy No from the form
            string email = Request.Form["txtemail"];
            //get the copy No from the form
            string password = Request.Form["txtpassword"];
            //get the copy No from the form
            string fk1_userType_id = Request.Form["txtfk1_userType_id"];
            //connect to the database
            Class_Library.clsDataConnection DB = new Class_Library.clsDataConnection();
            //add parameter to the sproc
            //send the data to the store procedure
            DB.AddParameter("@user_id", user_id);
            DB.AddParameter("@firstName", firstName);
            DB.AddParameter("@surname", surname);
            DB.AddParameter("@email", email);
            DB.AddParameter("@password", password);
            DB.AddParameter("@fk1_userType_id", fk1_userType_id);
            //exec the sproc
            DB.Execute("sproc_tblUser_AdminAddCustomer");
            Response.Redirect("index.html");
             %>
    </div>
    </form>
</body>
</html>
