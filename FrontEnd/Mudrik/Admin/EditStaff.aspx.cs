using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace FrontEnd.Mudrik.Admin
{
    public partial class EditStaff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if this is the first appearance of this form
            if (IsPostBack == false)
            {
                //display all phones
                DisplayUser("");
            }

        }

     
        Int32 DisplayUser(string FirstNameFilter)
        {
            Int32 user_id;//var to store the primary key
            String firstName; //var to store the Device Name
            String surname; //var to store the Operating System
            ;//create an instance of the phone class
            Class_Library.clsUserCollection User = new Class_Library.clsUserCollection();
            User.FilterByFirstName(FirstNameFilter);
            Int32 RecordCount;//var to store the count of records
            Int32 Index = 0;//var to store the index for the loop
            RecordCount = User.Count;// get the count of records
            lstSearchResults.Items.Clear(); //clear the list box
            while (Index < RecordCount)//while there are records to process
            {
                user_id = User.UserList[Index].user_id;//get the primary key
                firstName = User.UserList[Index].firstName; //get the Device Name
                surname = User.UserList[Index].surname; //get the Operating System

                //create a new entry for the list box
                ListItem NewEntry = new ListItem(firstName + ", " + surname, user_id.ToString());
                lstSearchResults.Items.Add(NewEntry);//add the phone to the list
                Index++;//move the index to the next record
            }
            return RecordCount;//return the count of the records found
        }

       
}