<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCustomerBooking.aspx.cs" Inherits="Hotel_Delux.staff.CustomerBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="../asset/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../asset/js/jquery-3.4.1.min.js"></script>
    <script src="../asset/js/bootstrap.min.js"></script>
    <link href="../asset/css/stylesheet.css" rel="stylesheet" />
    <script src="../asset/js/main.js"></script>
    <title>Customer Booking</title>
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
      <a class="nav-link active" href="ViewCustomerBooking.aspx">Customer Booking</a>
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
        <div class="viewBooking">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12">
                
                   
                    <div class="viewBooking-form">
                     <h2 class="page-title-form">View Customer Booking</h2>
                    
                <div class="form-group">
                    <label for="username">Customer username</label>
                    <input
                      type="text"
                      id="username"
                      name="username"
                      class="form-control" runat="server"
                      placeholder="minimum 4 alph-numeric"
                    />
                </div>
                
                <div class="form-group text-center">
                    <asp:Button ID="btnSubmit" CssClass="btn btn-md btn-info" OnClick="btnSubmit_Click" OnClientClick=" return usernameValidate()" runat="server" Text="Submit" />
                    <asp:Button ID="btnReset" CssClass="btn btn-md btn-info" OnClick="btnReset_Click" runat="server" Text="Reset" />
                </div>
                        
                    <div class="alert-info div-validate" id="div-validate">
                        Please fill all the red fields.
                    </div>
                    <div class="alert-info div-validate" id="div-error">
                        Sorry no records found.
                    </div>
                            
                    </div>
                
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-lg-12 col-sm-12">
                <div class="custom-table">
                    
                <asp:Repeater ID="rptBookings" runat="server" OnItemCommand="ClientNameClicked">
                    <HeaderTemplate>
                        <h3 class="text-center title"> Booking Details</h3>
                        <table cellspacing="0" rules="all" border="1" class="table-striped custom-table">
                            <tr>
                                <th scope="col" style="width: 80px">
                                    Customer Name
                                </th>
                                <th scope="col" style="width: 80px">
                                    Customer Username
                                </th>
                                <%--<th scope="col" style="width: 80px">
                                    Customer Id
                                </th--%>>
                               <%-- <th scope="col" style="width: 100px">
                                    Booking Date
                                </th>--%>
                                <th scope="col" style="width: 100px">
                                    Checkin Date
                                </th><th scope="col" style="width: 100px">
                                    Checkout Date
                                </th>
                                <th scope="col" style="width: 70px">
                                    No of Person
                                </th>
                                 <th scope="col" style="width: 100px">
                                    Cancel Status
                                </th>
                                <th scope="col" style="width: 70px">
                                    Room ID
                                </th>
                               
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                               <asp:Label ID="CustomerName" name="CustomerName" runat="server" Text="" OnDataBinding="CustomerName_DataBinding" />
                            </td>
                            <td>
                               <asp:Label ID="CustomerUsername" name="CustomerUsername" runat="server" Text="" OnDataBinding="CustomerUsername_DataBinding" />
                            </td>
                           <%-- <td>
                                <asp:Label ID="CustomerId" runat="server" Text='<%# Eval("CustomerID") %>' />
                            </td>--%>
                           <%-- <td>
                                <asp:Label ID="BookingDate" runat="server" Text='<%# Eval("BookingDate") %>' />
                            </td>--%>
                            <td>
                                <asp:Label ID="CheckinDate" runat="server" Text='<%# Eval("InDate") %>' />
                            </td>
                            <td>
                                <asp:Label ID="CheckoutDate" runat="server" Text='<%# Eval("OutDate") %>' />
                            </td>
                            <td>
                                <asp:Label ID="NumberOfPerson" runat="server" Text='<%# Eval("NumberOfPerson") %>' />
                            </td>
                             <td>
                                <asp:Label ID="CancelStatus" runat="server" Text='<%# Eval("CancelStatus") %>' />
                            </td>
                            <td>
                                
                                <asp:LinkButton ID="btnClientName"  CommandName="Click" CommandArgument='<%#Eval("RoomID")%>' Text='<%#Eval("RoomID")%>' runat="server"/>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>






                    <asp:Repeater ID="rptRoom" runat="server" >
                    <HeaderTemplate>
                        <h3 class="text-center title"> Room Details</h3>
                        <table cellspacing="0" rules="all" border="1" class="table-striped custom-table">
                            <tr>
                               <%-- <th scope="col" style="width: 80px">
                                    Customer Username
                                </th>--%>
                                <th scope="col" style="width: 80px">
                                    Room No
                                </th>
                                <th scope="col" style="width: 100px">
                                    Room Type
                                </th>
                                <th scope="col" style="width: 100px">
                                    Room Available
                                </th><th scope="col" style="width: 100px">
                                    Room Price
                                </th>
                              
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <%--<td>
                               <asp:Label ID="CustomerUsername" name="CustomerUsername" runat="server"/>
                            </td>--%>
                            <td>
                                <asp:Label ID="RoomNo" runat="server" Text='<%# Eval("RoomNo") %>' />
                            </td>
                            <td>
                                <asp:Label ID="RoomType" runat="server" Text='<%# Eval("RoomType") %>' />
                            </td>
                            <td>
                                <asp:Label ID="RoomAvailability" runat="server" Text='<%# Eval("RoomAvailability") %>' />
                            </td>
                            <td>
                                <asp:Label ID="RoomPrice" runat="server" Text='<%# Eval("RoomPrice") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>




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
                </div>
    </form>

    <div class="footer container-fluid text-center">
            &copy; Copyright reserved. Hotel Deluxe.
        </div>
</body>
</html>
