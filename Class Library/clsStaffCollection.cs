using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Class_Library
{
    public class clsStaffCollection
    {
        clsDataConnection DB = new clsDataConnection();
        //private dta member thisStaff
        clsStaff mThisStaff = new clsStaff();
        //private data member to connect to the database*/

        //constructor for the class
        public clsStaffCollection()
        {

        }


        //public property for the staff list
        public List<clsStaff> StaffList
        {
            get
            {
                List<clsStaff> mStaffList = new List<clsStaff>();
                //var to store the record count
                Int32 RecordCount = 0;
                //var for the index 
                Int32 Index = 0;
                RecordCount = DB.Count;
                //get the count of records 
                //while ther are records to process
                while (Index < RecordCount)
                {
                    //create a blank staff
                    clsStaff AStaff = new clsStaff();
                    //read in the fileds from teh current record
                    AStaff.StaffNo = Convert.ToInt32(DB.DataTable.Rows[Index]["StaffNo"]);
                    AStaff.Title = Convert.ToString(DB.DataTable.Rows[Index]["Title"]);
                    AStaff.FirstName = Convert.ToString(DB.DataTable.Rows[Index]["FirstName"]);
                    AStaff.LastName = Convert.ToString(DB.DataTable.Rows[Index]["LastName"]);
                    AStaff.DateofBirth = Convert.ToString(DB.DataTable.Rows[Index]["DateofBirth"]);
                    AStaff.Address1 = Convert.ToString(DB.DataTable.Rows[Index]["Address1"]);
                    AStaff.Address2 = Convert.ToString(DB.DataTable.Rows[Index]["Address2"]);
                    AStaff.City = Convert.ToString(DB.DataTable.Rows[Index]["City"]);
                    AStaff.PostCode = Convert.ToString(DB.DataTable.Rows[Index]["PostCode"]);
                    //add the record to the private data member
                    mStaffList.Add(AStaff);
                    //point at the next record
                    Index++;

                }
                //return the private data
                return mStaffList;
            }

        }


        //public property for count
        public int Count
        {
            get
            {
                //return the private data
                return DB.Count;
            }

        }

        //public property for ThisStaff
        public clsStaff ThisStaff
        {
            get
            {
                //return the private data
                return mThisStaff;
            }
            set
            {
                //set the private data
                mThisStaff = value;
            }
        }



        public Int32 Add()
        ///this function will add a new phone to the database
        ///it accepts a single parameter an object of type clsPhone
        ///once the record is added the function returns the rimary key value of the new record
        {
            //connect to the database
            clsDataConnection DB = new clsDataConnection();
            //add the parameters
            DB.AddParameter("@StaffNo", mThisStaff.StaffNo);
            DB.AddParameter("@Title", mThisStaff.Title);
            DB.AddParameter("@FirstName", mThisStaff.FirstName);
            DB.AddParameter("@LastName", mThisStaff.LastName);
            DB.AddParameter("@DateofBirth", mThisStaff.DateofBirth);
            DB.AddParameter("@Address1", mThisStaff.Address1);
            DB.AddParameter("@Address2", mThisStaff.Address2);
            DB.AddParameter("@City", mThisStaff.City);
            DB.AddParameter("@PostCode", mThisStaff.PostCode);

            //execute the stored procedure returning the primary key value of the new record
            return DB.Execute("sproc_tblStaff_Insert");
        }

        //this function defines the FilterByManufacturer method
        public void FilterByLastName(string LastName)
        // it accepts a single parameter Manufacturer and returns no value
        {
            //initialise the DBConnection
            DB = new clsDataConnection();
            //add the parameter data used by the stored procedure
            DB.AddParameter("@LastName", LastName);
            //execute the stored procedure to delete the laptop
            DB.Execute("sproc_FilterBy_StaffLastName");
        }

        public Boolean Delete()
        {
            ///this public function provides the functionality for the delete method

            try //try to delete the record
            {
                //create an instance of the data connection class called db
                clsDataConnection DB = new clsDataConnection();
                //add the staffno parameter passed to this function to the list of parameters to use in the database
                DB.AddParameter("@StaffNo", mThisStaff.StaffNo);
                //execute the stored procedure in the database
                DB.Execute("sproc_tblStaff_Delete");
                //set the return value for the function
                return true;
            }
            catch //do this only if the code above failed for some reason
            {
                //return back that there was an error
                return false;
            }


        }

        public void Update()
        {
            ///this function will update an existing phone to the databas
            ///it accepts a single parameter an object of type clsstaff
            ///the staffno property must have a valid value for this to work
            //connect to the database
            clsDataConnection DB = new clsDataConnection();
            //add the parameters
            DB.AddParameter("@StaffNo", mThisStaff.StaffNo);
            DB.AddParameter("@Title", mThisStaff.Title);
            DB.AddParameter("@FirstName", mThisStaff.FirstName);
            DB.AddParameter("@LastName", mThisStaff.LastName);
            DB.AddParameter("@DateofBirth", mThisStaff.DateofBirth);
            DB.AddParameter("@Address1", mThisStaff.Address1);
            DB.AddParameter("@Address2", mThisStaff.Address2);
            DB.AddParameter("@City", mThisStaff.City);
            DB.AddParameter("@PostCode", mThisStaff.PostCode);
            //execute the query
            DB.Execute("sproc_tblStaff_Update");
        }
    }
}
