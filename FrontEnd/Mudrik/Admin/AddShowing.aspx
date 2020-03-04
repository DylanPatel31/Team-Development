<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddShowing.aspx.cs" Inherits="FrontEnd.Mudrik.Admin.AddShowing" %>

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
    <!-- Form-->
    <section class="showing_details">
        <div class="container">
            <h2 class="center-text">Add New Showing</h2>
            <div class="col-one">
                <div class="center-text">
                    <form method="post" action="AddShowing2.aspx" id="form1">
                        <label for="Screening ID">
                            <strong>Screening ID: </strong>
                        </label>
                        <input type="text" name="txtscreening_id" id="screening_id" placeholder="Enter Screening ID" />

                        <br /><br />


                         <label for="Film Name">
                            <strong>Film Name: </strong>
                        </label>
                        <input type="text" name="txtfilmName" id="filmName" placeholder="Enter Film Name" />

                        <br /><br />

                        <label for="Theater No">
                            <strong>Theater No: </strong>
                        </label>
                        <input type="text" name="txttheaterNo" id="theaterNo" placeholder="Enter Int32" />

                        <br /><br />


                         <label for="Theater Type">
                            <strong>Theater Type: </strong>
                        </label>
                        <input type="text" name="txttheaterType" id="theaterType" placeholder="Enter Theater Type " />

                        <br /><br />


                        <label for="Start Time">
                            <strong>Start Time: </strong>
                        </label>
                        <input type="text" name="txtstartTime" id="startTime" placeholder="Enter Int32" /> <br />
                        <button type="submit" class="button button-dark" id="Book" value="Book">Add Film</button><br />
                    </form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
