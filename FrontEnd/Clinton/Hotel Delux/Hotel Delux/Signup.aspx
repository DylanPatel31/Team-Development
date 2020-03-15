<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Hotel_Delux.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="../asset/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../asset/js/jquery-3.4.1.min.js"></script>
    <script src="../asset/js/bootstrap.min.js"></script>
    <link href="../asset/css/stylesheet.css" rel="stylesheet" />
    <script src="../asset/js/main.js"></script>
    <title>Customer Signup Page</title>
</head>
<body>
     <form id="form1" runat="server" method="POST">
    <div class="container-fluid main-bg customer">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="form-div">
                    <h2 class="page-title-form">Customer Signup</h2>
                    
                <div class="form-group">
                    <label for="username">Username</label>
                    <input
                      type="text"
                      id="username"
                      name="username"
                      class="form-control" runat="server"
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
                    <asp:Button ID="btnSubmit" CssClass="btn btn-md btn-info" OnClick="btnSubmit_Click" OnClientClick=" return addCustomerValidate()" runat="server" Text="Signup" />
                    <asp:Button ID="btnLogin" CssClass="btn btn-md btn-info" OnClick="btnLogin_Click" runat="server" Text="Login" />
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
