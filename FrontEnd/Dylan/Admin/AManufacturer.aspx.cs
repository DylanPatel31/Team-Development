using Class_Library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FrontEnd.Dylan.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        Int32 ManufacturerNo;
        protected void Page_Load(object sender, EventArgs e)
        {
            //copy the data from the query string to the variable
            ManufacturerNo = Convert.ToInt32(Request.QueryString["ManufacturerNo"]);
            if (IsPostBack != true)
            {

                //if the LaptopNo is not -1 then display the data from the record
                if (ManufacturerNo != -1)
                {
                    //display the existing data
                    DisplayManufacturer(ManufacturerNo);
                }

            }
        }

        //this function displays the data for a staff member on the web form
        void DisplayManufacturer(Int32 ManufacturerNo)
        {
            //create an instance of the laptops class
            clsManufacturer Manufacturer = new clsManufacturer();
            //find the record we want to display
            Manufacturer.Find(ManufacturerNo);
            //display title
            txtManufacturerName.Text = Manufacturer.ManufacturerName;
            //display fname
            txtManufacturerTelephone.Text = Manufacturer.ManufacturerTelephone;
            //display lname
            txtManufacturerEmail.Text = Manufacturer.ManufacturerEmail;
           
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            //create an instance of the address page class
            clsManufacturer ThisManufacturer = new clsManufacturer();
            //var to store any error message
            string ErrorMessage;
            //test the data on teh web form
            ErrorMessage = ThisManufacturer.Valid(
                                                  txtManufacturerName.Text,
                                                  txtManufacturerTelephone.Text,
                                                  txtManufacturerEmail.Text);


            //if there is no error message
            if (ErrorMessage == "")
            {
                //create a new instance of the address book class
                clsManufacturerCollection Manufacturer = new clsManufacturerCollection();
                //do something with the data - insert or update
                //
                //if the Laptop Number is -1
                if (ManufacturerNo == -1)
                {
                    //copy the data from the interface to the object;
                    Manufacturer.ThisManufacturer.ManufacturerName = txtManufacturerName.Text;
                    Manufacturer.ThisManufacturer.ManufacturerTelephone = txtManufacturerTelephone.Text;
                    Manufacturer.ThisManufacturer.ManufacturerEmail = txtManufacturerEmail.Text;
                    //add the new record
                    Manufacturer.Add();

                }
                else
                {
                    //this is an existing record
                    //copy the data from the interface to the object
                    Manufacturer.ThisManufacturer.ManufacturerName = txtManufacturerName.Text;
                    Manufacturer.ThisManufacturer.ManufacturerTelephone = txtManufacturerTelephone.Text;
                    Manufacturer.ThisManufacturer.ManufacturerEmail = txtManufacturerEmail.Text;
                    //update the existing record
                    Manufacturer.Update();

                }
                //redircet bact to the main page
                Response.Redirect("ManufacturerManagement.aspx");
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
            Response.Redirect("ManufacturerManagement.aspx");
        }

    }
}