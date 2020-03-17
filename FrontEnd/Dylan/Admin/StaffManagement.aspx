<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffManagement.aspx.cs" Inherits="FrontEnd.Dylan.Admin.Staff_Management" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <h1>Staff Management</h1>
        <asp:ListBox ID="lstStaff" runat="server" style="z-index: 1; left: 10px; top: 104px; position: absolute; height: 255px; width: 363px"></asp:ListBox>
        <asp:TextBox ID="lblLastName" runat="server" style="z-index: 1; left: 11px; top: 385px; position: absolute; width: 167px; right: 1299px">Please Enter Last Name</asp:TextBox>
        <asp:Button ID="btnApply" runat="server" style="z-index: 1; left: 311px; top: 387px; position: absolute; width: 60px" Text="Apply" />
        <asp:Button ID="btnDisplayAll" runat="server" style="z-index: 1; left: 280px; top: 444px; position: absolute" Text="Display All" />
        <asp:Button ID="btnAdd" runat="server" style="z-index: 1; left: 28px; top: 527px; position: absolute; width: 60px" Text="Add" OnClick="btnAdd_Click" />
        <asp:Button ID="btnEdit" runat="server" style="z-index: 1; top: 527px; position: absolute; width: 60px; left: 102px" Text="Edit" OnClick="btnEdit_Click" />
        <asp:Button ID="btnDelete" runat="server" style="z-index: 1; left: 176px; top: 528px; position: absolute; width: 60px" Text="Delete" OnClick="btnDelete_Click" />
        <asp:Label ID="lblError" runat="server" style="z-index: 1; left: 14px; top: 478px; position: absolute"></asp:Label>
    </form>
</body>
</html>
