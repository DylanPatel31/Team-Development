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
        
    
    <%
        //get the value from the delete button
        string delete = Request.Form["btnDeleteFilm"];
        //connect to the db
        clsDataConnection DB = new clsDataConnection();
        //check delete value
        if (delete != null)
        {
            //send the isbn number to the delete procedue
            DB.AddParameter("@delete", delete);
            //execute procedure deleting the book and all associated copies
            DB.Execute("sproc_tblFilm_Delete");
            Response.Redirect("SearchFilm.aspx");
        }
        else
        {
            //if delete is null
            Response.Redirect("SearchFilm.aspx");
        }
       %>
       
                
            
 
</div></div>
    
        </div>  
    
        </div>     
</body>
</html>
     
