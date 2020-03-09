<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void btnViewReservedBook_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("ReservationByStaff.aspx");
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSearchBook_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("BookDisplay.aspx");
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
        Response.Redirect("BorrowerDisplay.aspx");
    }

    protected void btnSearchCopy_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("DisplayCopy.aspx");
    }

    protected void btnAddCopy_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("DisplayCopy.aspx");
    }

    protected void btnIssueBook_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("IssueBookStaff.aspx");
    }

    protected void btnRemoveReservation_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("ReservationByStaff.aspx");
    }

    protected void btnRegisterReturns_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("ReturnsRegisterByStaff.aspx");
    }

    protected void btnViewFines_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("FinesStaff.aspx");
    }

    protected void btnPayFine_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("FinesStaff.aspx");
    }

    protected void btnUpdatePersonalDetail_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("PersonalInfoStaff.aspx");
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="utf-8">
    <title>LIBRARY MANAGER MAIN MENU</title>
    <link rel="stylesheet" href="../Style Sheikhz Library/StyleSheet.css"/>
  


    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 122px;
            left: 1088px;
            z-index: 1;
            width: 301px;
            height: 44px;
        }
    </style>
  
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
                    
                    <li><a href="LibraryStaffMainManu.aspx">Dashboard</a></li>
                    <li><a href="../HomePage.html">Sign Out</a></li>
                </ul>
            </div>
        </div>



    </header>
    <!-- HEADER -->

    <!-- Menu Buttons-->
    <section class="LibraryStaffMenu">
        <div class="container">
            <h2 class="center-text">Library Staff Menu<asp:Button ID="btnUpdatePersonalDetail" runat="server" BackColor="#CCCCCC" CssClass="auto-style1" Font-Bold="True" Font-Size="Large" OnClick="btnUpdatePersonalDetail_Click" Text="Update Personal Detail" />
            </h2>
                             <asp:Button ID="btnAddBook" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 112px; top: 324px; position: absolute; height: 66px; width: 302px; right: 1185px" Text="Add Book" BackColor="#FFFF99" OnClick="btnAddBook_Click" />
                </div>
             
    </section>
    <!-- FOOTER -->
    <footer class="site-footer">
        <div class="container">
           

        </div>
    </footer>
    <!-- FOOTER -->
        <asp:Button ID="btnViewUsers" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 1086px; top: 321px; position: absolute; height: 66px; width: 302px" Text="View Borrowers" BackColor="#33CCCC" OnClick="btnViewUsers_Click" />
        <asp:Button ID="btnAddCopy" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 593px; top: 526px; position: absolute; height: 67px; width: 302px" Text="Add Copy" BackColor="#00FF99" OnClick="btnAddCopy_Click" />
        <asp:Button ID="btnViewReservedBook" runat="server" Font-Bold="True" Font-Size="Larger" OnClick="btnViewReservedBook_Click" style="z-index: 1; left: 113px; top: 524px; position: absolute; height: 67px; width: 302px" Text="Reserved Books" BackColor="#FF9933" />
        <asp:Button ID="btnSearchCopy" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 594px; top: 428px; position: absolute; height: 67px; width: 302px; " Text="Search Copy" BackColor="#9999FF" OnClick="btnSearchCopy_Click" />
        <asp:Button ID="btnSearchBook" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 111px; top: 230px; position: absolute; height: 66px; width: 302px" Text="Search Book" BackColor="#CCFFFF" OnClick="btnSearchBook_Click" />
        <asp:Button ID="btnRegisterReturns" runat="server" BackColor="#669999" Font-Bold="True" Font-Size="Larger" ForeColor="Black" style="z-index: 1; left: 594px; top: 331px; position: absolute; height: 65px; width: 302px" Text="Register Returns" OnClick="btnRegisterReturns_Click" />
        <asp:Button ID="btnIssueBook" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 112px; top: 421px; position: absolute; height: 67px; width: 302px" Text="Issue Book" BackColor="#33CCFF" OnClick="btnIssueBook_Click" />
        <asp:Button ID="btnRemoveReservation" runat="server" BackColor="#BC4374" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 594px; top: 230px; position: absolute; height: 67px; width: 303px" Text="Remove Reservation" OnClick="btnRemoveReservation_Click" />
        <asp:Button ID="txtRegisterANewUser" runat="server" style="z-index: 1; left: 1087px; top: 226px; position: absolute; height: 65px; width: 303px" Text="Register A New User" Font-Bold="True" Font-Size="Larger" OnClick="txtRegisterANewUser_Click" BackColor="Yellow" />
        <asp:Button ID="btnViewFines" runat="server" BackColor="#34CB5E" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 1088px; top: 423px; position: absolute; height: 64px; width: 302px" Text="View Fines" OnClick="btnViewFines_Click" />
        <asp:Button ID="btnPayFine" runat="server" BackColor="#3366FF" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 1086px; top: 524px; position: absolute; height: 64px; width: 303px" Text="Pay Fine" OnClick="btnPayFine_Click" />
    </form>
</body>
</html>