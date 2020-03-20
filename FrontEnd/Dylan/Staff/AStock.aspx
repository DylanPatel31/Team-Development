<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AStock.aspx.cs" Inherits="FrontEnd.Dylan.Staff.AStock" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <h1>Edit Or Add a Shoe</h1>
        <asp:Label ID="lblShoeName" runat="server" style="z-index: 1; left: 26px; top: 138px; position: absolute" Text="Shoe Name"></asp:Label>
        <asp:Label ID="lblMainColour" runat="server" style="z-index: 1; left: 24px; top: 192px; position: absolute; right: 976px;" Text="Main Colour"></asp:Label>
        <asp:Label ID="lblManufacturerName" runat="server" style="z-index: 1; left: 21px; top: 248px; position: absolute" Text="Manufacturer Name"></asp:Label>
        <asp:TextBox ID="txtShoeName" runat="server" style="z-index: 1; left: 156px; top: 136px; position: absolute; bottom: 506px"></asp:TextBox>
        <asp:TextBox ID="txtMainColour" runat="server" style="z-index: 1; left: 155px; top: 194px; position: absolute; bottom: 646px;"></asp:TextBox>
        <asp:TextBox ID="txtManufacturerName" runat="server" style="z-index: 1; left: 165px; top: 249px; position: absolute"></asp:TextBox>
        <asp:Label ID="lblError" runat="server" style="z-index: 1; left: 36px; top: 391px; position: absolute"></asp:Label>
        <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" style="z-index: 1; left: 434px; top: 349px; position: absolute; width: 66px" Text="Cancel" />
        <p>
        <asp:Button ID="btnOk" runat="server" style="z-index: 1; left: 338px; top: 347px; position: absolute; width: 60px" Text="OK" />
        </p>
        <asp:Label ID="lblPrice" runat="server" style="z-index: 1; left: 21px; top: 299px; position: absolute" Text="Price"></asp:Label>
        <asp:TextBox ID="txtPrice" runat="server" style="z-index: 1; left: 157px; top: 304px; position: absolute"></asp:TextBox>
    </form>
</body>
</html>
