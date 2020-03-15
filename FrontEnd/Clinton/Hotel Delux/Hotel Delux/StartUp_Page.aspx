<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StartUp_Page.aspx.cs" Inherits="Hotel_Delux.StartUp_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%-- <link href="/asset/css/bootstrap.min.css" rel="stylesheet" />
    <script src="/asset/js/jquery-3.4.1.min.js"></script>
    <script src="/asset/js/bootstrap.min.js"></script>--%>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="/asset/css/stylesheet.css" rel="stylesheet" />
    <script src="/asset/js/main.js"></script>
    <title>Customer Login Page</title>
</head>
<body>
   <form id="form1" runat="server" method="POST">
    <div class="container-fluid main-bg customer">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="form-div-startup">
                    <div class="form-group text-center">
                    <a runat="server" onserverclick="btnAdmin_Click">
                    <div class="home-page-div admin-startup">
                        <div class="left-side">
                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                        </div>
                        <div class="center-side">&nbsp;</div>
                        <div class="right-side">
                            <div class="text-center">
                                Admin
                            </div>
                        </div>
                    </div>
                        </a>
                    <a runat="server" onserverclick="btnStaff_Click">
                     <div class="home-page-div staff-startup">
                        <div class="left-side">
                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                        </div>
                         <div class="center-side">&nbsp;</div>
                        <div class="right-side">
                            <div class="text-center">
                                Staff
                            </div>
                        </div>
                    </div>
                        </a>
                    <a runat="server" onserverclick="btnCustomer_Click">
                     <div class="home-page-div customer-startup">
                        <div class="left-side">
                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                        </div>
                         <div class="center-side">&nbsp;</div>
                        <div class="right-side">
                            <div class="text-center">
                                Customer
                            </div>
                        </div>
                    </div>
                        </a>

                        <asp:Button ID="Button1" runat="server" Text="Main Home Page" BackColor="#FF6600" Height="38px" OnClick="Button1_Click1" ForeColor="White" />

                </div>
                        
                            
                    </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
