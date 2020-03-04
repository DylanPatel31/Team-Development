<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BookFilm2.aspx.cs" Inherits="FrontEnd.Mudrik.Users.BookFilm2" %>

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
    <title>Customer Menu</title>
    <link rel="stylesheet" href="../style/style.css"/>


    <%

        string loggedUserID= (string)(Session["loggedUserID"]);
        if (loggedUserID == null)
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

            //get attribue value from the form
            string booking_id = Request.Form["txtbooking_id"];
            //get attribue value from the form
            string firstName = Request.Form["txtfirstName"];
            //get attribue value from the form
            string fk1_user_id = Request.Form["txtfk1_user_id"];
            //get attribue value from the form
            string fk2_seat_id = Request.Form["txtfk2_seat_id"];
            //get attribue value from the form
            string fk3_screening_id = Request.Form["txtfk3_screening_id"];
            //get attribue value from the form
            string price = Request.Form["txtprice"];
            //connect to the database
            clsDataConnection DB = new clsDataConnection();
            //add parameter to the sproc
            //send the data to the store procedure
            DB.AddParameter("@booking_id", booking_id);
            DB.AddParameter("@firstName", firstName);
            DB.AddParameter("@fk1_user_id", fk1_user_id);
            DB.AddParameter("@fk2_seat_id", fk2_seat_id);
            DB.AddParameter("@fk3_screening_id", fk3_screening_id);
            DB.AddParameter("@price", price);
            //exec the sproc
            DB.Execute("sproc_tblBooking_AdminBooking");
            Response.Redirect("MainMenu.aspx");
             %>
    </div>
    </form>
</body>
</html>
