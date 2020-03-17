<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AStaffMember.aspx.cs" Inherits="FrontEnd.Dylan.Admin.AStaffMember" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <h1>Edit Or Add a Staff Member</h1>
        <asp:Label ID="lblTitle" runat="server" style="z-index: 1; left: 21px; top: 115px; position: absolute" Text="Title"></asp:Label>
        <asp:Label ID="lblDateOfBirth" runat="server" style="z-index: 1; left: 13px; top: 319px; position: absolute" Text="Date Of Birth"></asp:Label>
        <asp:Label ID="lblFirstName" runat="server" style="z-index: 1; left: 19px; top: 181px; position: absolute" Text="First Name"></asp:Label>
        <asp:Label ID="lblLastName" runat="server" style="z-index: 1; left: 17px; top: 256px; position: absolute" Text="Last Name"></asp:Label>
        <asp:Label ID="lblAddress1" runat="server" style="z-index: 1; left: 362px; top: 117px; position: absolute; bottom: 528px" Text="Address 1"></asp:Label>
        <asp:Label ID="lblAddress2" runat="server" style="z-index: 1; left: 367px; top: 180px; position: absolute" Text="Address 2"></asp:Label>
        <asp:Label ID="lblCity" runat="server" style="z-index: 1; left: 365px; top: 258px; position: absolute; bottom: 387px" Text="City"></asp:Label>
        <asp:Label ID="lblPostCode" runat="server" style="z-index: 1; left: 366px; top: 324px; position: absolute" Text="Post Code"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 104px; top: 117px; position: absolute; bottom: 525px"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" style="z-index: 1; left: 109px; top: 181px; position: absolute"></asp:TextBox>
        <asp:TextBox ID="TextBox3" runat="server" style="z-index: 1; left: 108px; top: 252px; position: absolute"></asp:TextBox>
        <asp:TextBox ID="TextBox4" runat="server" style="z-index: 1; left: 113px; top: 318px; position: absolute"></asp:TextBox>
        <asp:TextBox ID="TextBox5" runat="server" style="z-index: 1; left: 446px; top: 119px; position: absolute"></asp:TextBox>
        <asp:TextBox ID="TextBox6" runat="server" style="z-index: 1; left: 446px; top: 182px; position: absolute"></asp:TextBox>
        <asp:TextBox ID="TextBox7" runat="server" style="z-index: 1; left: 449px; top: 259px; position: absolute"></asp:TextBox>
        <asp:TextBox ID="TextBox8" runat="server" style="z-index: 1; left: 454px; top: 321px; position: absolute"></asp:TextBox>
        <asp:Label ID="lblError" runat="server" style="z-index: 1; left: 42px; top: 458px; position: absolute"></asp:Label>
        <asp:Button ID="btnOk" runat="server" style="z-index: 1; left: 366px; top: 415px; position: absolute; width: 60px" Text="OK" />
        <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" style="z-index: 1; left: 446px; top: 415px; position: absolute; width: 66px" Text="Cancel" />
    </form>
</body>
</html>
