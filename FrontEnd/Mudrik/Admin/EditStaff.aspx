<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">


    protected void Page_Load(object sender, EventArgs e)
    {
        //if this is the first appearance of this form
        if (IsPostBack == false)
        {
            //display all phones
            DisplayUser("");
        }
    }



    protected void btnSearchStaff_Click1(object sender, EventArgs e)
    {
        //display only Phones mattching the text in the DeviceName text box
        DisplayUser(txtSearchStaff.Text);
    }

    Int32 DisplayUser(string FirstNameFilter)
    {
        Int32 user_id;//var to store the primary key
        String firstName; //var to store the Device Name
        String surname; //var to store the Operating System
        ;//create an instance of the phone class
        Class_Library.clsUserCollection User = new  Class_Library.clsUserCollection();
        User.FilterByFirstName(FirstNameFilter);
        Int32 RecordCount;//var to store the count of records
        Int32 Index = 0;//var to store the index for the loop
        RecordCount = User.Count;// get the count of records
        lstSearchResults.Items.Clear(); //clear the list box
        while (Index < RecordCount)//while there are records to process
        {
            user_id = User.UserList[Index].user_id;//get the primary key
            firstName = User.UserList[Index].firstName; //get the Device Name
            surname = User.UserList[Index].surname; //get the Operating System

            //create a new entry for the list box
            ListItem NewEntry = new ListItem(firstName + ", " + surname, user_id.ToString());
            lstSearchResults.Items.Add(NewEntry);//add the phone to the list
            Index++;//move the index to the next record
        }
        return RecordCount;//return the count of the records found
    }




    protected void btnDisplayAllStaff_Click1(object sender, EventArgs e)
    {
        //display all Films
        DisplayUser("");
    }


    protected void btnEditStaff_Click(object sender, EventArgs e)
    {
        //var to store the primary key value
        Int32 user_id;
        if (lstSearchResults.SelectedIndex != -1)
        {
            //get the primary key value from the list box
            user_id = Convert.ToInt32(lstSearchResults.SelectedValue);
            //redirect to the editing page
            Response.Redirect("StaffDetails.aspx?user_id=" + user_id);
        }
        else
        {
            //display an error
            lblError.Text = "You must select a record off the list first in order to edit it.";
        }
    }


    protected void btnDeleteStaff_Click1(object sender, EventArgs e)
    {
        //var to store the primary key value
        Int32 user_id;
        if (lstSearchResults.SelectedIndex != -1)
        {
            //get the primary key value from the list box
            user_id = Convert.ToInt32(lstSearchResults.SelectedValue);
            //redirect to the editing page
            Response.Redirect("DeleteStaff.aspx?user_id=" + user_id);
        }
        else
        {
            //display an error
            lblError.Text = "You must select a Record off the list first in order to delete.";
        }
    }

    protected void btnAddStaff_Click1(object sender, EventArgs e)
    {
        //this line of code re-directs back to the main page
        Response.Redirect("StaffDetails.aspx?user_id= -1");
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="utf-8"/>
    <title>Admin Menu</title>
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
            <asp:Button ID="btnSearchStaff" runat="server" style="z-index: 1; left: 575px; top: 153px; position: absolute; height: 37px; width: 225px;" Text="Search Staff" BackColor="#CCFFFF" BorderColor="Red" Font-Bold="True" OnClick="btnSearchStaff_Click1" />
            <asp:TextBox ID="txtSearchStaff" runat="server" style="z-index: 1; left: 318px; top: 153px; position: absolute; width: 249px; height: 31px"></asp:TextBox>            <asp:Button ID="btnEditStaff" runat="server" BackColor="#0099FF" BorderColor="Red" Font-Bold="True" style="z-index: 1; left: 319px; top: 556px; position: absolute; height: 50px; width: 718px;"  Text="Edit Staff" OnClick="btnEditStaff_Click" />
            <asp:Label ID="lblError" runat="server" style="z-index: 1; left: 28px; top: 621px; position: absolute; width: 250px"></asp:Label>
            <asp:ListBox ID="lstSearchResults" runat="server" style="z-index: 1; left: 316px; top: 208px; position: absolute; height: 328px; width: 720px; margin-right: 0px;"></asp:ListBox>

            <div class="main-menu">
                <ul>
                    <asp:Label ID="lblStaff" runat="server" ForeColor="Black" style="z-index: 1; left: 319px; top: 128px; position: absolute" Text="Type the name of the Staff"></asp:Label>
                    <li><a href="MainMenu.aspx">Menu</a></li>
                    <li><a href="../index.html">Logout</a></li>
                </ul>
            </div>
        </div>
    </header>>
            
    
    
    
    
    
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
        <asp:Button ID="btnDisplayAllStaff" runat="server" BackColor="#CCFFFF" BorderColor="Red" Font-Bold="True" style="z-index: 1; left: 809px; top: 152px; position: absolute; height: 38px; width: 225px;" Text="Display All Staff" OnClick="btnDisplayAllStaff_Click1" />
        <p>
            &nbsp;</p>
        <p>

             &nbsp;</p>
    </form>
     
    
    
    
    
    
    </body>
</html>
