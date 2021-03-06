﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddFilm2.aspx.cs" Inherits="FrontEnd.Mudrik.Staff.AddFilm2" %>

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
            string genre = Request.Form["txtgenre"];
            //get the attribute value from the the form
            string duration = Request.Form["txtduration"];
            //get the attribute value from the the form
            string ageRated = Request.Form["txtageRated"];
            //get the attribute value from the the form
            string director = Request.Form["txtdirector"];
            //get the attribute value from the the form
            string description = Request.Form["txtdescription"];
            //get the attribute value from the the form
            string fk1_filmCast_id = Request.Form["txtfk1_filmCast_id"];
            //connect to the database
            clsDataConnection DB = new clsDataConnection();
            //add parameter to the sproc
            //send the data to the store procedure
            DB.AddParameter("@filmName", filmName);
            DB.AddParameter("@genre", genre);
            DB.AddParameter("@duration", duration);
            DB.AddParameter("@ageRated", ageRated);
            DB.AddParameter("@director", director);
            DB.AddParameter("@description", description);
            DB.AddParameter("@fk1_filmCast_id", fk1_filmCast_id);
            //exec the sproc
            DB.Execute("sproc_tblFilm_AdminAddFilm");
            Response.Redirect("MainMenu.aspx");
             %>
    </div>
    </form>
</body>
</html>
