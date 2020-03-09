<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">






    protected void btnViewReservedBook_Click(object sender, EventArgs e)
    {

    }

    //var to store the PhoneID
    Int32 BorrowerID;
    protected void Page_Load(object sender, EventArgs e)
    {
        //copy the data from the query string to the text box txtPhoneID
        BorrowerID = Convert.ToInt32(Session["BorrowerID"]);
        //if this is not an instruction to add a new record

        if (IsPostBack == false)
        {
            if (BorrowerID != -1)
            {
                // display the existing data
                DisplayBorrowers(BorrowerID);
            }
        }

    }

    void DisplayBorrowers(Int32 BorrowerID)
    {
        //create an instance of the phone class
        clsBorrowerCollection ISBNS = new clsBorrowerCollection();
        //find the record we want to display
        ISBNS.ThisBorrower.Find(BorrowerID);
        //display the house no
        TextBoxBorrowerID.Text = ISBNS.ThisBorrower.BorrowerID.ToString();
        TextBoxBorrowerTypeID.Text = ISBNS.ThisBorrower.FK_BorrowerTypeID;
        TextBoxFirstName.Text = ISBNS.ThisBorrower.FirstName;
        TextBoxLastName.Text = ISBNS.ThisBorrower.LastName;
        TextBoxEmail.Text = ISBNS.ThisBorrower.Email;
        TextBoxTelephoneNo.Text = ISBNS.ThisBorrower.TelephoneNo;
        TextBoxAddress1.Text = ISBNS.ThisBorrower.Address1;
        TextBoxAddress2.Text = ISBNS.ThisBorrower.Address2;
        TextBoxCity.Text = ISBNS.ThisBorrower.City;
        TextBoxPostCode.Text = ISBNS.ThisBorrower.PostCode;
        TextBoxBorrowerStatus.Text = ISBNS.ThisBorrower.BorrowerStatus;
        TextBoxBorrowerRecords.Text = ISBNS.ThisBorrower.BorrowerRecords;
        TextBoxBorrowerPassword.Text = ISBNS.ThisBorrower.BorrowerPassword;
    }

    //function for adding new records
    void Add()
    {
        //create an instance of the OrderCollection class
        clsBorrowerCollection ISBNS = new clsBorrowerCollection();
        //validate the data on the web form
        String Error = ISBNS.ThisBorrower.Valid(TextBoxBorrowerTypeID.Text, TextBoxFirstName.Text, TextBoxLastName.Text, TextBoxEmail.Text, TextBoxTelephoneNo.Text, TextBoxAddress1.Text, TextBoxAddress2.Text, TextBoxCity.Text, TextBoxPostCode.Text, TextBoxBorrowerStatus.Text, TextBoxBorrowerRecords.Text,  TextBoxBorrowerPassword.Text);
        //if the data is OK then add it to the object
        if (Error == "")
        {
            //copy the data from the interface to the object
            ISBNS.ThisBorrower.FK_BorrowerTypeID = TextBoxBorrowerTypeID.Text;
            ISBNS.ThisBorrower.FirstName = TextBoxFirstName.Text;
            ISBNS.ThisBorrower.LastName = TextBoxLastName.Text;
            ISBNS.ThisBorrower.Email = TextBoxEmail.Text;
            ISBNS.ThisBorrower.TelephoneNo = TextBoxTelephoneNo.Text;
            ISBNS.ThisBorrower.Address1 = TextBoxAddress1.Text;
            ISBNS.ThisBorrower.Address2 = TextBoxAddress2.Text;
            ISBNS.ThisBorrower.City = TextBoxCity.Text;
            ISBNS.ThisBorrower.PostCode = TextBoxPostCode.Text;
            ISBNS.ThisBorrower.BorrowerStatus = TextBoxBorrowerStatus.Text;
            ISBNS.ThisBorrower.BorrowerRecords = TextBoxBorrowerRecords.Text;
            ISBNS.ThisBorrower. BorrowerPassword = TextBoxBorrowerPassword.Text;

            //add the new record
            ISBNS.Add();
            //all done so redirect back to the main page
            Response.Redirect("BorrowerDisplay.aspx");
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
        clsBorrowerCollection ISBNS = new clsBorrowerCollection();
        //validate the data on the web form
        String Error = ISBNS.ThisBorrower.Valid(TextBoxBorrowerTypeID.Text, TextBoxFirstName.Text, TextBoxLastName.Text, TextBoxEmail.Text, TextBoxTelephoneNo.Text, TextBoxAddress1.Text, TextBoxAddress2.Text, TextBoxCity.Text, TextBoxPostCode.Text, TextBoxBorrowerStatus.Text, TextBoxBorrowerRecords.Text,  TextBoxBorrowerPassword.Text);
        //if the data is OK then add it to the object
        if (Error == "")
        {

            //find the record to update
            ISBNS.ThisBorrower.Find(BorrowerID);
            //copy the data from the interface to the object
            ISBNS.ThisBorrower.FK_BorrowerTypeID = TextBoxBorrowerTypeID.Text;
            ISBNS.ThisBorrower.FirstName = TextBoxFirstName.Text;
            ISBNS.ThisBorrower.LastName = TextBoxLastName.Text;
            ISBNS.ThisBorrower.Email = TextBoxEmail.Text;
            ISBNS.ThisBorrower.TelephoneNo = TextBoxTelephoneNo.Text;
            ISBNS.ThisBorrower.Address1 = TextBoxAddress1.Text;
            ISBNS.ThisBorrower.Address2 = TextBoxAddress2.Text;
            ISBNS.ThisBorrower.City = TextBoxCity.Text;
            ISBNS.ThisBorrower.PostCode = TextBoxPostCode.Text;
            ISBNS.ThisBorrower.BorrowerStatus = TextBoxBorrowerStatus.Text;
            ISBNS.ThisBorrower.BorrowerRecords = TextBoxBorrowerRecords.Text;
            ISBNS.ThisBorrower. BorrowerPassword = TextBoxBorrowerPassword.Text;

            //update the new record
            ISBNS.Update();
            //all done so redirect back to the main page
            Response.Redirect("BorrowerDisplay.aspx");
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
        Response.Redirect("BorrowerDisplay.aspx");

    }

    protected void btnEnter_Click(object sender, EventArgs e)
    {
        if (BorrowerID == -1)
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


    protected void TextBoxBorrowerPassword_TextChanged(object sender, EventArgs e)
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
        dddddd<asp:Label ID="lblBorrowerID" runat="server" BorderColor="Black" Font-Bold="True" ForeColor="Black" style="z-index: 1; left: 317px; top: 178px; position: absolute; height: 31px; width: 171px">Borrower ID</asp:Label>
        <asp:TextBox ID="TextBoxBorrowerID" runat="server" style="z-index: 1; left: 559px; top: 166px; position: absolute; height: 33px; width: 173px; bottom: 574px;"></asp:TextBox>
        <asp:TextBox ID="TextBoxBorrowerTypeID" runat="server" style="z-index: 1; left: 561px; top: 239px; position: absolute; height: 32px; width: 173px"></asp:TextBox>
        <asp:TextBox ID="TextBoxFirstName" runat="server" style="z-index: 1; left: 1207px; top: 168px; position: absolute; height: 32px; width: 173px"></asp:TextBox>
        <asp:TextBox ID="TextBoxLastName" runat="server" style="z-index: 1; left: 1210px; top: 236px; position: absolute; height: 31px; width: 173px"></asp:TextBox>
        <asp:TextBox ID="TextBoxEmail" runat="server" style="z-index: 1; left: 1211px; top: 307px; position: absolute; height: 32px; width: 173px"></asp:TextBox>
        <asp:TextBox ID="TextBoxTelephoneNo" runat="server" style="z-index: 1; left: 560px; top: 305px; position: absolute; height: 33px; width: 173px"></asp:TextBox>
        <asp:TextBox ID="TextBoxAddress1" runat="server" style="z-index: 1; left: 561px; top: 379px; position: absolute; height: 33px; width: 174px; bottom: 361px;"></asp:TextBox>
        <asp:TextBox ID="TextBoxAddress2" runat="server" style="z-index: 1; left: 560px; top: 458px; position: absolute; height: 33px; width: 174px"></asp:TextBox>
        <asp:Label ID="lblBorrowerTypeID" runat="server" Font-Bold="True" ForeColor="Black" style="z-index: 1; left: 315px; top: 244px; position: absolute; width: 175px" Text="Borrower Type ID"></asp:Label>
        <asp:Label ID="lblFirstName" runat="server" Font-Bold="True" ForeColor="Black" style="z-index: 1; left: 948px; top: 174px; position: absolute; width: 160px" Text="First Name"></asp:Label>
        <asp:Label ID="lblLastName" runat="server" BorderColor="Black" Font-Bold="True" ForeColor="Black" style="z-index: 1; left: 950px; top: 240px; position: absolute; width: 154px" Text="Last Name"></asp:Label>
        <asp:Label ID="lblEmail" runat="server" Font-Bold="True" ForeColor="Black" style="z-index: 1; left: 952px; top: 313px; position: absolute; width: 172px; bottom: 432px" Text="Email"></asp:Label>
        <asp:Label ID="lblTelephoneNo" runat="server" Font-Bold="True" ForeColor="Black" style="z-index: 1; left: 314px; top: 310px; position: absolute; width: 174px" Text="Telephone No"></asp:Label>
        <asp:Label ID="lblAddress1" runat="server" Font-Bold="True" ForeColor="Black" style="z-index: 1; left: 316px; top: 388px; position: absolute; width: 173px" Text="Address 1"></asp:Label>
        <asp:Label ID="lblAddress2" runat="server" Font-Bold="True" ForeColor="Black" style="z-index: 1; left: 315px; top: 460px; position: absolute; width: 173px" Text="Address 2"></asp:Label>
        <asp:Button ID="btnCancel" runat="server" BackColor="#FF3300" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 1119px; top: 700px; position: absolute; height: 40px; width: 133px" Text="Cancel" OnClick="btnCancel_Click" />
        <asp:Button ID="btnEnter" runat="server" BackColor="#9966FF" Font-Bold="True" Font-Size="Larger" OnClick="btnEnter_Click" style="z-index: 1; left: 916px; top: 701px; position: absolute; height: 40px; width: 133px; right: 464px" Text="Enter" />
        <asp:Label ID="lblError" runat="server" ForeColor="Black" style="z-index: 1; left: 1337px; top: 623px; position: absolute; width: 128px" Text="lblError"></asp:Label>
        <asp:TextBox ID="TextBoxCity" runat="server" style="z-index: 1; left: 558px; top: 534px; position: absolute; height: 33px; width: 174px"></asp:TextBox>
        <asp:TextBox ID="TextBoxPostCode" runat="server" style="z-index: 1; left: 557px; top: 614px; position: absolute; height: 33px; width: 174px"></asp:TextBox>
        <asp:Label ID="lblPostCode" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Black" style="z-index: 1; left: 313px; top: 610px; position: absolute; width: 175px; height: 34px" Text="PostCode"></asp:Label>
        <asp:Label ID="lblBorrowerPassword" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Black" style="z-index: 1; left: 944px; top: 537px; position: absolute; height: 31px; width: 222px" Text="Borrower Password"></asp:Label>
        <asp:Label ID="lblBorrowerRecords" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Black" style="z-index: 1; left: 948px; top: 449px; position: absolute; height: 34px; width: 212px" Text="Borrower Records"></asp:Label>
        <asp:Label ID="lblBorrowerStatus" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Black" style="z-index: 1; left: 951px; top: 379px; position: absolute; height: 33px; width: 182px" Text="Borrower Status"></asp:Label>
        <asp:TextBox ID="TextBoxBorrowerStatus" runat="server" style="z-index: 1; left: 1210px; top: 378px; position: absolute; height: 33px; width: 174px"></asp:TextBox>
        <asp:TextBox ID="TextBoxBorrowerRecords" runat="server" style="z-index: 1; left: 1210px; top: 453px; position: absolute; height: 34px; width: 174px"></asp:TextBox>
        <asp:TextBox ID="TextBoxBorrowerPassword" runat="server" style="z-index: 1; left: 1207px; top: 535px; position: absolute; height: 33px; width: 174px" OnTextChanged="TextBoxBorrowerPassword_TextChanged"></asp:TextBox>
        <p>
            &nbsp;</p>
        <asp:Label ID="lblCity" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Black" style="z-index: 1; left: 318px; top: 531px; position: absolute; height: 34px; width: 173px" Text="City"></asp:Label>
    </form>
</body>
</html>