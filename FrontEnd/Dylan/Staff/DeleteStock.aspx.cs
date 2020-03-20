using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FrontEnd.Dylan.Staff
{
    public partial class DeleteStock : System.Web.UI.Page
    {
        Int32 ShoeNo;
        protected void Page_Load(object sender, EventArgs e)
        {
            //copy the data from the query string to the variable
            ShoeNo = Convert.ToInt32(Request.QueryString["ShoeNo"]);
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            //this line of code re-directs back to the main page
            Response.Redirect("ShoeManagement.aspx");

        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            ///this function handles the click event of the Yes button

            //create an instance of the class clsLaptopCollection called stock
            clsStockCollection Shoe = new clsStockCollection();
            //declare a boolean variable to record success of the delete operation
            Boolean Found;
            //try and find the record to delete
            Found = Shoe.ThisStock.Find(ShoeNo);
            //if the record is found
            if (Found)
            {
                //invoke the delete method of the object
                Shoe.Delete();
            }
            //redircet bact to the main page
            Response.Redirect("ShoeManagement.aspx");

        }
    }
    }
}