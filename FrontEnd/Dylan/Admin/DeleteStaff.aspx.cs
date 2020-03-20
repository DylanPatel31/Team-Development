using Class_Library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace FrontEnd.Dylan.Admin
{
    public partial class DeleteStaff : System.Web.UI.Page
    {
        Int32 StaffNo;
        protected void Page_Load(object sender, EventArgs e)
        {
            //copy the data from the query string to the variable
            StaffNo = Convert.ToInt32(Request.QueryString["StaffNo"]);
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            //this line of code re-directs back to the main page
            Response.Redirect("StaffManagement.aspx");

        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            ///this function handles the click event of the Yes button

            //create an instance of the class clsLaptopCollection called MyLaptop
            clsStaffCollection Staff = new clsStaffCollection();
            //declare a boolean variable to record success of the delete operation
            Boolean Found;
            //try and find the record to delete
            Found = Staff.ThisStaff.Find(StaffNo);
            //if the record is found
            if (Found)
            {
                //invoke the delete method of the object
                Staff.Delete();
            }
            //redircet bact to the main page
            Response.Redirect("StaffManagement.aspx");

        }
    }
}