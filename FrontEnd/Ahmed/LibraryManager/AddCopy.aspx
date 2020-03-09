<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">






    protected void btnViewReservedBook_Click(object sender, EventArgs e)
    {

    }

    //var to store the PhoneID
    Int32 CopyBarCode;
    protected void Page_Load(object sender, EventArgs e)
    {
        //copy the data from the query string to the text box txtPhoneID
        CopyBarCode = Convert.ToInt32(Session["CopyBarCode"]);
        //if this is not an instruction to add a new record

        if (IsPostBack == false)
        {
            if (CopyBarCode != -1)
            {
                // display the existing data
                DisplayCopies(CopyBarCode);
            }
        }

    }

    void DisplayCopies(Int32 CopyBarCode)
    {
        //create an instance of the phone class
         Class_Library.clsCopyCollection ISBNS = new  Class_Library.clsCopyCollection();
        //find the record we want to display
        ISBNS.ThisBook.Find(CopyBarCode);
        //display the house no
        TextBoxCopyBarCode.Text = ISBNS.ThisBook.CopyBarCode.ToString();
        TextBoxFK_ISBN.Text = ISBNS.ThisBook.FK_ISBN.ToString();
        TextBoxCopyCondition.Text = ISBNS.ThisBook.CopyCondition;
        TextBoxCopyStatus.Text = ISBNS.ThisBook.CopyStatus;
        TextBoxCopyLoanType.Text = ISBNS.ThisBook.CopyLoanType;

    }

    //function for adding new records
    void Add()
    {
        //create an instance of the OrderCollection class
         Class_Library.clsCopyCollection ISBNS = new  Class_Library.clsCopyCollection();
        //validate the data on the web form
        String Error = ISBNS.ThisBook.Valid(TextBoxCopyLoanType.Text, TextBoxCopyCondition.Text, TextBoxCopyStatus.Text, TextBoxFK_ISBN.Text );
        //if the data is OK then add it to the object
        if (Error == "")
        {
            //copy the data from the interface to the object
           
            ISBNS.ThisBook.CopyCondition = TextBoxCopyCondition.Text;
            ISBNS.ThisBook.CopyStatus = TextBoxCopyStatus.Text;
            ISBNS.ThisBook.CopyLoanType = TextBoxCopyLoanType.Text;
            ISBNS.ThisBook.FK_ISBN = Convert.ToInt32(TextBoxFK_ISBN.Text);

            //add the new record
            ISBNS.Add();
            //all done so redirect back to the main page
            Response.Redirect("DisplayCopy.aspx");
        }
        else
        {
            //report an error
            lblError.Text = "There were problems with the data entered " + Error;
        }
    }

    void Update()
    {
        //create an instance of the OrderCollection class
         Class_Library.clsCopyCollection ISBNS = new  Class_Library.clsCopyCollection();
        //validate the data on the web form
        String Error = ISBNS.ThisBook.Valid(TextBoxCopyLoanType.Text, TextBoxCopyCondition.Text, TextBoxCopyStatus.Text, TextBoxFK_ISBN.Text );
        //if the data is OK then add it to the object
        if (Error == "")
        {

            //find the record to update
            ISBNS.ThisBook.Find(CopyBarCode);
            //copy the data from the interface to the object
           
            ISBNS.ThisBook.CopyCondition = TextBoxCopyCondition.Text;
            ISBNS.ThisBook.CopyStatus = TextBoxCopyStatus.Text;
            ISBNS.ThisBook.CopyLoanType = TextBoxCopyLoanType.Text;
            ISBNS.ThisBook.FK_ISBN = Convert.ToInt32(TextBoxFK_ISBN.Text);
            //update the new record
            ISBNS.Update();
            //all done so redirect back to the main page
            Response.Redirect("DisplayCopy.aspx");
        }
        else
        {
            //report an error
            lblError.Text = "There were problems with the data entered " + Error;
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        //redirect back to the main page
        Response.Redirect("DisplayCopy.aspx");

    }

    protected void btnEnter_Click(object sender, EventArgs e)
    {
        if (CopyBarCode == -1)
        {
            //add the new record
            Add();
        }
        else
        {
            //update the record
            Update();
        }
    }


</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="utf-8">
    <title>LIBRARY MANAGER MAIN MENU</title>
    <link rel="stylesheet" href="../Style Sheikhz Library/StyleSheet.css"/>
  


    <style type="text/css">
        .auto-style9 {
            z-index: 1;
            left: 510px;
            top: 253px;
            position: absolute;
            height: 33px;
            width: 173px;
        }
        .auto-style10 {
            z-index: 1;
            left: 315px;
            top: 262px;
            position: absolute;
            width: 174px;
        }
        .auto-style13 {
            z-index: 1;
            left: 310px;
            top: 341px;
            position: absolute;
            width: 173px;
            right: 1060px;
        }
        .auto-style14 {
            z-index: 1;
            left: 507px;
            top: 336px;
            position: absolute;
            height: 33px;
            width: 174px;
        }
        .auto-style15 {
            position: absolute;
            top: 502px;
            left: 311px;
            z-index: 1;
            width: 174px;
            height: 33px;
        }
        .auto-style16 {
            position: absolute;
            top: 504px;
            left: 501px;
            z-index: 1;
            width: 174px;
            height: 34px;
        }
        .auto-style17 {
            position: absolute;
            top: 421px;
            left: 502px;
            z-index: 1;
            width: 174px;
            height: 35px;
        }
        .auto-style18 {
            position: absolute;
            top: 424px;
            left: 310px;
            z-index: 1;
        }
        .auto-style19 {
            z-index: 1;
            left: 511px;
            top: 175px;
            position: absolute;
            height: 33px;
            width: 173px;
        }
    </style>
  


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
            <h2 class="center-text"></h2>
                </div>
             
    </section>
    <!-- FOOTER -->
    <footer class="site-footer">
        <div class="container">
           

        </div>
    </footer>
    <!-- FOOTER -->
        dddddd<asp:Label ID="lblCopyBarCode" runat="server" BorderColor="Black" Font-Bold="True" ForeColor="Black" style="z-index: 1; left: 317px; top: 178px; position: absolute; height: 31px; width: 171px">CopyBarCode</asp:Label>
        <asp:TextBox ID="TextBoxCopyBarCode" runat="server" CssClass="auto-style19" BackColor="White"></asp:TextBox>
        <asp:TextBox ID="TextBoxFK_ISBN" runat="server" CssClass="auto-style9" BackColor="White"></asp:TextBox>
        <asp:TextBox ID="TextBoxCopyLoanType" runat="server" CssClass="auto-style14" BackColor="White"></asp:TextBox>
        <asp:Label ID="lblFK_ISBN" runat="server" Font-Bold="True" ForeColor="Black" Text="ISBN" CssClass="auto-style10"></asp:Label>
        <asp:Label ID="lblCopyLoanType" runat="server" Font-Bold="True" ForeColor="Black" Text="Copy Loan Type" CssClass="auto-style13"></asp:Label>
        <asp:Button ID="btnCancel" runat="server" BackColor="#FF3300" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 1027px; top: 675px; position: absolute; height: 40px; width: 133px" Text="Cancel" OnClick="btnCancel_Click" />
        <asp:Button ID="btnEnter" runat="server" BackColor="#CCFFFF" Font-Bold="True" Font-Size="Larger" OnClick="btnEnter_Click" style="z-index: 1; left: 850px; top: 678px; position: absolute; height: 40px; width: 133px; right: 790px" Text="Enter" />
        <asp:Label ID="lblError" runat="server" ForeColor="Black" style="z-index: 1; left: 1337px; top: 623px; position: absolute; width: 128px" Text="lblError"></asp:Label>
        <asp:Label ID="lblCopyStatus" runat="server" CssClass="auto-style15" Font-Bold="True" ForeColor="Black" Text="Copy Status"></asp:Label>
        <asp:TextBox ID="TextBoxCopyStatus" runat="server" CssClass="auto-style16" BackColor="White"></asp:TextBox>
        <asp:TextBox ID="TextBoxCopyCondition" runat="server" CssClass="auto-style17" BackColor="White"></asp:TextBox>
        <asp:Label ID="lblCopyCondition" runat="server" CssClass="auto-style18" Font-Bold="True" ForeColor="Black" Text="Copy Condition"></asp:Label>
    </form>
</body>
</html>