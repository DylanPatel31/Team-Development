<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStaff2.aspx.cs" Inherits="FrontEnd.Mudrik.Admin.AddStaff2" %>

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
     <form id="form1" runat="server">
    <div>
        <%

            //get the attribute value from the form
            string user_id = Request.Form["txtuser_id"];
            //get the attribute value from the form
            string firstName = Request.Form["txtfirstName"];
            //get the attribute value from the form
            string surname = Request.Form["txtsurname"];
            //get the attribute value from the form
            string email = Request.Form["txtemail"];
            //get the attribute value from the form
            string password = Request.Form["txtpassword"];
            //get the attribute value from the form
            string fk1_userType_id = Request.Form["txtfk1_userType_id"];
            //connect to the database
            clsDataConnection DB = new clsDataConnection();
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
            Response.Redirect("MainMenu.aspx");
             %>
    </div>
    </form>
</body>
</html>
