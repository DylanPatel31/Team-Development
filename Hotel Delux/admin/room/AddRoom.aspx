<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddRoom.aspx.cs" Inherits="Hotel_Delux.admin.room.AddRoom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"> <link href="../../asset/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../asset/js/jquery-3.4.1.min.js"></script>
    <script src="../../asset/js/bootstrap.min.js"></script>
    <link href="../../asset/css/stylesheet.css" rel="stylesheet" />
    <script src="../../asset/js/main.js"></script>

    <title>Add Room</title>
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
            <div class="col-md-12 col-sm-12">
                <div class="form-div">
                    <h2 class="page-title-form">Add Room</h2>
                     <div class="form-group">
                    <label for="roomNo">Room No</label>
                    <input
                      type="text"
                      id="roomNo"
                      name="roomNo" runat="server"
                      class="form-control"
                      placeholder="maximum 3 alph-numeric"
                    />
                </div>
                     <div class="form-group">
                    <label for="roomType">Room Type</label>
                    <input
                      type="text"
                      id="roomType"
                      name="roomType" runat="server"
                      class="form-control"
                    />
                </div>
                     <div class="form-group">
                    <label for="roomAvailable">Room Available</label>
                         <select id="roomAvailable" name="roomAvailable" runat="server">
                              <option value="Yes">Yes</option>
                              <option value="No">No</option>
                           </select>
                </div>
                     <div class="form-group">
                    <label for="roomPrice">Room Price</label>
                    <input
                      type="text"
                      id="roomPrice"
                      name="roomPrice" runat="server"
                      class="form-control"
                    />
                </div>
                     <div class="form-group">
                     <label for="uploadFile1">Upload images</label>
                         <asp:FileUpload ID="uploadFile1" runat="server" cssClass="form-control" accept=".png,.jpg,.jpeg,.gif"/>    
                </div>
                    <div class="form-group">
                     <label for="uploadFile2">Upload images</label>
                         <asp:FileUpload ID="uploadFile2" runat="server" cssClass="form-control" accept=".png,.jpg,.jpeg,.gif"/>
                </div>
                    
                    <div class="form-group">
                     <asp:Button ID="btnSave" CssClass="btn btn-md btn-info" OnClick="btnSubmit_Click" OnClientClick=" return addRoomValidate()" runat="server" Text="Save" />
                     <asp:Button ID="btnReset" CssClass="btn btn-md btn-info" OnClick="btnReset_Click" runat="server" Text="Reset" />
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
</body>
</html>
