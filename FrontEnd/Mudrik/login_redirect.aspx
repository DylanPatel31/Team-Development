<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Redirecting to menu</title>
</head>
<body>

     <%
                 //Declare variables for user login, password and status
                 string UserLogin = Request["txtUser_id"];
                 string UserPassword = Request["txtPassword"];
                 string LoggedUserID = Request["txtUser_id"];
                 string Type = "";


                 //Count variable to chech if login and password were correct
                 Int32 RecordCount;

                 //Connect to the database
                 clsDataConnection DB = new clsDataConnection();
                 //Add parameters for login (USER ID) and password
                 DB.AddParameter("@User_id", UserLogin);
                 DB.AddParameter("@Password", UserPassword);
                 //Execute stored procedure for login
                 DB.Execute("sproc_tblUser_Login");
                 //Count matching records. If 0 - login and / or password were wrong, if 1 - loggin and password were correct
                 RecordCount = DB.Count;
                 //Check user status if entered details were correct
                 if (RecordCount == 1)
                 {

                     //if user is suspended redirect to suspended page
                     Type = Convert.ToString(DB.DataTable.Rows[0]["user_type"]);
                   
                     if (Type == "Customer")
                     {
                         Session["loggedUserID"] = LoggedUserID;
                         Response.Redirect("Users/UserMenu.aspx");
                     }

                     
                     else if (Type == "Admin")
                     {
                         Session["loggedUserIDManager"] = LoggedUserID;
                         Response.Redirect("Admin/MainMenu.aspx");
                     }

                     else if (Type == "Staff")
                     {
                         Session["loggedUserIDStaff"] = LoggedUserID;
                         Response.Redirect("Staff/StaffMenu.aspx");
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