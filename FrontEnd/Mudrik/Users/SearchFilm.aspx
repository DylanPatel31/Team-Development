<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
<!-- Header -->
    <header class="top">
        <div class="container">
            <div class="logo">
                <a href="index.html">Timeless Films</a>
            </div>
            <div class="main-menu">
                <ul>
                    <li><a href="UserMenu.aspx">Menu</a></li>
                    <li><a href="../index.html">Logout</a></li>
                </ul>
            </div>
        </div>
    </header>>
    <!-- HEADER -->
    <!-- form to search -->
    <div class="one-col"><div class="center-text">
    <div class="title"><h2>Search Film</h2></div></div></div>
    <form id="form2" action="SearchFilm_Action.aspx">
        <div class="container">
     <div class="one-col">
          <div class="center-text">
         
                      <label for="Search">
                            <strong>Film Title: </strong>
                        </label>
                        <input type="text" name="txtSearch" id="txtSearch" />
                        <button type="submit" class="button button-dark" id="submit" value="submit">Search</button>
                            
       </div></div> </div> </form>
    <!-- form to search -->

    <!-- display Films -->
      <div class="container">
          <div class="one-col">
          <div class="tables">
        
        <div class="center-text">
        
    <form id="form1" runat="server" action="SearchFilm_Action2.aspx">
       
   <%      
        //variables to store data about the book
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
            Class_Library.clsDataConnection DB = new Class_Library.clsDataConnection();
            //execute procedure displaying all book copies
            DB.Execute("sproc_tblFilm_AllFilms");
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
            

</body>
</html>