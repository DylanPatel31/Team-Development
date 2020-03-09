<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Redirecting to menu</title>
</head>
<body>

     <%
                 //Declare variables for user login, password and status
                 string UserLogin = Request["txtUsername"];
                 string UserPassword = Request["txtPassword"];
                 string LoggedUserID = Request["txtUsername"];
                 string Status = "";
                 string Type = "";


                 //Count variable to chech if login and password were correct
                 Int32 RecordCount;

                 //Connect to the database
                 clsDataConnection DB = new clsDataConnection();
                 //Add parameters for login (USER ID) and password
                 DB.AddParameter("@BorrowerID", UserLogin);
                 DB.AddParameter("@BorrowerPassword", UserPassword);
                 //Execute stored procedure for login
                 DB.Execute("sproc_BorrowerTable_Login");
                 //Count matching records. If 0 - login and / or password were wrong, if 1 - loggin and password were correct
                 RecordCount = DB.Count;
                 //Check user status if entered details were correct
                 if (RecordCount == 1)
                 {

                     //if user is suspended redirect to suspended page
                     Type = Convert.ToString(DB.DataTable.Rows[0]["BorrowerTypeName"]);
                     Status = Convert.ToString(DB.DataTable.Rows[0]["BorrowerStatus"]);

                     if (Status == "Suspended")
                     {
                         Response.Redirect("suspended.html");
                     }
                     else if (Type == "Student" || Type == "Non-student")
                     {
                         Session["loggedUserID"] = LoggedUserID;
                         Response.Redirect("Borrower/BorrowerMainMenu.aspx");
                     }

                     else if (Type == "Staff")
                     {
                         Session["loggedUserIDStaff"] = LoggedUserID;
                         Response.Redirect("LibraryStaff/LibraryStaffMainManu.aspx");
                     }
                     else if (Type == "Manager")
                     {
                         Session["loggedUserIDManager"] = LoggedUserID;
                         Response.Redirect("LibraryManager/LibraryManagerMainMenu.aspx");
                     }
                     else {
                         Response.Redirect("Error.html");
                     }
                 }
                 else {
                     Response.Redirect("Error.html");
                 }

              %>

</body>
</html>