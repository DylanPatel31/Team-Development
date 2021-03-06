﻿<%@ Page Language="C#" %>

<!DOCTYPE html>

<script>
    function goBack() {
        window.history.back();
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <title>Search Films</title>
<link rel="stylesheet" href="style/style.css">
   


</head>
<body>

    <!-- My Header goes in this section -->

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
    <!-- My Header goes in this section -->


    <!-- My form to search films goes below -->
    <div class="one-col"><div class="center-text">
    <div class="title"><h2>Search Film</h2></div></div></div>
    <form id="form2" action="SearchFilm_Search.aspx">
        <div class="container">
     <div class="one-col">
          <div class="center-text">
         
                      <label for="Search">
                            <strong>Film Title: </strong>
                        </label>
                        <input type="text" name="txtSearch" id="txtSearch" />
                        <button type="submit" class="button button-dark" id="submit" value="submit">Search</button>
                            
       </div></div> </div> </form>
  
    <!-- My form to search films goes below -->




    <!-- My table to list films goes below -->

      <div class="container">
          <div class="one-col">
          <div class="tables">
        
        <div class="center-text">
        
    <form id="form1" runat="server" action="SearchFilm_Search.aspx">
       
   <%      
       //variables to store data about the film
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
       //execute procedure displaying all film
       DB.Execute("sproc_tblFilm_AllFilms");
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
           //get the 
           film_id = Convert.ToString(DB.DataTable.Rows[Index]["film_id"]);
           //get the 
           filmName = Convert.ToString(DB.DataTable.Rows[Index]["filmName"]);
           //get the 
           genre = Convert.ToString(DB.DataTable.Rows[Index]["genre"]);
           //get the 
           duration = Convert.ToString(DB.DataTable.Rows[Index]["duration"]);
           //get the 
           ageRated = Convert.ToString(DB.DataTable.Rows[Index]["ageRated"]);
           //get the  
           director = Convert.ToString(DB.DataTable.Rows[Index]["director"]);
           //get the  
           description = Convert.ToString(DB.DataTable.Rows[Index]["description"]);
           //get the 
           fk1_filmCast_id = Convert.ToString(DB.DataTable.Rows[Index]["fk1_filmCast_id"]);
           //get the 
           releaseDate = Convert.ToString(DB.DataTable.Rows[Index]["releaseDate"]);
           //write column
           Response.Write("<td><b>" + film_id + "</b></td>");
           //write column
           Response.Write("<td><b>" + filmName + "</b></td>");
           //write column
           Response.Write("<td><b>" + genre + "</b></td>");
           //write column
           Response.Write("<td><b>" + duration + "</b></td>");
           //write column
           Response.Write("<td><b>" + ageRated + "</b></td>");
           //write column
           Response.Write("<td><b>" + director + "</b></td>");
           //write column
           Response.Write("<td><b>" + description + "</b></td>");
            //write column
           Response.Write("<td><b>" + fk1_filmCast_id + "</b></td>");
           //write column
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
       %>
                
            
    </form>
</div></div>
    
        </div>  
    
        </div>    
            
     <!-- My table to list films goes below -->

















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