using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FrontEnd.Dylan.Admin
{
    Int32 ManufacturerNo;
    public partial class DeleteManufacturer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //copy the data from the query string to the variable
            ManufacturerNo = Convert.ToInt32(Request.QueryString["ManufacturerNo"]);
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            //this line of code re-directs back to the main page
            Response.Redirect("ManufacturerManagement.aspx");

        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            ///this function handles the click event of the Yes button

            //create an instance of the class clsLaptopCollection called MyLaptop
            clsManufacturerCollection Manufacturer = new clsManufacturerCollection();
            //declare a boolean variable to record success of the delete operation
            Boolean Found;
            //try and find the record to delete
            Found = Manufacturer.ThisStaff.Find(ManufacturerNo);
            //if the record is found
            if (Found)
            {
                //invoke the delete method of the object
                Manufacturer.Delete();
            }
            //redircet bact to the main page
            Response.Redirect("ManufacturerManagement.aspx");

        }
    }
}