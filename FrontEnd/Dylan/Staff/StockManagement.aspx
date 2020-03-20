<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockManagement.aspx.cs" Inherits="FrontEnd.Dylan.Staff.StockManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color: #C0C0C0">
    <form id="form1" runat="server">
    <div>
    <h1> Stock Management </h1>
    </div>
        <asp:ListBox ID="lstStock" runat="server" style="z-index: 1; left: 9px; top: 115px; position: absolute; height: 297px; width: 438px" Font-Names="Arial" ></asp:ListBox>
        <asp:TextBox ID="txtManufacturerName" runat="server" style="z-index: 1; left: 12px; top: 503px; position: absolute; height: 20px; width: 283px"></asp:TextBox>
        <p>
            &nbsp;</p>
        <asp:Label ID="lblManufacturerName" runat="server" style="z-index: 1; left: 12px; top: 430px; position: absolute; height: 27px; width: 381px; right: 629px; margin-bottom: 0px; font-weight: 700; color: #000000;" Text="Please enter the last name of the manufacturer" Font-Names="Cambria" Font-Size="Large"></asp:Label>
        <p>
            <asp:Button ID="btnApply" runat="server" style="z-index: 1; left: 442px; top: 452px; position: absolute; height: 39px; width: 130px; right: 1047px; font-weight: 700;" Text="Apply" OnClick="btnApply_Click" Font-Names="Arial" Font-Size="Medium" />
        </p>
        <asp:Button ID="btnDelete" runat="server"  style="z-index: 1; left: 243px; top: 626px; position: absolute; height: 30px; width: 90px; font-weight: 700;" Text="Delete" OnClick="btnDelete_Click1" Font-Names="Arial" Font-Size="Medium" />
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="btnDisplayAll" runat="server" style="z-index: 1; left: 442px; top: 508px; position: absolute; height: 39px; width: 130px; font-weight: 700; right: 1047px;" Text="Display All" OnClick="btnDisplayAll_Click" Font-Names="Arial" Font-Size="Medium" />
        </p>
        <asp:Button ID="btnAdd" runat="server" style="z-index: 1; left: 27px; top: 626px; position: absolute; width: 90px; height: 30px; font-weight: 700;" Text="Add" OnClick="btnAdd_Click" Font-Names="Arial" Font-Size="Medium" />
        <p>
            <asp:Button ID="btnEdit" runat="server" style="z-index: 1; top: 626px; position: absolute; height: 30px; width: 90px; left: 134px; font-weight: 700;" Text="Edit" OnClick="btnEdit_Click" Font-Names="Arial" Font-Size="Medium" />
        </p>
        <asp:Label ID="lblError" runat="server" style="z-index: 1; left: 16px; top: 573px; position: absolute; font-weight: 700;"></asp:Label>
        <p>
            &nbsp;</p>
      
    </form>
</body>
</html>