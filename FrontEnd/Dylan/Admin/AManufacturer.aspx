<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AManufacturer.aspx.cs" Inherits="FrontEnd.Dylan.Admin.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <h1>Edit Or Add a Manufacturer</h1>
        <asp:Label ID="lblManufacturerName" runat="server" style="z-index: 1; left: 21px; top: 115px; position: absolute" Text="Manufacturer Name"></asp:Label>
        <asp:Label ID="lblManufacturerTelephone" runat="server" style="z-index: 1; left: 19px; top: 247px; position: absolute" Text="Manufacturer Telephone"></asp:Label>
        <asp:Label ID="lblManufacturerEmail" runat="server" style="z-index: 1; left: 19px; top: 181px; position: absolute" Text="Manufacturer Email"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 162px; top: 114px; position: absolute; bottom: 528px"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" style="z-index: 1; left: 158px; top: 180px; position: absolute"></asp:TextBox>
        <asp:TextBox ID="TextBox4" runat="server" style="z-index: 1; left: 216px; top: 248px; position: absolute"></asp:TextBox>
        <asp:Label ID="lblError" runat="server" style="z-index: 1; left: 36px; top: 391px; position: absolute"></asp:Label>
        <asp:Button ID="btnOk" runat="server" style="z-index: 1; left: 343px; top: 317px; position: absolute; width: 60px" Text="OK" />
        <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" style="z-index: 1; left: 442px; top: 322px; position: absolute; width: 66px" Text="Cancel" />
    </form>
</body>
</html>
