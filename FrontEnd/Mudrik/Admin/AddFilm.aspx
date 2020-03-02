<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddFilm.aspx.cs" Inherits="FrontEnd.Mudrik.Admin.AddFilm" %>

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
    <section class="film_details">
        <div class="container">
            <h2 class="center-text">Add New Film</h2>
            <div class="col-one">
                <div class="center-text">
                    <form method="post" action="AddFilm2.aspx" id="form1">
                        <label for="Film ID">
                            <strong>Film ID: </strong>
                        </label>
                        <input type="text" name="txtfilm_id" id="film_id" placeholder="Enter Film ID" />

                        <br /><br />


                         <label for="Film Name">
                            <strong>Film Name: </strong>
                        </label>
                        <input type="text" name="txtfilmName" id="filmName" placeholder="Enter Film Name" />

                        <br /><br />

                        <label for="Genre">
                            <strong>Genre: </strong>
                        </label>
                        <input type="text" name="txtgenre" id="genre" placeholder="Enter Genre" />

                        <br /><br />


                         <label for="Duration">
                            <strong>Duration: </strong>
                        </label>
                        <input type="text" name="txtduration" id="duration" placeholder="Enter Int32 " />

                        <br /><br />


                        <label for="Age Rated">
                            <strong>Age Rated: </strong>
                        </label>
                        <input type="text" name="txtageRated" id="ageRated" placeholder="Enter Int32" />

                        <br /><br />


                        <label for="Director">
                            <strong>Director: </strong>
                        </label>
                        <input type="text" name="txtdirector" id="director" placeholder="Enter Director" />

                        <br /><br />


                        <label for="Description">
                            <strong>Description: </strong>
                        </label>
                        <input type="text" name="txtdescription" id="description" placeholder="Enter Description" />

                        <br /><br />



                          <label for="Film Cast ID">
                            <strong>Film Cast ID: </strong>
                        </label>
                        <input type="text" name="txtfk1_filmCast_id" id="fk1_filmCast_id" placeholder="Enter Int32" /> <br />
                        <button type="submit" class="button button-dark" id="Book" value="Book">Add Film</button><br />
                    </form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>