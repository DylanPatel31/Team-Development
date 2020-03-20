using Class_Library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace FrontEnd.Dylan.Admin
{
    public partial class AStaffMember : System.Web.UI.Page
    {
        Int32 StaffNo;
        protected void Page_Load(object sender, EventArgs e)
        {
            //copy the data from the query string to the variable
            StaffNo = Convert.ToInt32(Request.QueryString["StaffNo"]);
            if (IsPostBack != true)
            {

                //if the LaptopNo is not -1 then display the data from the record
                if (StaffNo != -1)
                {
                    //display the existing data
                    DisplayStaff(StaffNo);
                }

            }
        }
        //this function displays the data for a staff member on the web form
        void DisplayStaff(Int32 StaffNo)
        {
            //create an instance of the laptops class
            clsStaff Staff = new clsStaff();
            //find the record we want to display
            Staff.Find(StaffNo);
            //display title
            txtTitle.Text = Staff.Title;
            //display fname
            txtFirstName.Text = Staff.FirstName;
            //display lname
            txtLastName.Text = Staff.LastName;
            //display dob
            txtDateofBirth.Text = Staff.DateofBirth;
            //display the add1
            txtAddress1.Text = Staff.Address1;
            //display the add2
            txtAddress2.Text = Staff.Address2;
            // city
            txtCity.Text = Staff.City;
            // postcode
            txtPostCode.Text = Staff.PostCode;
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            //create an instance of the address page class
            clsStaff ThisStaff = new clsStaff();
            //var to store any error message
            string ErrorMessage;
            //test the data on teh web form
            ErrorMessage = ThisStaff.Valid(
                                                  txtTitle.Text,
                                                  txtFirstName.Text,
                                                  txtLastName.Text,
                                                  txtDateofBirth.Text,
                                                  txtAddress1.Text,
                                                  txtAddress2.Text,
                                                  txtCity.Text,
                                                  txtPostCode.Text);


            //if there is no error message
            if (ErrorMessage == "")
            {
                //create a new instance of the address book class
                clsStaffCollection Staff = new clsStaffCollection();
                //do something with the data - insert or update
                //
                //if the Laptop Number is -1
                if (StaffNo == -1)
                {
                    //copy the data from the interface to the object;
                    Staff.ThisStaff.Title = txtTitle.Text;
                    Staff.ThisStaff.FirstName = txtFirstName.Text;
                    Staff.ThisStaff.LastName = txtLastName.Text;
                    Staff.ThisStaff.DateofBirth = txtDateofBirth.Text;
                    Staff.ThisStaff.Address1 = txtAddress1.Text;
                    Staff.ThisStaff.Address2 = txtAddress2.Text;
                    Staff.ThisStaff.City = txtCity.Text;
                    Staff.ThisStaff.PostCode = txtPostCode.Text;
                    //add the new record
                    Staff.Add();

                }
                else
                {
                    //this is an existing record
                    //copy the data from the interface to the object
                    Staff.ThisStaff.Title = txtTitle.Text;
                    Staff.ThisStaff.FirstName = txtFirstName.Text;
                    Staff.ThisStaff.LastName = txtLastName.Text;
                    Staff.ThisStaff.DateofBirth = txtDateofBirth.Text;
                    Staff.ThisStaff.Address1 = txtAddress1.Text;
                    Staff.ThisStaff.Address2 = txtAddress2.Text;
                    Staff.ThisStaff.City = txtCity.Text;
                    Staff.ThisStaff.PostCode = txtPostCode.Text;
                    //update the existing record
                    Staff.Update();

                }
                //redircet bact to the main page
                Response.Redirect("StaffManagement.aspx");
            }
            else
            {
                //display the error message 
                lblError.Text = ErrorMessage;
            }

        }


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //redircet back to the main page
            Response.Redirect("StaffManagement.aspx");
        }
    }
}