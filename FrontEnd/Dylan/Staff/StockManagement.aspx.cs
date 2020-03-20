using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FrontEnd.Dylan.Staff
{
    public partial class StockManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //if this is the first appearence of this form
            if (IsPostBack == false)
            {
                //display all staff
                DisplayStock("");
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

            Int32 ShoeNo;
            //check the list has been clicked first
            if (lstStock.SelectedIndex != -1)
            {
                //get the primary key value from the list box
                ShoeNo = Convert.ToInt32(lstStock.SelectedValue);
                //redirect to the editing page
                Response.Redirect("DeleteStock.aspx?ShoeNo=" + ShoeNo);
            }
            else
            {
                //display an error
                lblError.Text = "You must select an item off the list first to delete it.";

            }

            //this comment below is an in-line comment and is used to comment on a single line
            //this line of code re-directs to the delete page


        }//

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //redirect to edit/add page
            Response.Redirect("AStaffMember.aspx?StaffNo= -1");
        }

        protected void btnDisplayAll_Click(object sender, EventArgs e)
        {
            //display all laptops
            DisplayStaff("");
        }

        Int32 DisplayStock(string ManufacturerNameFilter)
        {

            //var to store the primary key
            Int32 ShoeNo;
            //va to store the manufacturer
            string ManufacturerName;
            //var to store laptop name
            string ShoeName;
            //create an instance of the laptop collection class
            clsStockCollection Stock = new clsStockCollection();
            Stock.FilterByManufacturerName(ManufacturerNameFilter);
            //var to store the count of records
            Int32 RecordCount;
            //var to store the index for the loop
            Int32 Index = 0;
            //get the count of records
            RecordCount = Stock.Count;
            //clear the list box
            lstStock.Items.Clear();
            //while there are records to process
            while (Index < RecordCount)
            {
                //get the primary key
                ShoeNo = Stock.StockList[Index].ShoeNo;
                //get the manufacturer
                ManufacturerName = Stock.StockList[Index].ManufacturerName;
                //get the laptop name
                ShoeName = Stock.StockList[Index].ShoeName;
                //create a new entry for the list box
                ListItem NewEntry = new ListItem(ManufacturerName + " " + ShoeName, ShoeNo.ToString());
                //add the laptp to the list
                lstStock.Items.Add(NewEntry);
                //move the index to the next record
                Index++;


            }
            //return the count of records found
            return RecordCount;
        }//


    }
}