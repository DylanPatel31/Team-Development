<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    //var to store the user_id
    Int32 user_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        //copy the data from the query string to the text box txtPhoneID
        user_id = Convert.ToInt32(Request.QueryString["user_id"]);
        //if this is not an instruction to add a new record
        if (IsPostBack != true)
        {
            if (user_id != -1)
            {
                //display the existing data
                DisplayStaff(user_id);
            }
        }

    }

    void DisplayStaff(Int32 user_id)
    {
        //create an instance of the User class
        Class_Library.clsUser MyStaffs = new Class_Library.clsUser();
        //find the record we want to display
        MyStaffs.Find(user_id);
        //display the user id
        txtFirstName.Text = MyStaffs.firstName;
        txtSurname.Text = MyStaffs.surname;
        txtEmail.Text = MyStaffs.email;
        txtPassword.Text = MyStaffs.password;
        txtUserType.Text = MyStaffs.fk1_userType_id;
    }



    protected void btnCancel_Click2(object sender, EventArgs e)
    {
        //this line of code re-directs back to the main page
        Response.Redirect("MainMenu.aspx");
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        //create an instance of the phones class
        Class_Library.clsUser ThisUser = new Class_Library.clsUser();
        //var to store any error message
        string ErrorMessage;
        //test the data on the web form
        ErrorMessage = ThisUser.UserValid(txtUserID.Text,
                                          txtFirstName.Text,
                                          txtSurname.Text,
                                          txtEmail.Text,
                                          txtPassword.Text,
                                          txtUserType.Text);
        //if there is no error message
        if (ErrorMessage == "")
        {
            //create a new instance of the Phones collection class
            Class_Library.clsUserCollection Staffs = new Class_Library.clsUserCollection();
            //do something with the data - insert or update
            //
            //if the PhoneID is -1
            if (user_id == -1)
            {
                //copy the data from the interface to the object
                Staffs.ThisUser.firstName = txtUserID.Text;
                Staffs.ThisUser.firstName = txtFirstName.Text;
                Staffs.ThisUser.surname = txtSurname.Text;
                Staffs.ThisUser.email = txtEmail.Text;
                Staffs.ThisUser.password = txtPassword.Text;
                Staffs.ThisUser.fk1_userType_id = txtUserType.Text;
                //add the new record
                Staffs.Add();
            }
            else
            {
                //this is an existing record
                //copy the data from the interface to the object
                Staffs.ThisUser.user_id = user_id;
                Staffs.ThisUser.firstName = txtFirstName.Text;
                Staffs.ThisUser.surname = txtSurname.Text;
                Staffs.ThisUser.email = txtEmail.Text;
                Staffs.ThisUser.password = txtPassword.Text;
                Staffs.ThisUser.fk1_userType_id = txtUserType.Text;
                //update the existing record
                Staffs.Update();
            }
            //redirect back to the main menu 
            Response.Redirect("EditStaff.aspx");
        }
        else
        {
            //display the error message
            lblError.Text = ErrorMessage;
        }
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8"/>
    <title>Staff Details</title>
    <link rel="stylesheet" href="../style/style.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>

        <!-- Header -->
    <header class="top">
        <div class="container">
            <div class="logo">
                <a href="index.html">Timeless Films</a>
            </div>
            <asp:Button ID="btnCancel" runat="server" style="z-index: 1; left: 350px; top: 582px; position: absolute" Text="Cancel Changes" OnClick="btnCancel_Click2" />
            <asp:Label ID="lblUserID" runat="server" style="z-index: 1; left: 86px; top: 211px; position: absolute" Text="User ID"></asp:Label>
            <asp:TextBox ID="txtUserID" runat="server" style="z-index: 1; left: 181px; top: 213px; position: absolute"></asp:TextBox>
            <div class="main-menu">
                <ul>
                    <li><a href="MainMenu.aspx">Menu</a></li>
                    <li><a href="../index.html">Logout</a></li>
                </ul>
            </div>
            <asp:Label ID="lblError" runat="server" style="z-index: 1; left: 333px; top: 153px; position: absolute"></asp:Label>
        </div>
    </header>>
        <!-- Header -->






     <!-- Background-Colour changer -->
    <article>
        <time>
            <th width="234" height="128" scope="col">
                <div id="backgroundchange">
                    <select name="select" onChange="if(this.selectedIndex!=0)
document.bgColor=this.options[this.selectedIndex].value">
                        <option value="choose" selected>Change Background Colour : </option>
                        <option value="FFFFFF">White </option>
                        <option value="2c50a2">Dark blue </option>
                        <option value="663399">Purple</option>
                        <option value="f60000">Blood Red</option>
                        <option value="e800f6">Pink</option>
                        <option value="00a5f6">Sky Blue</option>
                        <option value="75ab00">Green</option>
                        <option value="91f600">Grass Green</option>
                        <option value="000000">Black</option>
                        <option value="ffa500">Orange</option>
                        <option value="ff69b4">Light Pink</option>
                        <option value="00c5cd">Turquoise</option>
                        <option value="551a8b">Dark Purple</option>
                        <option value="a020f0">Light Purple</option>
                        <option value="ffdab9">Peach</option>
                    </select>
                </div>
            </th>
        </time>
    </article>
    <!-- Background-Colour changer -->

        <asp:Label ID="lblFirstName" runat="server" style="z-index: 1; left: 85px; top: 252px; position: absolute" Text="First Name"></asp:Label>
        <asp:TextBox ID="txtFirstName" runat="server" style="z-index: 1; left: 182px; top: 253px; position: absolute"></asp:TextBox>
        <asp:Label ID="lblSurname" runat="server" style="z-index: 1; left: 84px; top: 293px; position: absolute" Text="Surname"></asp:Label>
        <asp:TextBox ID="txtSurname" runat="server" style="z-index: 1; left: 181px; top: 298px; position: absolute"></asp:TextBox>
        <asp:Label ID="lblEmail" runat="server" style="z-index: 1; left: 85px; top: 337px; position: absolute" Text="Email"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" style="z-index: 1; left: 181px; top: 340px; position: absolute"></asp:TextBox>
        <asp:Label ID="lblPassword" runat="server" style="z-index: 1; left: 85px; top: 383px; position: absolute" Text="Password"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" style="z-index: 1; left: 181px; top: 384px; position: absolute"></asp:TextBox>
       
        <asp:Label ID="lblUserType" runat="server" style="z-index: 1; left: 85px; top: 427px; position: absolute" Text="User Type"></asp:Label>
        <asp:DropDownList ID="txtUserType" runat="server" style="z-index: 1; left: 181px; top: 429px; position: absolute; height: 18px; width: 130px">
            <asp:ListItem Value="U2"></asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="btnOK" runat="server" style="z-index: 1; left: 179px; top: 581px; position: absolute" Text="Save Changes" OnClick="btnOK_Click" />
    </form>

</body>
</html>
