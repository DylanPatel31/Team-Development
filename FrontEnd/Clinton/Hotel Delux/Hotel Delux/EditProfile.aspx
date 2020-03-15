<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="Hotel_Delux.EditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="/asset/css/bootstrap.min.css" rel="stylesheet" />
    <script src="/asset/js/jquery-3.4.1.min.js"></script>
    <script src="/asset/js/bootstrap.min.js"></script>
    <link href="/asset/css/stylesheet.css" rel="stylesheet" />
    <script src="/asset/js/main.js"></script>
    <title>Edit Profile</title>
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
        <li class="nav-item">
      <a class="nav-link" href="ViewRoom.aspx">View Room</a>
        </li>
        <li class="nav-item">
      <a class="nav-link active" href="EditProfile.aspx">Profile</a>
        </li>
        <li class="nav-item">
      <a class="nav-link" runat="server" onserverclick="logout_ServerClick">Logout</a>
    </li>
    </ul>
  </div>  
</nav>
    <form id="form1" runat="server" method="POST">
    <div class="container-fluid main-bg customer">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="form-div">
                    <h2 class="page-title-form">Edit Profile</h2>
                    
                <div class="form-group">
                    <label for="username">Username</label>
                    <input
                      type="text"
                      id="username"
                      name="username"
                      class="form-control" runat="server" readonly="true"
                      placeholder="minimum 4 alph-numeric"
                    />
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input
                      type="password"
                      id="password"
                      name="password"
                      class="form-control" runat="server"
                      placeholder="minimum 4 alph-numeric"
                    />
                </div>
                    <div class="form-group">
                    <label for="name">Name</label>
                    <input
                      type="text"
                      id="name"
                      name="name"
                      class="form-control" runat="server"
                      placeholder="minimum 4 alph-numeric"
                    />
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input
                      type="text"
                      id="address"
                      name="address"
                      class="form-control" runat="server"
                      placeholder="minimum 4 alph-numeric"
                    />
                </div>
                    <div class="form-group">
                    <label for="email">Email</label>
                    <input
                      type="email"
                      id="email"
                      name="email"
                      class="form-control" runat="server"
                    />
                </div>
                <div class="form-group">
                    <label for="state">State</label>
                    <input
                      type="text"
                      id="state"
                      name="state"
                      class="form-control" runat="server"
                      placeholder="minimum 4 alph-numeric"
                    />
                </div>
                    <div class="form-group">
                    <label for="mobile">Mobile</label>
                    <input
                      type="number"
                      id="mobile"
                      name="mobile"
                      class="form-control" runat="server"
                      placeholder="minimum 4 alph-numeric"
                    />
                </div>
                <div class="form-group text-center">
                    <asp:Button ID="btnSubmit" CssClass="btn btn-md btn-info" OnClick="btnSubmit_Click" OnClientClick=" return customerValidate()" runat="server" Text="Submit" />
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
         <div class="footer container-fluid text-center">
            &copy; Copyright reserved. Hotel Deluxe.
        </div>
    </form>
</body>
</html>
