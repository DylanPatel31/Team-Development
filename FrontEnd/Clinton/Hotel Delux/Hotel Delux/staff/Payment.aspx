<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Hotel_Delux.staff.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <link href="../asset/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../asset/js/jquery-3.4.1.min.js"></script>
    <script src="../asset/js/bootstrap.min.js"></script>
    <link href="../asset/css/stylesheet.css" rel="stylesheet" />
    <script src="../asset/js/main.js"></script>
    <script src="../asset/js/main.js"></script>
    <title>Bill Payment</title>
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
      <a class="nav-link" href="ViewRoom.aspx">View Room</a>
        </li>
         <li class="nav-item">
      <a class="nav-link" href="ViewCustomerBooking.aspx">Customer Booking</a>
        </li>
        <li class="nav-item">
      <a class="nav-link active" href="Payment.aspx">Bill Payment</a>
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
            <div class="col-md-12 col-sm-12">
                <div class="form-div">
                    <h2 class="page-title-form">Bill Payment</h2>
                     <div class="form-group">
                    <label for="username">Customer Username</label>
                    <input
                      type="text"
                      id="username"
                      name="username"
                      class="form-control" runat="server"
                      placeholder="minimum 4 alph-numeric"
                    />
                </div>
                   
                     <div class="form-group">
                    <label for="roomNo">Room No</label>
                    <input
                      type="text"
                      id="roomNo"
                      name="roomNo" runat="server"
                      class="form-control"
                      placeholder="should be 3 alpha-numeric"
                    />
                </div>
                    <div class="form-group">
                     <asp:Button ID="btnCheckBooking" CssClass="btn btn-md btn-info" OnClick="btnCheckBooking_Click" OnClientClick=" return checkBookingValidate()" runat="server" Text="Check Booking" />
                </div>
                    <div class="form-group">
                    <label for="noOfPerson">Number of person</label>
                    <input
                      type="text"
                      id="noOfPerson"
                      name="noOfPerson" runat="server" readonly="true"
                      class="form-control"
                      placeholder=""
                    />
                </div>
                     <div class="form-group">
                    <label for="inDate">In date</label>
                    <input
                      type="text"
                      id="inDate"
                      name="inDate" runat="server"
                      class="form-control" readonly="true"
                      placeholder="mm/dd/yy"
                    />
                </div>

                     <div class="form-group">
                    <label for="outDate">Out Date</label>
                    <input
                      type="text"
                      id="outDate"
                      name="outDate" runat="server"
                      class="form-control"
                      placeholder="mm/dd/yy" readonly="true"
                    />
                </div>
                     <div class="form-group">
                    <label for="otherServices">Other Services</label>
                    <input
                      type="text"
                      id="otherServices"
                      name="otherServices" runat="server"
                      class="form-control"
                      placeholder=""
                    />
                </div>
                     <div class="form-group">
                    <label for="roomBill">Room Bill</label>
                    <input
                      type="text"
                      id="roomBill"
                      name="roomBill" runat="server"
                      class="form-control"
                      placeholder="room bill" readonly="true"
                    />
                </div>
                     <div class="form-group">
                    <label for="totalBill">Total Bill</label>
                    <input
                      type="text"
                      id="totalBill"
                      name="totalBill" runat="server"
                      class="form-control"
                    />
                </div>
                    <div class="form-group">
                     <asp:Button ID="btnSubmit" CssClass="btn btn-md btn-info" OnClick="btnSubmit_Click" OnClientClick=" return billPaymentValidate()" runat="server" Text="Pay" Enabled="false" />
                        <asp:Button ID="btnBack" CssClass="btn btn-md btn-info" OnClick="btnBack_Click" runat="server" Text="Back" />
                </div>
                    <div class="alert-info div-validate" id="div-validate">
                        Please fill all the red fields.
                    </div>

                </div>
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
    <div class="footer container-fluid text-center">
            &copy; Copyright reserved. Hotel Deluxe.
        </div>
</body>
</html>
