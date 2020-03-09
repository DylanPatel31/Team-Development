<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">






    protected void btnViewReservedBook_Click(object sender, EventArgs e)
    {

    }

    //var to store the PhoneID
    Int32 ISBN;
    protected void Page_Load(object sender, EventArgs e)
    {
        //copy the data from the query string to the text box txtPhoneID
        ISBN = Convert.ToInt32(Session["ISBN"]);
        //if this is not an instruction to add a new record

        if (IsPostBack == false)
        {
            if (ISBN != -1)
            {
                // display the existing data
                DisplayBooks(ISBN);
            }
        }

    }

    void DisplayBooks(Int32 ISBN)
    {
        //create an instance of the phone class
        Class_Library.clsBookCollection ISBNS = new Class_Library.clsBookCollection();
        //find the record we want to display
        ISBNS.ThisBook.Find(ISBN);
        //display the house no
        TextBoxISBN.Text = ISBNS.ThisBook.ISBN.ToString();
        TextBoxTitle.Text = ISBNS.ThisBook.Title;
        TextBoxAuthor.Text = ISBNS.ThisBook.Author;
        TextBoxPublisher.Text = ISBNS.ThisBook.Publisher;
        TextBoxPublishedYear.Text = ISBNS.ThisBook.PublishedYear.ToString();
        TextBoxGenreID.Text = ISBNS.ThisBook.FK_GenreID;
        TextBoxEditionNo.Text = ISBNS.ThisBook.EditionNo.ToString();
        TextBoxShelfNo.Text = ISBNS.ThisBook.ShelfNo;

    }

    //function for adding new records
    void Add()
    {
        //create an instance of the OrderCollection class
         Class_Library.clsBookCollection ISBNS = new  Class_Library.clsBookCollection();
        //validate the data on the web form
        String Error = ISBNS.ThisBook.Valid(TextBoxTitle.Text, TextBoxAuthor.Text, TextBoxPublisher.Text, TextBoxPublishedYear.Text, TextBoxGenreID.Text, TextBoxEditionNo.Text, TextBoxShelfNo.Text );
        //if the data is OK then add it to the object
        if (Error == "")
        {
            //copy the data from the interface to the object
            ISBNS.ThisBook.Title = TextBoxTitle.Text;
            ISBNS.ThisBook.Author = TextBoxAuthor.Text;
            ISBNS.ThisBook.Publisher = TextBoxPublisher.Text;
            ISBNS.ThisBook.PublishedYear = Convert.ToInt32(TextBoxPublishedYear.Text);
            ISBNS.ThisBook.FK_GenreID = TextBoxGenreID.Text;
            ISBNS.ThisBook.EditionNo = Convert.ToInt32(TextBoxEditionNo.Text);
            ISBNS.ThisBook. ShelfNo = TextBoxShelfNo.Text;

            //add the new record
            ISBNS.Add();
            //all done so redirect back to the main page
            Response.Redirect("BookDisplay.aspx");
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
         Class_Library.clsBookCollection ISBNS = new  Class_Library.clsBookCollection();
        //validate the data on the web form
        String Error = ISBNS.ThisBook.Valid(TextBoxTitle.Text, TextBoxAuthor.Text, TextBoxPublisher.Text, TextBoxPublishedYear.Text, TextBoxGenreID.Text, TextBoxEditionNo.Text, TextBoxShelfNo.Text);
        //if the data is OK then add it to the object
        if (Error == "")
        {

            //find the record to update
            ISBNS.ThisBook.Find(ISBN);
            //copy the data from the interface to the object
            ISBNS.ThisBook.Title = TextBoxTitle.Text;
            ISBNS.ThisBook.Author = TextBoxAuthor.Text;
            ISBNS.ThisBook.Publisher = TextBoxPublisher.Text;
            ISBNS.ThisBook.PublishedYear = Convert.ToInt32(TextBoxPublishedYear.Text);
            ISBNS.ThisBook.FK_GenreID = TextBoxGenreID.Text;
            ISBNS.ThisBook.EditionNo = Convert.ToInt32(TextBoxEditionNo.Text);
            ISBNS.ThisBook.ShelfNo = TextBoxShelfNo.Text;
            //update the new record
            ISBNS.Update();
            //all done so redirect back to the main page
            Response.Redirect("BookDisplay.aspx");
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
            Response.Redirect("BookDisplay.aspx");

    }

    protected void btnEnter_Click(object sender, EventArgs e)
    {
        if (ISBN == -1)
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
        dddddd<asp:Label ID="lblISBN" runat="server" BorderColor="Black" Font-Bold="True" ForeColor="Black" style="z-index: 1; left: 317px; top: 178px; position: absolute; height: 31px; width: 171px">ISBN</asp:Label>
        <asp:TextBox ID="TextBoxISBN" runat="server" style="z-index: 1; left: 519px; top: 176px; position: absolute; height: 33px; width: 173px"></asp:TextBox>
        <asp:TextBox ID="TextBoxTitle" runat="server" style="z-index: 1; left: 517px; top: 230px; position: absolute; height: 32px; width: 173px"></asp:TextBox>
        <asp:TextBox ID="TextBoxAuthor" runat="server" style="z-index: 1; left: 518px; top: 286px; position: absolute; height: 32px; width: 173px"></asp:TextBox>
        <asp:TextBox ID="TextBoxPublisher" runat="server" style="z-index: 1; left: 517px; top: 346px; position: absolute; height: 31px; width: 173px"></asp:TextBox>
        <asp:TextBox ID="TextBoxPublishedYear" runat="server" style="z-index: 1; left: 518px; top: 401px; position: absolute; height: 32px; width: 173px"></asp:TextBox>
        <asp:TextBox ID="TextBoxGenreID" runat="server" style="z-index: 1; left: 520px; top: 460px; position: absolute; height: 33px; width: 173px"></asp:TextBox>
        <asp:TextBox ID="TextBoxEditionNo" runat="server" style="z-index: 1; left: 517px; top: 517px; position: absolute; height: 33px; width: 174px"></asp:TextBox>
        <asp:TextBox ID="TextBoxShelfNo" runat="server" style="z-index: 1; left: 517px; top: 579px; position: absolute; height: 33px; width: 174px"></asp:TextBox>
        <asp:Label ID="lblTitle" runat="server" Font-Bold="True" ForeColor="Black" style="z-index: 1; left: 314px; top: 235px; position: absolute; width: 175px" Text="Title"></asp:Label>
        <asp:Label ID="lblAuthor" runat="server" Font-Bold="True" ForeColor="Black" style="z-index: 1; left: 311px; top: 288px; position: absolute; width: 160px" Text="Author"></asp:Label>
        <asp:Label ID="lblPublisher" runat="server" BorderColor="Black" Font-Bold="True" ForeColor="Black" style="z-index: 1; left: 309px; top: 347px; position: absolute; width: 154px" Text="Publisher"></asp:Label>
        <asp:Label ID="lblPublishedYear" runat="server" Font-Bold="True" ForeColor="Black" style="z-index: 1; left: 309px; top: 405px; position: absolute; width: 172px; bottom: 340px" Text="Published Year"></asp:Label>
        <asp:Label ID="lblGenreID" runat="server" Font-Bold="True" ForeColor="Black" style="z-index: 1; left: 309px; top: 460px; position: absolute; width: 174px" Text="Genre ID"></asp:Label>
        <asp:Label ID="lblEditionNo" runat="server" Font-Bold="True" ForeColor="Black" style="z-index: 1; left: 308px; top: 521px; position: absolute; width: 173px" Text="Edition No"></asp:Label>
        <asp:Label ID="lblShelfNo" runat="server" Font-Bold="True" ForeColor="Black" style="z-index: 1; left: 309px; top: 578px; position: absolute; width: 173px" Text="Shelf No"></asp:Label>
        <asp:Button ID="btnCancel" runat="server" BackColor="#FF3300" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 1027px; top: 675px; position: absolute; height: 40px; width: 133px" Text="Cancel" OnClick="btnCancel_Click" />
        <asp:Button ID="btnEnter" runat="server" BackColor="#9966FF" Font-Bold="True" Font-Size="Larger" OnClick="btnEnter_Click" style="z-index: 1; left: 850px; top: 678px; position: absolute; height: 40px; width: 133px; right: 790px" Text="Enter" />
        <asp:Label ID="lblError" runat="server" ForeColor="Black" style="z-index: 1; left: 1337px; top: 623px; position: absolute; width: 128px" Text="lblError"></asp:Label>
    </form>
</body>
</html>