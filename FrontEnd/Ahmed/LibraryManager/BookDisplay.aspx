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
            DisplayBooks("");
        }

    }

    Int32 DisplayBooks(string BookTitle)
    {
        Int32 ISBN;//var to store the primary key
        String Title; //var to store the Device Name
        String Author; //var to store the Device Name
        String Publisher; //var to store the Device Name
        String ShelfNo; //var to store the Device Name

        ;//create an instance of the phone class
        clsBookCollection Book = new clsBookCollection();
        Book.FilterbyTitle(BookTitle);
        Int32 RecordCount;//var to store the count of records
        Int32 Index = 0;//var to store the index for the loop
        RecordCount = Book.Count;// get the count of records
        ListBoxBook.Items.Clear(); //clear the list box
        while (Index < RecordCount)//while there are records to process
        {
            ISBN = Book.BookList[Index].ISBN;//get the primary key
            Title = Book.BookList[Index].Title; //get the Device Name
            Author = Book.BookList[Index].Author; //get the Operating System
            Publisher = Book.BookList[Index].Publisher; //get the Operating System
            ShelfNo = Book.BookList[Index].ShelfNo; //get the Operating System

            //create a new entry for the list box
            ListItem NewEntry = new ListItem(Title + ", " + Author + ", " + Publisher + ", " + ShelfNo, ISBN.ToString());
            ListBoxBook.Items.Add(NewEntry);//add the phone to the list
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
        Session["ISBN"] = -1;
        //redirect to the data entry page
        Response.Redirect("AddBook.aspx");
    }

    protected void btnEditBook_Click(object sender, EventArgs e)
    {
        //var to store the primary key value
        Int32 ISBN;
        if (ListBoxBook.SelectedIndex != -1)
        {
            //get the primary key value from the list box
            ISBN = Convert.ToInt32(ListBoxBook.SelectedValue);
            //store the data in the sessions object
            Session["ISBN"] = ISBN;
            //redirect to the editing page
            Response.Redirect("AddBook.aspx");
        }
        else
        {
            //display an error
            lblError.Text = "You must select a Book off the list first to edit it.";
        }
    }

    protected void btnDeleteBook_Click(object sender, EventArgs e)
    {
        //var to store the primary key value of the record to be deleted
        //var to store the primary key value
        Int32 ISBN;
        if (ListBoxBook.SelectedIndex != -1)
        {
            //get the primary key value from the list box
            ISBN = Convert.ToInt32(ListBoxBook.SelectedValue);
            //store the data in the sessions object
            Session["ISBN"] = ISBN;
            //redirect to the Delete page
            Response.Redirect("DeleteBook.aspx?ISBN=" + ISBN);
        }
        else
        {
            //display an error
            lblError.Text = "You must select a Book off the list first in order to delete.";
        }
    }

    protected void btnDisplayAllBook_Click(object sender, EventArgs e)
    {

        //display all Books
        DisplayBooks("");
    }

    protected void btnFilterByBookISBN_Click(object sender, EventArgs e)
    {
        //display only Orders mattching the text in the Customer Name text box
        DisplayBooks(TextBoxFilter.Text);
    }

    protected void TextBoxFilter_TextChanged(object sender, EventArgs e)
    {

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
            <asp:Label ID="lblError" runat="server" ForeColor="Black" style="z-index: 1; left: 1109px; top: 672px; position: absolute; height: 33px; width: 292px" Text="lblError"></asp:Label>
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
    <section clDisplay book details</h2>
                             
                </div>
             
    </section>
    <!-- FOOTER -->
    <footer class="site-footer">
        <div class="container">
           

        </div>


    </footer>
    <!-- FOOTER -->
        
        <asp:ListBox ID="ListBoxBook" runat="server" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" style="z-index: 1; left: 46px; top: 165px; position: absolute; height: 374px; width: 990px" Font-Bold="True" Font-Size="X-Large" BackColor="#CCFFFF"></asp:ListBox>
        <asp:Button ID="btnAddBook" runat="server" Font-Bold="True" Font-Size="Larger" OnClick="btnAddBook_Click" style="z-index: 1; left: 1083px; top: 168px; position: absolute; height: 46px; width: 200px" Text="Add Book" BackColor="#FF6699" />
        <asp:Button ID="btnEditBook" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 1084px; top: 324px; position: absolute; height: 46px; width: 200px" Text="Edit Book" OnClick="btnEditBook_Click" BackColor="#99FF99" />
        <asp:Button ID="btnDeleteBook" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 1086px; top: 482px; position: absolute; height: 46px; width: 200px" Text="Delete Book" OnClick="btnDeleteBook_Click" BackColor="#FF6600" />
        <asp:Button ID="btnDisplayAllBook" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 763px; top: 586px; position: absolute; height: 40px; width: 275px" Text="Display All Books" OnClick="btnDisplayAllBook_Click" BackColor="#FFFF99" />
        <asp:Button ID="btnFilterByBookISBN" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 52px; top: 658px; position: absolute; height: 43px; width: 329px" Text="Filter By Book ISBN" OnClick="btnFilterByBookISBN_Click" BackColor="#0099FF" />
        <asp:TextBox ID="TextBoxFilter" runat="server" style="z-index: 1; left: 53px; top: 598px; position: absolute; height: 35px; width: 319px" BackColor="#FFCC00" OnTextChanged="TextBoxFilter_TextChanged"></asp:TextBox>
        <asp:Label ID="lblPleaseEnterBookISN" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="Black" style="z-index: 1; left: 53px; top: 539px; position: absolute; width: 334px; height: 42px" Text="Please Enter Book ISN"></asp:Label>
        
    </form>
</body>
</html>