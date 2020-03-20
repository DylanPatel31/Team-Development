<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Hotel_Delux.admin.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../asset/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../asset/js/jquery-3.4.1.min.js"></script>
    <script src="../asset/js/bootstrap.min.js"></script>
    <link href="../asset/css/stylesheet.css" rel="stylesheet" />
    <script src="../asset/js/main.js"></script>
    <title>Home</title>
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
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Staff
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="staff/AddStaff.aspx">Add Staff</a>
        <a class="dropdown-item" href="staff/Index.aspx">Staff List</a>
      </div>
            </li>
        <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="room-navbardrop" data-toggle="dropdown">
        Room
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="room/AddRoom.aspx">Add Room</a>
        <a class="dropdown-item" href="room/Index.aspx">View Room List</a>
      </div>
      </li>
        <li class="nav-item">
      <a class="nav-link" runat="server" onserverclick="logout_ServerClick">Logout</a>
    </li>
    </ul>
  </div>  
</nav>
     <form id="form1" runat="server">
     <div class="roomPage customer-home">
        <div class="rooomHeader">
            <div class="container">
                <h2 class="page-title">Welcome to Hotel Deluxe</h2>
            </div>
        </div>
    </div>
    </form>
      <div class="footer container-fluid text-center">
            &copy; Copyright reserved. Hotel Deluxe.
        </div>
</body>
</html>
