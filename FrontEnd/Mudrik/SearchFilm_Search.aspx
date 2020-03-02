<%@ Page Language="C#" %>

<!DOCTYPE html>

<script>
    function goBack() {
        window.history.back();
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <title>Search Film</title>
    <link rel="stylesheet" href="../style/style.css"/>
   


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
                    <li><a href="index.html">Home</a></li>
                    <li><a href="LoginPage.html">Login</a></li>
                    <li><a href="AboutUs.html">About Us</a></li>
                </ul>
            </div>
        </div>
    </header>>
    <!-- HEADER -->


    <!-- form to search -->
    <div class="one-col"><div class="center-text">
    <div class="title"><h2>Search Film</h2></div></div></div>
    <form id="form2" action="SearchFilm_Search.aspx">
        <div class="container">
     <div class="one-col">
          <div class="center-text">
         
                      <label for="Search">
                            <strong>Film Name: </strong>
                        </label>
                        <input type="text" name="txtSearch" id="txtSearch" />
                        <button type="submit" class="button button-dark" id="submit" value="submit">Search</button>
                            
       </div></div> </div> </form>
    <!-- form to search -->
    <div class="container">
          <div class="tables">
        <div class="one-col">
        <div class="center-text">
    <form id="form1">
        <%
            //get the search value
            string search = Request["txtSearch"];
            string reserve = Request["btnBookFilm"];
            if (search != null && reserve == null)
            {
                //variables to store data about the book
                string film_id = "";
                string filmName = "";
                string genre = "";
                string duration = "";
                string ageRated = "";
                string director = "";
                string description = "";
                string fk1_filmCast_id = "";
                string releaseDate = "";
                Int32 Index = 0;
                //connection to the database
                clsDataConnection DB = new clsDataConnection();
                //add parameter
                DB.AddParameter("@search", search);
                //execute procedure displaying only the searched film
                DB.Execute("sproc_tblFilm_FilterByName");
                //start of table in which we display the results
                Response.Write("<table border=1 cellpadding=4><tr>");
                Response.Write("<td>Film ID</td>");
                Response.Write("<td>Film Name</td>");
                Response.Write("<td>Genre</td>");
                Response.Write("<td>Duration</td>");
                Response.Write("<td>Age Rated</td>");
                Response.Write("<td>Director</td>");
                Response.Write("<td>Description No</td>");
                Response.Write("<td>FilmCast ID</td>");
                Response.Write("<td>releaseDate</td>");
                Response.Write("<td colspan=2>Book Film</td>");
                Response.Write("</tr>");
                //loop to write all found records
                while (Index < DB.Count)
                {
                    //start the row of output table
                    Response.Write("<tr>");
                    //get the menu code
                    film_id = Convert.ToString(DB.DataTable.Rows[Index]["film_id"]);
                    //get the name
                    filmName = Convert.ToString(DB.DataTable.Rows[Index]["filmName"]);
                    //get the author
                    genre = Convert.ToString(DB.DataTable.Rows[Index]["genre"]);
                    //get the publisher
                    duration = Convert.ToString(DB.DataTable.Rows[Index]["duration"]);
                    //get the shelf no
                    ageRated = Convert.ToString(DB.DataTable.Rows[Index]["ageRated"]);
                    //get the pub yr
                    director = Convert.ToString(DB.DataTable.Rows[Index]["director"]);
                    //get the edition no
                    description = Convert.ToString(DB.DataTable.Rows[Index]["description"]);
                    //get the condition
                    fk1_filmCast_id = Convert.ToString(DB.DataTable.Rows[Index]["fk1_filmCast_id"]);
                    //get the status
                    releaseDate = Convert.ToString(DB.DataTable.Rows[Index]["releaseDate"]);
                    //write the ISBN column
                    Response.Write("<td><b>" + film_id + "</b></td>");
                    //write the title column
                    Response.Write("<td><b>" + filmName + "</b></td>");
                    //write the author column
                    Response.Write("<td><b>" + genre + "</b></td>");
                    //write the publisher column
                    Response.Write("<td><b>" + duration + "</b></td>");
                    //write the author shelf no
                    Response.Write("<td><b>" + ageRated + "</b></td>");
                    //write the pub yr
                    Response.Write("<td><b>" + director + "</b></td>");
                    //write the edition no column
                    Response.Write("<td><b>" + description + "</b></td>");
                    //write the pub yr
                    Response.Write("<td><b>" + fk1_filmCast_id + "</b></td>");
                    //write the edition no column
                    Response.Write("<td><b>" + releaseDate + "</b></td>");
                    //Output the action button

                   Response.Write("<td colspan=2><a class='adnotation' href='#'>" + "<button id='" + film_id + " 'type='submit' name='btnBookFilm' href='LoginPage.html' name='BookFilm'value=' " + film_id + "'>Book Film</button><span>Please, login to book this Film.</span></a></td>");

                    Response.Write("</td>");
                    //point at the next record
                    Index++;
                    //end the row of output table
                    Response.Write("</tr>");
                }
                //end the table
                Response.Write("</table>");
            }
            else if(search == null && reserve != null)
            {
                Response.Redirect("LoginPage.html");
            }
       %>
             


        </form></div></div></div></div>



























       <!-- Background-Colour changer -->
    <article>
        <time>
            <th width="234" height="128" scope="col">
                <div id="backgroundchange">
                    <select name="select" onChange="if(this.selectedIndex!=0)
document.bgColor=this.options[this.selectedIndex].value">
                        <option value="choose" selected>Change Background Colour : </option>
                        <option value="FFFFFF">White </option>
                        <option value="2c50a2">Dark blue </option>
                        <option value="663399">Purple</option>
                        <option value="f60000">Blood Red</option>
                        <option value="e800f6">Pink</option>
                        <option value="00a5f6">Sky Blue</option>
                        <option value="75ab00">Green</option>
                        <option value="91f600">Grass Green</option>
                        <option value="000000">Black</option>
                        <option value="ffa500">Orange</option>
                        <option value="ff69b4">Light Pink</option>
                        <option value="00c5cd">Turquoise</option>
                        <option value="551a8b">Dark Purple</option>
                        <option value="a020f0">Light Purple</option>
                        <option value="ffdab9">Peach</option>
                    </select>
                </div>
            </th>
        </time>
    </article>
    <!-- Background-Colour changer -->
</body>
</html>
