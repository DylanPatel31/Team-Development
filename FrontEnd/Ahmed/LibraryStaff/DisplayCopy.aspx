<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void btnViewReservedBook_Click(object sender, EventArgs e)
    {

    }

    protected void Page_Load(object sender, EventArgs e)
    {

        //if this is the first time the page is displayed
        if (IsPostBack == false)
        {
            //display all phones
            DisplayCopies("");
        }

    }

    Int32 DisplayCopies(string BookCopyStatus)
    {
        Int32 CopyBarCode;//var to store the primary key
        String CopyStatus; //var to store the Device Name
        String CopyCondition; //var to store the Device Name
        String CopyLoanType; //var to store the Device Namee
        Int32  FK_ISBN; //var to store the Device Name

        ;//create an instance of the phone class
        clsCopyCollection Copy = new clsCopyCollection();
        Copy.FilterbyCopyStatus(BookCopyStatus);
        Int32 RecordCount;//var to store the count of records
        Int32 Index = 0;//var to store the index for the loop
        RecordCount = Copy.Count;// get the count of records
        ListBoxCopy.Items.Clear(); //clear the list box
        while (Index < RecordCount)//while there are records to process
        {
            CopyBarCode = Copy.BookList[Index].CopyBarCode;//get the primary key
            CopyStatus = Copy.BookList[Index].CopyStatus; //get the Device Name
            CopyCondition = Copy.BookList[Index].CopyCondition; //get the Operating System
            CopyLoanType = Copy.BookList[Index].CopyLoanType; //get the Operating System
            FK_ISBN = Copy.BookList[Index].FK_ISBN; //get the Operating System
            //create a new entry for the list box
            ListItem NewEntry = new ListItem(FK_ISBN + ", " + CopyCondition + ", " + CopyStatus+ ", " + CopyLoanType, CopyBarCode.ToString());
            ListBoxCopy.Items.Add(NewEntry);//add the phone to the list
            Index++;//move the index to the next record
        }
        return RecordCount;//return the count of the records found
    }

    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnAddBook_Click(object sender, EventArgs e)
    {
        // sttore -1 into the session object to indicate this is a new record
        Session["CopyBarCode"] = -1;
        //redirect to the data entry page
        Response.Redirect("AddCopy.aspx");
    }

    protected void btnEditBook_Click(object sender, EventArgs e)
    {
        //var to store the primary key value
        Int32 CopyBarCode;
        if (ListBoxCopy.SelectedIndex != -1)
        {
            //get the primary key value from the list box
            CopyBarCode = Convert.ToInt32(ListBoxCopy.SelectedValue);
            //store the data in the sessions object
            Session["CopyBarCode"] = CopyBarCode;
            //redirect to the editing page
            Response.Redirect("AddCopy.aspx");
        }
        else
        {
            //display an error
            lblError.Text = "You must select a Copy off the list first to edit it.";
        }
    }

    protected void btnDeleteBook_Click(object sender, EventArgs e)
    {
        //var to store the primary key value of the record to be deleted
        //var to store the primary key value
        Int32 CopyBarCode;
        if (ListBoxCopy.SelectedIndex != -1)
        {
            //get the primary key value from the list box
            CopyBarCode = Convert.ToInt32(ListBoxCopy.SelectedValue);
            //store the data in the sessions object
            Session["CopyBarCode"] = CopyBarCode;
            //redirect to the Delete page
            Response.Redirect("DeleteCopy.aspx?CopyBarCode=" + CopyBarCode);
        }
        else
        {
            //display an error
            lblError.Text = "You must select a Copy off the list first in order to delete.";
        }
    }

    protected void btnDisplayAllBook_Click(object sender, EventArgs e)
    {

        //display all Books
        DisplayCopies("");
    }

    protected void btnFilterByBookISBN_Click(object sender, EventArgs e)
    {
        //display only Orders mattching the text in the Customer Name text box
        DisplayCopies(TextBoxFilterCopy.Text);
    }

    protected void TextBoxFilter_TextChanged(object sender, EventArgs e)
    {

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="utf-8">
    <title>LIBRARY STAFF MAIN MENU</title>
    <link rel="stylesheet" href="../Style Sheikhz Library/StyleSheet.css"/>
  


    <style type="text/css">
        .auto-style1 {
            right: 561px;
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
            <asp:Label ID="lblError" runat="server" ForeColor="Black" style="z-index: 1; left: 1109px; top: 672px; position: absolute; height: 33px; width: 292px" Text="lblError"></asp:Label>
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
    <section clDisplay book details</h2>
                             
                </div>
             
    </section>
    <!-- FOOTER -->
    <footer class="site-footer">
        <div class="container">
           

        </div>


    </footer>
    <!-- FOOTER -->
        
        <asp:ListBox ID="ListBoxCopy" runat="server" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" style="z-index: 1; left: 46px; top: 165px; position: absolute; height: 374px; width: 990px" Font-Bold="True" Font-Size="X-Large" BackColor="#A6A6FF" CssClass="auto-style1"></asp:ListBox>
        <asp:Button ID="btnAddCopy" runat="server" Font-Bold="True" Font-Size="Larger" OnClick="btnAddBook_Click" style="z-index: 1; left: 1083px; top: 168px; position: absolute; height: 46px; width: 200px" Text="Add Copy" BackColor="#99FF66" />
        <asp:Button ID="btnEditCopy" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 1084px; top: 324px; position: absolute; height: 46px; width: 200px" Text="Edit Copy" OnClick="btnEditBook_Click" BackColor="#FF7B7B" />
        <asp:Button ID="btnDeleteCopy" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 1086px; top: 482px; position: absolute; height: 46px; width: 200px" Text="Delete Copy" OnClick="btnDeleteBook_Click" BackColor="Yellow" />
        <asp:Button ID="btnDisplayAllCopies" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 763px; top: 586px; position: absolute; height: 40px; width: 275px" Text="Display All Copies" OnClick="btnDisplayAllBook_Click" BackColor="#E7A5D8" />
        <asp:Button ID="btnFilterByBarCode" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 52px; top: 658px; position: absolute; height: 43px; width: 329px" Text="Filter By Bar Code" OnClick="btnFilterByBookISBN_Click" BackColor="#DBFFDB" />
        <asp:TextBox ID="TextBoxFilterCopy" runat="server" style="z-index: 1; left: 53px; top: 598px; position: absolute; height: 35px; width: 319px" BackColor="#D5FFFF" OnTextChanged="TextBoxFilter_TextChanged"></asp:TextBox>
        <asp:Label ID="lblPleaseEnterBarCode" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="Black" style="z-index: 1; left: 53px; top: 539px; position: absolute; width: 334px; height: 42px" Text="Please Enter Bar Code"></asp:Label>
        
    </form>
</body>
</html>