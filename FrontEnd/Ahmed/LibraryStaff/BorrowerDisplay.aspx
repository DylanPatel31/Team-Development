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
            DisplayBorrowers("");
        }

    }

    Int32 DisplayBorrowers(string BorrowerPostCode)
    {
        Int32 BorrowerID;//var to store the primary key
        String FirstName; //var to store the Device Name
        String LastName; //var to store the Device Name
        String PostCode; //var to store the Device Name
        string BorrowerStatus;//var to store the Device Name

        ;//create an instance of the phone class
        clsBorrowerCollection Borrower = new clsBorrowerCollection();
        Borrower.FilterbyPostCode(BorrowerPostCode);
        Int32 RecordCount;//var to store the count of records
        Int32 Index = 0;//var to store the index for the loop
        RecordCount = Borrower.Count;// get the count of records
        ListBoxBorrower.Items.Clear(); //clear the list box
        while (Index < RecordCount)//while there are records to process
        {
            BorrowerID = Borrower.BorrowerList[Index].BorrowerID;//get the primary key
            FirstName = Borrower.BorrowerList[Index].FirstName; //get the Device Name
            LastName = Borrower.BorrowerList[Index].LastName; //get the Device Name
            PostCode = Borrower.BorrowerList[Index].PostCode; //get the Operating System
            BorrowerStatus = Borrower.BorrowerList[Index].BorrowerStatus; //get the Operating System

            //create a new entry for the list box
            ListItem NewEntry = new ListItem(FirstName + ", " + LastName + ", " + PostCode + ", " + BorrowerStatus, BorrowerID.ToString());
            ListBoxBorrower.Items.Add(NewEntry);//add the phone to the list
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
        Session["BorrowerID"] = -1;
        //redirect to the data entry page
        Response.Redirect("AddBorrower.aspx");
    }

    protected void btnEditBook_Click(object sender, EventArgs e)
    {
        //var to store the primary key value
        Int32 BorrowerID;
        if (ListBoxBorrower.SelectedIndex != -1)
        {
            //get the primary key value from the list box
            BorrowerID = Convert.ToInt32(ListBoxBorrower.SelectedValue);
            //store the data in the sessions object
            Session["BorrowerID"] = BorrowerID;
            //redirect to the editing page
            Response.Redirect("AddBorrower.aspx");
        }
        else
        {
            //display an error
            lblErrorBorrower.Text = "You must select a Book off the list first to edit it.";
        }
    }

    protected void btnDeleteBook_Click(object sender, EventArgs e)
    {
        //var to store the primary key value of the record to be deleted
        //var to store the primary key value
        Int32 BorrowerID;
        if (ListBoxBorrower.SelectedIndex != -1)
        {
            //get the primary key value from the list box
            BorrowerID = Convert.ToInt32(ListBoxBorrower.SelectedValue);
            //store the data in the sessions object
            Session["BorrowerID"] = BorrowerID;
            //redirect to the Delete page
            Response.Redirect("DeleteBorrower.aspx?BorrowerID=" + BorrowerID);
        }
        else
        {
            //display an error
            lblErrorBorrower.Text = "You must select a Book off the list first in order to delete.";
        }
    }

    protected void btnDisplayAllBook_Click(object sender, EventArgs e)
    {

        //display all Books
        DisplayBorrowers("");
    }

    protected void btnFilterByBookISBN_Click(object sender, EventArgs e)
    {
        //display only Orders mattching the text in the Customer Name text box
        DisplayBorrowers(TextBoxFilter.Text);
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
            <asp:Label ID="lblErrorBorrower" runat="server" ForeColor="Black" style="z-index: 1; left: 1076px; top: 734px; position: absolute; height: 33px; width: 292px" Text="lblError"></asp:Label>
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
        
        <asp:ListBox ID="ListBoxBorrower" runat="server" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" style="z-index: 1; left: 40px; top: 192px; position: absolute; height: 394px; width: 1340px" Font-Bold="True" Font-Size="X-Large" BackColor="#CCFFFF"></asp:ListBox>
        <asp:Button ID="btnAddBorrower" runat="server" Font-Bold="True" Font-Size="Larger" OnClick="btnAddBook_Click" style="z-index: 1; left: 821px; top: 618px; position: absolute; height: 46px; width: 241px" Text="Add Borrower" BackColor="#FF6699" />
        <asp:Button ID="btnEditBorrower" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 1129px; top: 617px; position: absolute; height: 46px; width: 244px" Text="Edit Borrower" OnClick="btnEditBook_Click" BackColor="#99FF99" />
        <asp:Button ID="btnDeleteBorrower" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 516px; top: 620px; position: absolute; height: 46px; width: 242px" Text="Delete Borrower" OnClick="btnDeleteBook_Click" BackColor="#FF6600" />
        <asp:Button ID="btnDisplayAllBorrower" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 45px; top: 616px; position: absolute; height: 49px; width: 325px" Text="Display All Borrowers" OnClick="btnDisplayAllBook_Click" BackColor="#FFFF99" />
        <asp:Button ID="btnFilterByBorrowerPostCode" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 944px; top: 129px; position: absolute; height: 45px; width: 426px" Text="Filter By Borrower PostCode" OnClick="btnFilterByBookISBN_Click" BackColor="#0099FF" />
        <asp:TextBox ID="TextBoxFilter" runat="server" style="z-index: 1; left: 567px; top: 131px; position: absolute; height: 35px; width: 319px" BackColor="#FFCC00" OnTextChanged="TextBoxFilter_TextChanged"></asp:TextBox>
        <asp:Label ID="lblPleaseEnterBookISN" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="Black" style="z-index: 1; left: 52px; top: 132px; position: absolute; width: 484px; height: 45px" Text="Please Enter Borrower PostCode"></asp:Label>
        
    </form>
</body>
</html>