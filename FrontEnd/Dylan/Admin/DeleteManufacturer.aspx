﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeleteManufacturer.aspx.cs" Inherits="FrontEnd.Dylan.Admin.DeleteManufacturer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="lblDeleteManufacturer" runat="server" style="z-index: 1; left: 28px; top: 94px; position: absolute; width: 259px" Text="Are you sure you want to delete this manufacturer?"></asp:Label>
        <asp:Button ID="btnYes" runat="server" OnClick="btnYes_Click" style="z-index: 1; left: 26px; top: 164px; position: absolute; width: 60px" Text="Yes" />
        <asp:Button ID="btnNo" runat="server" OnClick="btnNo_Click" style="z-index: 1; left: 134px; top: 163px; position: absolute; width: 60px" Text="No" />
        <asp:TextBox ID="txtManufacturerNo" runat="server" style="z-index: 1; left: 17px; top: 57px; position: absolute; width: 256px"></asp:TextBox>
        <asp:Label ID="lblError" runat="server" style="z-index: 1; left: 22px; top: 222px; position: absolute; width: 204px"></asp:Label>
    </form>
</body>
</html>
