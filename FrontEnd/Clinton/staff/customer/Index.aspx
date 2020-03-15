<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Hotel_Delux.staff.customer.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../asset/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../asset/js/jquery-3.4.1.min.js"></script>
    <script src="../../asset/js/bootstrap.min.js"></script>
    <link href="../../asset/css/stylesheet.css" rel="stylesheet" />
    <script src="../../asset/js/main.js"></script>
    <title>Customer List</title>
</head>
<body>
     <nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <a class="navbar-brand" href="../home.aspx">Hotel Deluxe</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="room-navbardrop" data-toggle="dropdown">
        Booking
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="../MakeBooking.aspx">Make Booking</a>
        <a class="dropdown-item" href="../CancelBooking.aspx">Cancel Booking</a>
      </div>
      </li>
        <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="customer-navbardrop" data-toggle="dropdown">
        Customer
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="AddCustomer.aspx">Add Customer</a>
        <a class="dropdown-item" href="Index.aspx">View Customer</a>
      </div>
      </li>
       <li class="nav-item">
      <a class="nav-link" href="../ViewRoom.aspx">View Room</a>
        </li>
         <li class="nav-item">
      <a class="nav-link" href="../ViewCustomerBooking.aspx">Customer Booking</a>
        </li>
        <li class="nav-item">
      <a class="nav-link" href="../Payment.aspx">Bill Payment</a>
        </li>
        <li class="nav-item">
      <a class="nav-link" runat="server" onserverclick="logout_ServerClick">Logout</a>
    </li>
    </ul>
  </div>  
</nav>
    <form id="form1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12">
                
                    <h2 class="page-title-form">Customer List</h2>
                <asp:GridView ID="GridView1" AllowPaging="true" PageIndex="4" runat="server" DataKeyNames="CustomerUsername,CustomerName" AutoGenerateColumns="false" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_RowSelecting" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing">  
                    <Columns>  
                        <asp:BoundField DataField="CustomerUsername" HeaderText="Username" />  
                        <asp:BoundField DataField="CustomerName" HeaderText="Name" />  
                        <asp:BoundField DataField="CustomerMobile" HeaderText="Mobile" />  
                        <asp:BoundField DataField="CustomerState" HeaderText="State" />
                        <asp:CommandField ShowSelectButton="true" />  
                        <asp:CommandField ShowEditButton="true" />  
                        <asp:CommandField ShowDeleteButton="true" /> </Columns>  
                    <PagerSettings FirstPageText="First" LastPageText="Last" />
                </asp:GridView>
            </div>
        </div>
    </div>
         <div class="overlay" id="overlay">
            <div class="pop-up" id="pop-up">
                <div class="window" id="window">
                    <p class="message" id="message"></p>
                    <div class="btn-div text-center">
                    <asp:Button ID="CloseBtn" CssClass="btn btn-md btn-warning" OnClientClick="closePopup()" runat="server" Text="Close" /></div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
