<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewStaff.aspx.cs" Inherits="Hotel_Delux.admin.staff.ViewStaff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../asset/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../asset/js/jquery-3.4.1.min.js"></script>
    <script src="../../asset/js/bootstrap.min.js"></script>
    <link href="../../asset/css/stylesheet.css" rel="stylesheet" />
    <script src="../../asset/js/main.js"></script>
    <title>View Staff</title>
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
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Staff
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="AddStaff.aspx">Add Staff</a>
        <a class="dropdown-item" href="Index.aspx">Staff List</a>
      </div>
            </li>
        <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="room-navbardrop" data-toggle="dropdown">
        Room
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="../room/AddRoom.aspx">Add Room</a>
        <a class="dropdown-item" href="../room/Index.aspx">Room List</a>
      </div>
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
                    <h2 class="page-title-form">View Staff</h2>
                    <div class="form-group">
                    <label for="username">Username</label>
                    <input
                      type="text"
                      id="username"
                      name="username" runat="server"
                      class="form-control"
                      placeholder="minimum 4 alph-numeric" readonly="true"
                    />
                </div>
                     <div class="form-group">
                    <label for="name">Name</label>
                    <input
                      type="text"
                      id="name"
                      name="name" runat="server"
                      class="form-control"
                      placeholder="minimum 4 alph-numeric" readonly="true"
                    />
                </div>
                     
                     <div class="form-group">
                    <label for="password">Password</label>
                    <input
                      type="text"
                      id="password"
                      name="password" runat="server"
                      class="form-control"
                      placeholder="minimum 4 alph-numeric" readonly="true"
                    />
                </div>
                     <div class="form-group">
                    <label for="address">Address</label>
                    <input
                      type="text"
                      id="address"
                      name="address" runat="server"
                      class="form-control"
                      placeholder="minimum 4 alph-numeric" readonly="true"
                    />
                </div>
                     <div class="form-group">
                    <label for="mobile">Mobile</label>
                    <input
                      type="number"
                      id="mobile"
                      name="mobile" runat="server"
                      class="form-control"
                      placeholder="number should be like 03215515587" readonly="true"
                    />
                </div>
                     <div class="form-group">
                    <label for="email">Email</label>
                    <input
                      type="email"
                      id="email"
                      name="email" runat="server"
                      class="form-control"
                      placeholder="provide a valid email" readonly="true"
                    />
                </div>
                     <div class="form-group">
                    <label for="state">State</label>
                    <input
                      type="text"
                      id="state"
                      name="state" runat="server"
                      class="form-control" readonly="true"
                    />
                </div>
                    <div class="form-group">
                     <asp:Button ID="btnBack" CssClass="btn btn-md btn-info" OnClick="btnBack_Click" runat="server" Text="Back" />
                </div>

                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
