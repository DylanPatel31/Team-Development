<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Hotel_Delux.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="/asset/css/bootstrap.min.css" rel="stylesheet" />
    <script src="/asset/js/jquery-3.4.1.min.js"></script>
    <script src="/asset/js/bootstrap.min.js"></script>
    <link href="/asset/css/stylesheet.css" rel="stylesheet" />
    <script src="/asset/js/main.js"></script>
    <title>Customer Login Page</title>
</head>
<body>
    <form id="form1" runat="server" method="POST">
    <div class="container-fluid main-bg customer">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="form-div">
                    <h2 class="page-title-form">Customer Login</h2>
                    
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
                <div class="form-group text-center">
                    <asp:Button ID="btnHome" CssClass="btn btn-md btn-info" OnClick="btnHome_Click" runat="server" Text="Home Page" />
                    <asp:Button ID="btnSubmit" CssClass="btn btn-md btn-info" OnClick="btnSubmit_Click" OnClientClick=" return validate()" runat="server" Text="Login" />
                    <asp:Button ID="btnSignup" CssClass="btn btn-md btn-info" OnClick="btnSignup_Click" runat="server" Text="Signup" />
                </div>
                        <div class="alert-info div-error" id="div-error">
                        Username or password is incorrect.
                    </div>
                    <div class="alert-info div-validate" id="div-validate">
                        Please fill all the red fields.
                    </div>
                            
                    </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>