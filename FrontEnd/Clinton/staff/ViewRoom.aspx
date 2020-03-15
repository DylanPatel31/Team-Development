<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewRoom.aspx.cs" Inherits="Hotel_Delux.staff.ViewRoom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link href="../asset/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../asset/js/jquery-3.4.1.min.js"></script>
    <script src="../asset/js/bootstrap.min.js"></script>
    <link href="../asset/css/stylesheet.css" rel="stylesheet" />
    <script src="../asset/js/main.js"></script>
    <title>View Room</title>
</head>
<body>
    <nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <a class="navbar-brand" href="home.aspx">Hotel Deluxe</a>
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
        <a class="dropdown-item" href="MakeBooking.aspx">Make Booking</a>
        <a class="dropdown-item" href="CancelBooking.aspx">Cancel Booking</a>
      </div>
      </li>
         <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="customer-navbardrop" data-toggle="dropdown">
        Customer
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="customer/AddCustomer.aspx">Add Customer</a>
        <a class="dropdown-item" href="customer/Index.aspx">View Customer</a>
      </div>
      </li>
        <li class="nav-item">
      <a class="nav-link active" href="ViewRoom.aspx" >View Room</a>
        </li>
         <li class="nav-item">
      <a class="nav-link" href="ViewCustomerBooking.aspx">Customer Booking</a>
        </li>
        <li class="nav-item">
      <a class="nav-link" href="Payment.aspx">Bill Payment</a>
        </li>
        <li class="nav-item">
      <a class="nav-link" runat="server" onserverclick="logout_ServerClick">Logout</a>
    </li>
    </ul>
  </div>  
</nav>
    <form id="form1" runat="server">
    <div class="roomPage">
        <div class="rooomHeader">
            <div class="container">
                <h2 class="page-title">Rooms & Suites</h2>
            </div>
        </div>
    </div>
        <div class="main-block">        
            <div class="container main-block">
        
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="form-div">
                    <h2 class="page-title-form">View Room</h2>
                <div class="form-group">               
                    <label for="roomNo">Room No</label>
                    <input
                      type="text"
                      id="roomNo"
                      name="roomNo"
                      class="form-control" runat="server"
                      placeholder="minimum 4 alph-numeric"
                    />
                    </div>
                    <asp:Button ID="btnSearch" CssClass="btn btn-md btn-info" OnClick="btnSearch_Click" OnClientClick=" return searchRoomValidate()" runat="server" Text="Search" />
                    <div class="alert-info div-validate" id="div-error">
                        Sorry no records found.
                    </div>
            </div>
                </div>
        </div>
        <div class="row">

            <asp:Repeater ID="RepeaterDetails" runat="server">  
                <HeaderTemplate>
                    
                    </HeaderTemplate>
                <ItemTemplate>
                <div class="col-md-4 col-lg-4 col-sm-12 roomDesign">
                <a id="img1Link" name="img1Link" runat="server">
                    <img runat="server" id="img1" name="img1" src='<%#Eval("Thumbnail") %>' class="imgRooms" />
                    <h3 runat="server"><%#Eval("RoomType") %></h3>
                    <h6 runat="server">Room No: <%#Eval("RoomNo") %></h6>
                    <h6 runat="server">Room Price: <%#Eval("RoomPrice") %>/per night</h6>
                    <h6 runat="server">Room Availability: <%#Eval("RoomAvailability") %></h6>
                </a>
            </div>
                    </ItemTemplate>
                <FooterTemplate></FooterTemplate>           
            </asp:Repeater> 
            
        </div>
    </div></div>
        <div class="footer container-fluid text-center">
            &copy; Copyright reserved. Hotel Deluxe.
        </div>
    </form>
</body>
</html>
