<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void btnViewReservedBook_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("../Borrower/Calendar.html");
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSearchBook_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("SearchBookByBorrower.aspx");
    }

    protected void btnAddBook_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("BookDisplay.aspx");
    }

    protected void btnViewUsers_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("BorrowerDisplay.aspx");
    }

    protected void txtRegisterANewUser_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("BorrowerFines.aspx");
    }

    protected void btnViewLoans_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("BorrowerLoans.aspx");
    }

    protected void btnLibraryNews_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("../Borrower/LibraryNews.html");
    }

    protected void btnLibraryHours_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("../Borrower/Opening Hours.html");
    }

    protected void btnUpdateMydetails_Click(object sender, EventArgs e)
    {
         //all done so redirect back to the main page
        Response.Redirect("PersonalInfoBorrower.aspx");
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="utf-8">
    <title>LIBRARY MANAGER MAIN MENU</title>
    <link rel="stylesheet" href="../Style Sheikhz Library/StyleSheet.css"/>
  


</head>
<body>
    <form id="form1" runat="server">
   <!-- HEADER -->

    <header class="top">
        <div class="container">
            <div class="logo">
                <img src="../imgfolder/SHEIKHZ LIBRARY 1.png" alt="SHEIKHZ LIBRARY1" height="80" width="150" />
                <a href="index.html">SHEIKHZ LIBRARY</a>
            </div>
            <div class="main-menu">
                <ul>
                    
                    <li><a href="BorrowerMainMenu.aspx">Dashboard</a></li>
                    <li><a href="../HomePage.html">Sign Out</a></li>
                </ul>
            </div>
        </div>



    </header>
    <!-- HEADER -->

    <!-- Menu Buttons-->
    <section class="BorrowerMainMenu">
        <div class="container">
            <h2 class="center-text">Borrower Main Menu</h2>
                </div>
             
    </section>
    <!-- FOOTER -->
    <footer class="site-footer">
        <div class="container">
           

        </div>
    </footer>
    <!-- FOOTER -->
        <asp:Button ID="btnEvents" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 1070px; top: 460px; position: absolute; height: 66px; width: 302px" Text="Events" BackColor="#33CCCC" OnClick="btnViewUsers_Click" />
        <asp:Button ID="btnCalendar" runat="server" Font-Bold="True" Font-Size="Larger" OnClick="btnViewReservedBook_Click" style="z-index: 1; left: 1073px; top: 580px; position: absolute; height: 67px; width: 302px" Text="Calendar" BackColor="#FF9933" />
        <asp:Button ID="btnSearchBook" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 273px; top: 233px; position: absolute; height: 66px; width: 302px" Text="Search Book" BackColor="#CCFFFF" OnClick="btnSearchBook_Click" />
        <asp:Button ID="btnViewLoans" runat="server" BackColor="#BC4374" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 267px; top: 470px; position: absolute; height: 67px; width: 303px; right: 987px;" Text="View Loans" OnClick="btnViewLoans_Click" />
        <asp:Button ID="btnCheckFines" runat="server" style="z-index: 1; left: 270px; top: 355px; position: absolute; height: 65px; width: 303px" Text="View Fines" Font-Bold="True" Font-Size="Larger" OnClick="txtRegisterANewUser_Click" BackColor="Yellow" />
        <asp:Button ID="btnLibraryNews" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 1069px; top: 223px; position: absolute; height: 67px; width: 302px; bottom: 489px;" Text="Library News" BackColor="#9999FF" OnClick="btnLibraryNews_Click" />
        <p>
            &nbsp;</p>
        <asp:Button ID="btnUpdateMydetails" runat="server" BackColor="#669999" Font-Bold="True" Font-Size="Larger" ForeColor="Black" style="z-index: 1; left: 269px; top: 587px; position: absolute; height: 65px; width: 302px" Text="Update My Details" OnClick="btnUpdateMydetails_Click" />
        <p>
        <asp:Button ID="btnLibraryHours" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 1069px; top: 343px; position: absolute; height: 67px; width: 302px" Text="Library Hours" BackColor="#00FF99" OnClick="btnLibraryHours_Click" />
        </p>
    </form>
</body>
</html>