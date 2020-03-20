using Class_Library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FrontEnd.Dylan.Admin
{
    public partial class ManufacturerManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if this is the first appearence of this form
            if (IsPostBack == false)
            {
                //display all staff
                DisplayManufacturer("");
            }
        }

        protected void btnDelete_Click1(object sender, EventArgs e)
        {
            //these are comments, the computer ignores them but they help us understand what the code is doing 
            ///there are two sorts of comments, block comments like this one that contain a general description 
            ///of what the code will do. Note that in this case i used three /// try it and see what happens every
            //////time you press return .
            ///
            /// this section of code will contain the presentation layers code that allows us to delete a record 
            //var to store th primary key value

            Int32 ManufacturerNo;
            //check the list has been clicked first
            if (lstManufacturer.SelectedIndex != -1)
            {
                //get the primary key value from the list box
                ManufacturerNo = Convert.ToInt32(lstManufacturer.SelectedValue);
                //redirect to the editing page
                Response.Redirect("DeleteManufacturer.aspx?ManufacturerNo=" + ManufacturerNo);
            }
            else
            {
                //display an error
                lblError.Text = "You must select an item off the list first to delete it.";

            }

            //this comment below is an in-line comment and is used to comment on a single line
            //this line of code re-directs to the delete page


        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //redirect to edit/add page
            Response.Redirect("AManufacturer.aspx?ManufacturerNo= -1");
        }

        protected void btnDisplayAll_Click(object sender, EventArgs e)
        {
            //display all laptops
            DisplayManufacturer("");
        }

        Int32 DisplayManufacturer(string ManufacturerNameFilter)
        {

            //var to store the primary key
            Int32 ManufacturerNo;
            //va to store the manufacturer
            string ManufacturerName;
            //var to store laptop name
            string ManufacturerTelephone;
            //create an instance of the laptop collection class
            clsManufacturerCollection Manufacturer = new clsManufacturerCollection();
            Manufacturer.FilterByManufacturerName(ManufacturerNameFilter);
            //var to store the count of records
            Int32 RecordCount;
            //var to store the index for the loop
            Int32 Index = 0;
            //get the count of records
            RecordCount = Manufacturer.Count;
            //clear the list box
            lstManufacturer.Items.Clear();
            //while there are records to process
            while (Index < RecordCount)
            {
                //get the primary key
                ManufacturerNo = Manufacturer.ManufacturerList[Index].ManufacturerNo;
                //get the manufacturer
                ManufacturerName = Manufacturer.ManufacturerList[Index].ManufacturerName;
                //get the laptop name
                ManufacturerTelephone = Manufacturer.ManufacturerList[Index].ManufacturerTelephone;
                //create a new entry for the list box
                ListItem NewEntry = new ListItem(ManufacturerName + " " + ManufacturerTelephone, ManufacturerNo.ToString());
                //add the laptp to the list
                lstManufacturer.Items.Add(NewEntry);
                //move the index to the next record
                Index++;


            }
            //return the count of records found
            return RecordCount;
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            //var to store th primary key value
            Int32 ManufacturerNo;
            //check the list has been clicked first
            if (lstManufacturer.SelectedIndex != -1)
            {
                //get the primary key value from the list box
                ManufacturerNo = Convert.ToInt32(lstManufacturer.SelectedValue);
                //redirect to the editing page
                Response.Redirect("AManufacturer.aspx?ManufacturerNo=" + ManufacturerNo);
            }
            else
            {
                //display an error
                lblError.Text = "You must select an item off the list first to edit it.";

            }

        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            //display only the addresses matching the text in the manufacturer text box
            DisplayManufacturer(txtManufacturer.Text);
        }

    }
}
}