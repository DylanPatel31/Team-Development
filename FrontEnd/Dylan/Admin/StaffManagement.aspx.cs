using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FrontEnd.Dylan.Admin
{
    public partial class Staff_Management : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if this is the first appearence of this form
            if (IsPostBack == false)
            {
                //display all staff
                DisplayStaff("");
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

            Int32 StaffNo;
            //check the list has been clicked first
            if (lstStaff.SelectedIndex != -1)
            {
                //get the primary key value from the list box
                StaffNo = Convert.ToInt32(lstStaff.SelectedValue);
                //redirect to the editing page
                Response.Redirect("Delete.aspx?StaffNo=" + StaffNo);
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
            Response.Redirect("AAStaffMember.aspx?StaffNo= -1");
        }

        protected void btnDisplayAll_Click(object sender, EventArgs e)
        {
            //display all laptops
            DisplayStaff("");
        }

        Int32 DisplayStaff(string LastNameFilter)
        {

            //var to store the primary key
            Int32 StaffNo;
            //va to store the manufacturer
            string LastName;
            //var to store laptop name
            string FirstName;
            //create an instance of the laptop collection class
            clsStaffCollection DB = new clsStaffCollection();
            DB.FilterByLastName(LastNameFilter);
            //var to store the count of records
            Int32 RecordCount;
            //var to store the index for the loop
            Int32 Index = 0;
            //get the count of records
            RecordCount = Staff.Count;
            //clear the list box
            lstStaff.Items.Clear();
            //while there are records to process
            while (Index < RecordCount)
            {
                //get the primary key
                StaffNo = Staff.StaffList[Index].StaffNo;
                //get the manufacturer
                LastName = Staff.StaffList[Index].LastName;
                //get the laptop name
                FirstName = Staff.StaffList[Index].FirstName;
                //create a new entry for the list box
                ListItem NewEntry = new ListItem(LastName + " " + FirstName, StaffNo.ToString());
                //add the laptp to the list
                lstStaff.Items.Add(NewEntry);
                //move the index to the next record
                Index++;


            }
            //return the count of records found
            return RecordCount;
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            //var to store th primary key value
            Int32 StaffNo;
            //check the list has been clicked first
            if (lstStaff.SelectedIndex != -1)
            {
                //get the primary key value from the list box
                StaffNo = Convert.ToInt32(lstStaff.SelectedValue);
                //redirect to the editing page
                Response.Redirect("AStaffMember.aspx?StaffNo=" + StaffNo);
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
            DisplayStaff(txtLastName.Text);
        }

      
    }

}
