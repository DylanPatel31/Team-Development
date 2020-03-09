<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" action="ViewFine.aspx">
    <div>
    
        <%
            //declare  variable to store fine id and bor_id
            string FineID = Request["btnPayFine"];
            string BorrowerID = Request["txtbor_id"];
            //data connection
            clsDataConnection DB = new clsDataConnection();
            //send the parameter to the DB
            DB.AddParameter("FineID", FineID);
            //execute the sproc
            DB.Execute("sproc_FineTable_PayOutstandingFine");


            //store bor id
            Response.Write("<input type='text' name='txtSearch2' value='"+ BorrowerID +"'/>");
             //redirect to previous page
            Response.Redirect("FinesManager.aspx");

             %>
            
    </div>
    </form>
</body>
</html>
