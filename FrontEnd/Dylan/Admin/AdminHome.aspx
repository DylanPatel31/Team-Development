<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="FrontEnd.Dylan.Admin.AdminHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Home</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <h1>Admin Home</h1>
        <p>
            &nbsp;</p>
        <asp:Button ID="btnStockManagement" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" OnClick="btnStockManagement_Click" style="z-index: 1; left: 16px; top: 476px; position: absolute; height: 64px; width: 229px" Text="Stock Management" />
        <p>
            <asp:Button ID="btnManufacturerManagement" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" OnClick="btnManufacturerManagement_Click" style="z-index: 1; left: 13px; top: 271px; position: absolute; height: 67px; width: 229px; margin-bottom: 0px" Text="Manufacturer Management" />
        </p>
        <p>
            <a href="SneakerSelectHome.html" type="button" id"Back">Back</a>
        </p>
            <asp:Button ID="btnStaffManagement" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" OnClick="btnStaffManagement_Click" style="z-index: 1; left: 14px; top: 374px; position: absolute; height: 64px; width: 229px" Text="Staff Management" />
    </form>
</body>
</html>

