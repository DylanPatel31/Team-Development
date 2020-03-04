<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddShowing2.aspx.cs" Inherits="FrontEnd.Mudrik.Staff.AddShowing2" %>

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
     <form id="form1" runat="server">
    <div>
        <%

            //get the attribute value from the the form
            string filmName = Request.Form["txtfilmName"];
            //get the attribute value from the the form
            string theaterNo = Request.Form["txttheaterNo"];
            //get the attribute value from the the form
            string theaterType = Request.Form["txttheaterType"];
            //get the attribute value from the the form
            string startTime = Request.Form["txtstartTime"];
            //connect to the database
            clsDataConnection DB = new clsDataConnection();
            //add parameter to the sproc
            //send the data to the store procedure
            DB.AddParameter("@filmName", filmName);
            DB.AddParameter("@theaterNo", theaterNo);
            DB.AddParameter("@theaterType", theaterType);
            DB.AddParameter("@startTime", startTime);
            //exec the sproc
            DB.Execute("sproc_tblScreening_AdminAddScreening");
            Response.Redirect("MainMenu.aspx");
             %>
    </div>
    </form>
</body>
</html>
