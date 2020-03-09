<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">




</script>
<script>
    function goBack() {
        window.history.back();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta charset="utf-8"/>
   <title>LIBRARY MANAGER MAIN MENU</title>
   <link rel="stylesheet" href="../Style Sheikhz Library/StyleSheet.css"/>
  

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
                <img src="../imgfolder/SHEIKHZ LIBRARY 1.png" alt="SHEIKHZ LIBRARY1" height="80" width="150" />
                <a href="index.html">SHEIKHZ LIBRARY</a>
            </div>
            <div class="main-menu">
                <ul>
                    
                    <li><a href="LibraryStaffMainManu.aspx">Dashboard</a></li>
                    <li><a href="../HomePage.html">Sign Out</a></li>
                </ul>
            </div>
        </div>
    </header>
    <!-- HEADER -->
    <!-- results of update -->
        <div class="container">
        <div class="col-one">
        <div class="center-text">
        <div class="tables">
    <form id="Form1" runat="server">
        <%
            //get the primary key
            string Query_BorrowerID = Request.Form["txtBorrowerID"];
            //get the Address
            string Query_Address1 = Request.Form["txtAddress1"];
            //get the Address2
            string Query_Address2 = Request.Form["txtAddress2"];
            //get the city
            string Query_City = Request.Form["txtCity"];
            //get the postcode
            string Query_PostCode = Request.Form["txtPostCode"];
            //get the Telephone
            string Query_TelephoneNo = Request.Form["txtTelephoneNo"];
            //get the Email
            string Query_Email = Request.Form["txtEmail"];
            //get the Password
            string Query_BorrowerPassword = Request.Form["txtPassword"];


                        //Declare primary key
                        string BorrowerID = "";
                        //declare bor first name
                        string FirstName = "";
                        //declare bor last name 
                        string LastName = "";
                        //Declare a variable to store the address1
                        string Address1 = "";
                        //Declare a variable to store the address2
                        string Address2 = "";
                        //Declare a variable to store the address2
                        string City = "";
                        //Declare a variable to store the address3
                        string PostCode = "";
                        //Declare a variable to store the telephone
                        string TelephoneNo = "";
                        //Declare a variable to store the email
                        string Email = "";


            //connect to the database
            clsDataConnection DB = new clsDataConnection();
            //send the address1 to the stored procedure
            DB.AddParameter("@Query_Address1", Query_Address1);
            //send the address2 to the stored procedure
            DB.AddParameter("@Query_Address2", Query_Address2);
            //send the address3 to the stored procedure
            DB.AddParameter("@Query_City", Query_City);
             //send the address3 to the stored procedure
            DB.AddParameter("@Query_PostCode", Query_PostCode);
            //send the tel to the stored procedure
            DB.AddParameter("@Query_TelephoneNo", Query_TelephoneNo);
            //send the email to the stored procedure
            DB.AddParameter("@Query_Email", Query_Email);
            //send the borrower id to the stored procedure
            DB.AddParameter("@Query_BorrowerID", Query_BorrowerID);
            if (Query_BorrowerPassword != "")
            {
                //send the password to the stored procedure
                DB.AddParameter("@Query_BorrowerPassword", Query_BorrowerPassword);
                //execute the stored procedure
                 DB.Execute("sproc_BorrowerTable_Update_BorrowerPersonalDetails");
            }
            else { 
            //execute the stored procedure
            DB.Execute("sproc_BorrowerTable_Update_BorrowerPassword");

                }
            //reset the connection
            DB = new clsDataConnection();
            //send the primary key
            DB.AddParameter("@Query_BorrowerID", Query_BorrowerID);
            //execute the stored procedure
            DB.Execute("sproc_BorrowerTable_FilterByBororrowerID");
            //if one record is found
            if (DB.Count == 1)
            {

                            //get address1
                            BorrowerID = Convert.ToString(DB.DataTable.Rows[0]["BorrowerID"]);
                            //get first Name
                            FirstName = Convert.ToString(DB.DataTable.Rows[0]["FirstName"]);
                            //get last name
                            LastName = Convert.ToString(DB.DataTable.Rows[0]["LastName"]);
                            //get address1
                            Address1 = Convert.ToString(DB.DataTable.Rows[0]["Address1"]);
                            //get address2
                            Address2 = Convert.ToString(DB.DataTable.Rows[0]["Address2"]);
                            //get city
                            City = Convert.ToString(DB.DataTable.Rows[0]["City"]);
                            //get postcode
                            PostCode = Convert.ToString(DB.DataTable.Rows[0]["PostCode"]);
                            //get the tel
                            TelephoneNo = Convert.ToString(DB.DataTable.Rows[0]["TelephoneNo"]);
                            //get the email
                            Email = Convert.ToString(DB.DataTable.Rows[0]["Email"]);
              
            }

              //Redirect
                Response.Redirect("EditPersonalInfo.aspx");
             %>
        
 
         <a href="ManagerMenu.aspx" type="button" class="button button-dark" id="ManagerMenu">Back </a><br />
    </form>
            
        </div></div></div></div>
    <!-- FOOTER -->
    
    <!-- FOOTER -->
    </body>
</html>
