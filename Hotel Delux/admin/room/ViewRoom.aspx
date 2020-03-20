<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewRoom.aspx.cs" Inherits="Hotel_Delux.admin.room.ViewRoom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="../../asset/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../asset/js/jquery-3.4.1.min.js"></script>
    <script src="../../asset/js/bootstrap.min.js"></script>
    <link href="../../asset/css/stylesheet.css" rel="stylesheet" />
    <script src="../../asset/js/main.js"></script>
    <title>View Room</title>
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
        <a class="dropdown-item" href="../staff/AddStaff.aspx">Add Staff</a>
        <a class="dropdown-item" href="../staff/Index.aspx">Staff List</a>
      </div>
            </li>
        <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="room-navbardrop" data-toggle="dropdown">
        Room
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="AddRoom.aspx">Add Room</a>
        <a class="dropdown-item" href="Index.aspx">Room List</a>
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
            <div class="col-md-6 col-sm-6">
                <div class="form-div">
                    <h2 class="page-title-form">View Room</h2>
                     <div class="form-group">
                    <label for="roomNo">Room No</label>
                    <input
                      type="text"
                      id="roomNo"
                      name="roomNo" runat="server"
                      class="form-control" readonly="true"
                      placeholder="maximum 3 alph-numeric"
                    />
                </div>
                     <div class="form-group">
                    <label for="roomType">Room Type</label>
                    <input
                      type="text"
                      id="roomType"
                      name="roomType" runat="server" readonly="true"
                      class="form-control"
                    />
                </div>
                     <div class="form-group">
                    <label for="roomAvailable">Room Available</label>
                         <input
                             type="text"
                             id="roomAvailable"
                             name="roomAvailable" runat="server"
                             class="form-control" readonly="true" />
                       
                </div>
                     <div class="form-group">
                    <label for="roomPrice">Room Price</label>
                    <input
                      type="text"
                      id="roomPrice"
                      name="roomPrice" runat="server"
                      class="form-control" readonly="true"
                    />
                </div>                   
                    <div class="form-group">
                     
                     <asp:Button ID="btnBack" CssClass="btn btn-md btn-info" OnClick="btnBack_Click" runat="server" Text="Back" />
                </div>
                    
                </div>
            </div>
            <div class="col-sm-6 col-md-6">
                <div class="img-col">
                <a id="img1Link" name="img1Link" href="" target="_blank" runat="server"><img runat="server" id="img1" name="img1" class="imgRooms" /></a>
                <a id="img2Link" name="img2Link" href="" target="_blank" runat="server"><img runat="server" id="img2" name="img2" class="imgRooms" /></a>
                </div>
           </div>
        </div>
    </div>
    </form>
</body>
</html>
