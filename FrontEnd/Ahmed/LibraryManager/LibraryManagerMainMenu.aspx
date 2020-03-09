<%@ Page Language="C#" %>

<!DOCTYPE html>


<script runat="server">

    protected void btnViewReservedBook_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("ReservationByManager.aspx");
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
        Response.Redirect("IssueBookManager.aspx");
    }

    protected void btnSuspendBorrower_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("SuspendUser.aspx");
    }

    protected void btnRemoveReservation_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("ReservationByManager.aspx");
    }

    protected void btnRegisterReturns_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("ReturnsRegisterByManager.aspx");
    }

    protected void btnViewFines_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("FinesManager.aspx");
    }

    protected void btnPayFine_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("FinesManager.aspx");
    }

    protected void btnViewMyDetails_Click(object sender, EventArgs e)
    {
        //all done so redirect back to the main page
        Response.Redirect("PersonalInfo.aspx");
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
                    
                    <li><a href="LibraryManagerMainMenu.aspx">Dashboard</a></li>
                    <li><a href="../HomePage.html">Sign Out</a></li>
                </ul>
            </div>
        </div>



    </header>
    <!-- HEADER -->

    <!-- Menu Buttons-->
    <section class="LibraryManagerMenu">
        <div class="container">
            <h2 class="center-text">
                <asp:Button ID="btnViewMyDetails" runat="server" BackColor="White" Font-Size="Large" style="z-index: 1; left: 928px; top: 95px; position: absolute; height: 34px; width: 285px" Text="View MyDetails" OnClick="btnViewMyDetails_Click" />
                Library Manager Menu</h2>
                             <asp:Button ID="btnAddBook" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 252px; top: 247px; position: absolute; height: 66px; width: 302px; right: 1045px" Text="Add Book" BackColor="#FFFF99" OnClick="btnAddBook_Click" />
                </div>
             
    </section>
    <!-- FOOTER -->
    <footer class="site-footer">
        <div class="container">
           

        </div>
    </footer>
    <!-- FOOTER -->
         <asp:Button ID="btnViewUsers" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 906px; top: 330px; position: absolute; height: 67px; width: 302px" Text="View Borrowers" BackColor="#33CCCC" OnClick="btnViewUsers_Click" />
        <asp:Button ID="btnAddCopy" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 908px; top: 168px; position: absolute; height: 67px; width: 302px" Text="Add Copy" BackColor="#00FF99" OnClick="btnAddCopy_Click" />
        <asp:Button ID="btnViewReservedBook" runat="server" Font-Bold="True" Font-Size="Larger" OnClick="btnViewReservedBook_Click" style="z-index: 1; left: 252px; top: 407px; position: absolute; height: 67px; width: 302px" Text="Reserved Books" BackColor="#FF9933" />
        <asp:Button ID="btnSearchCopy" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 250px; top: 643px; position: absolute; height: 67px; width: 302px; " Text="Search Copy" BackColor="#9999FF" OnClick="btnSearchCopy_Click" />
        <asp:Button ID="btnSearchBook" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 254px; top: 170px; position: absolute; height: 66px; width: 302px" Text="Search Book" BackColor="#CCFFFF" OnClick="btnSearchBook_Click" />
        <asp:Button ID="btnRegisterReturns" runat="server" BackColor="#669999" Font-Bold="True" Font-Size="Larger" ForeColor="Black" style="z-index: 1; left: 249px; top: 567px; position: absolute; height: 65px; width: 302px" Text="Register Returns" OnClick="btnRegisterReturns_Click" />
        <asp:Button ID="btnIssueBook" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 251px; top: 326px; position: absolute; height: 67px; width: 302px" Text="Issue Book" BackColor="#33CCFF" OnClick="btnIssueBook_Click" />
        <asp:Button ID="btnRemoveReservation" runat="server" BackColor="#BC4374" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 249px; top: 487px; position: absolute; height: 67px; width: 303px; bottom: 225px;" Text="Remove Reservation" OnClick="btnRemoveReservation_Click" />
        <asp:Button ID="txtRegisterANewUser" runat="server" style="z-index: 1; left: 907px; top: 252px; position: absolute; height: 65px; width: 303px" Text="Register A New User" Font-Bold="True" Font-Size="Larger" OnClick="txtRegisterANewUser_Click" BackColor="Yellow" />
        <asp:Button ID="btnViewFines" runat="server" BackColor="#34CB5E" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 905px; top: 487px; position: absolute; height: 64px; width: 302px" Text="View Fines" OnClick="btnViewFines_Click" />
        <asp:Button ID="btnPayFine" runat="server" BackColor="#3366FF" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 906px; top: 561px; position: absolute; height: 64px; width: 303px" Text="Pay Fine" OnClick="btnPayFine_Click" />
        <asp:Button ID="btnSuspendBorrower" runat="server" BackColor="#A259A6" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 904px; top: 410px; position: absolute; height: 63px; width: 303px" Text="Suspend Borrower" OnClick="btnSuspendBorrower_Click" />
        <asp:Button ID="btnReports" runat="server" BackColor="#CC9900" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 907px; top: 637px; position: absolute; height: 63px; width: 303px" Text="Reports" />
    </form>
</body>
</html>