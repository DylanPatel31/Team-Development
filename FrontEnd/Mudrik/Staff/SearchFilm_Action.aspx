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
    <!-- Header -->
    <header class="top">
        <div class="container">
            <div class="logo">
                <a href="index.html">Timeless Films</a>
            </div>
            <div class="main-menu">
                <ul>
                    <li><a href="StaffMenu.aspx">Menu</a></li>
                    <li><a href="../index.html">Logout</a></li>
                </ul>
            </div>
        </div>
    </header>>
    <!-- HEADER -->
    <!-- form to search -->
    <div class="one-col"><div class="center-text">
    <div class="title"><h2>Search Film</h2></div></div></div>
    <form id="form1" action="SearchFilm_Action.aspx">
        <div class="container">
     <div class="one-col">
          <div class="center-text">
         
                      <label for="Search">
                            <strong>Film Name: </strong>
                        </label>
                        <input type="text" name="txtSearch" id="txtSearch" />
                        <button type="submit" class="button button-dark" id="submit" value="submit">Search</button><br/>
              <button type="submit" class="button button-dark" id="displayall" value="displayall" onclick="goBack();">Display All</button><br/>
       </div></div> </div> </form>
    <!-- form to search -->
     <!-- display Films -->
      <div class="container">
          <div class="tables">
        <div class="one-col">
        <div class="center-text">
        
    <form  runat="server" action="SearchFilm_Action2.aspx">
    <%
        //get the search value
        string search = Request["txtSearch"];
        string delete = Request["btnDeleteBook"];
        if (search != null && delete == null)
        {
            //variables to store data about the film
            string film_id = "";
            string filmName = "";
            string genre = "";
            string duration = "";
            string ageRated = "";
            string director = "";
            string description = "";
            string releaseDate = "";
            Int32 Index = 0;
            //connection to the database
            clsDataConnection DB = new clsDataConnection();
            //add parameter
            DB.AddParameter("@search", search);
            //execute procedure displaying all films
            DB.Execute("[sproc_tblFilm_FilterByName]");
            //start of table in which we display the results
            Response.Write("<table border=1 cellpadding=4><tr>");
            Response.Write("<th>film_id</th>");
            Response.Write("<th>filmName</th>");
            Response.Write("<th>genre</th>");
            Response.Write("<th>duration No</th>");
            Response.Write("<th>ageRated</th>");
            Response.Write("<th>director</th>");
            Response.Write("<th>description</th>");
            Response.Write("<th>releaseDate</th>");
            Response.Write("<th colspan=2>Delete Film</td>");
            Response.Write("</tr>");
            //loop to write all found records
            while (Index < DB.Count)
            {
                //start the row of output table
                Response.Write("<tr>");
                //get the film_id
                film_id = Convert.ToString(DB.DataTable.Rows[Index]["film_id"]);
                //get the filmName
                filmName = Convert.ToString(DB.DataTable.Rows[Index]["filmName"]);
                //get the genre
                genre = Convert.ToString(DB.DataTable.Rows[Index]["genre"]);
                //get the duration
                duration = Convert.ToString(DB.DataTable.Rows[Index]["duration"]);
                //get the ageRated
                ageRated = Convert.ToString(DB.DataTable.Rows[Index]["ageRated"]);
                //get the director
                director = Convert.ToString(DB.DataTable.Rows[Index]["director"]);
                //get the description
                description = Convert.ToString(DB.DataTable.Rows[Index]["description"]);
                //get the releaseDate
                releaseDate = Convert.ToString(DB.DataTable.Rows[Index]["releaseDate"]);
                //write the film_id column
                Response.Write("<td><b>" + film_id + "</b></td>");
                //write the filmName column
                Response.Write("<td><b>" + filmName + "</b></td>");
                //write the genre column
                Response.Write("<td><b>" + genre + "</b></td>");
                //write the duration column
                Response.Write("<td><b>" + duration + "</b></td>");
                //write the ageRated column
                Response.Write("<td><b>" + ageRated + "</b></td>");
                //write the director column
                Response.Write("<td><b>" + director + "</b></td>");
                //write the description column
                Response.Write("<td><b>" + description + "</b></td>");
               //write the releaseDate column
                Response.Write("<td><b>" + releaseDate + "</b></td>");
                //Output the action button

 Response.Write("<td colspan=2><a class='adnotation' href='#'>" + "<button id='" + film_id + " 'type='submit' name='btnDeleteFilm' name='DeleteFilm'value='" + film_id + "'>Delete Film</button><span>Warning: You are about to delete this Film.</span></a></td>");
                Response.Write("</td>");
                //point at the next record
                Index++;
                //end the row of output table
                Response.Write("</tr>");
            }
            //end the table
            Response.Write("</table>");
        }
        else if(search == null && delete != null)
        {
            //reset the db connection
            clsDataConnection DB = new clsDataConnection();
            //send the primary key to the delete procedue
            DB.AddParameter("@delete", delete);
            //execute the delete stored procedure
            DB.Execute("sproc_tblFilm_Delete");
            Response.Redirect("SearchFilm.aspx");
        }
       %>
                
            
    </form>
</div></div>
    
        </div>  
    
        </div>    
</body>
</html>
     
