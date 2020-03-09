﻿<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void btnViewReservedBook_Click(object sender, EventArgs e)
    {

    }

    //var to store the primary key value of the record to be deleted
    Int32 CopyBarCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        //get the number of orders to be deleted from the sessions object
        CopyBarCode = Convert.ToInt32(Session["CopyBarCode"]);
        //if this is not an instruction to add a new record
        if (CopyBarCode != -1)
        {
            if (IsPostBack != true)
            {
                //display the existing data
                DeleteCopy(CopyBarCode);
            }
        }
    }



    void DeleteCopy(Int32 CopyBarCode)
    {
        //function to delete the selected record

        //create a a new instance of the collection class
         Class_Library.clsCopyCollection Customers = new  Class_Library.clsCopyCollection();
        //find the record to delete 
        Customers.ThisBook.Find(CopyBarCode);
        //display the PhoneID
        lblDelete.Text = "Are you sure that you want to Delete this Book off the system?";
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        //create an instance of the class clsPhone called MyPhones
         Class_Library.clsCopyCollection MyBooks = new  Class_Library.clsCopyCollection();
        //declare a variable to store the PhoneID to delete

        //declare a boolean variable to record success of the delete operation
        Boolean Found;
        //try and find the record to delete
        Found = MyBooks.ThisBook.Find(CopyBarCode);
        //if the record is found
        if (Found)
        {
            //invoke the delete method of the object
            MyBooks.Delete();
        }
        Response.Redirect("DisplayCopy.aspx");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        //redirect back to the main page
            Response.Redirect("DisplayCopy.aspx");
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
            <h2 class="center-text">Your About Delete A Copy from the system</h2>
                             
                </div>
             
    </section>
    <!-- FOOTER -->
    <footer class="site-footer">
        <div class="container">
           

        </div>


    </footer>
    <!-- FOOTER -->
        
       
        
        <asp:Button ID="btnCancel" runat="server" Font-Bold="True" Font-Size="Larger" style="z-index: 1; left: 298px; top: 342px; position: absolute; height: 46px; width: 131px" Text="Cancel" BackColor="#9966FF" OnClick="btnCancel_Click" />
        <asp:Button ID="btnDelete" runat="server" Font-Bold="True" Font-Size="Larger" OnClick="btnDelete_Click" style="z-index: 1; left: 81px; top: 344px; position: absolute; height: 47px; width: 131px; right: 1328px;" Text="Delete" BackColor="Red" />
        <asp:Label ID="lblDelete" runat="server" Font-Bold="True" ForeColor="Black" style="z-index: 1; left: 11px; top: 197px; position: absolute; height: 36px; width: 645px; bottom: 515px" Text="Are you sure that you want to Delete this Book off the system?"></asp:Label>
        
       
        
    </form>
</body>
</html>