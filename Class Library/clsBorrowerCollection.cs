using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Class_Library
{
   public class clsBorrowerCollection
    {
        //private data member for the list
        List<clsBorrower> mBorrowerList = new List<clsBorrower>();
        //private data member this customer
        clsBorrower mThisBorrower = new clsBorrower();



        //public property for the customer list
        public List<clsBorrower> BorrowerList
        {
            get
            {
                //return the private data
                return mBorrowerList;

            }
            set
            {
                //set the private data
                mBorrowerList = value;
            }

        }

        //public property count       
        public int Count
        {
            get
            {
                //return count of the list
                return mBorrowerList.Count;
            }
            set
            {
                //later
            }
        }

        public clsBorrower ThisBorrower
        {
            get
            {
                //return the private data
                return mThisBorrower;
            }
            set
            {
                //set the private data
                mThisBorrower = value;
            }
        }






        public clsBorrowerCollection()
        {
            //var for the index
            Int32 Index = 0;
            //var to store the record count
            Int32 RecordCount = 0;
            //object for data connection
            clsDataConnection DB = new clsDataConnection();
            //execute the stored procodure
            DB.Execute("sproc_BorrowerTable_SelectAll");
            //get the count of records
            RecordCount = DB.Count;
            //while there are records to process
            while (Index < RecordCount)
            {
                //Create a blank Customer
                clsBorrower AnBorrower = new clsBorrower();
                AnBorrower.BorrowerID = Convert.ToInt32(DB.DataTable.Rows[Index]["BorrowerID"]);
                AnBorrower.FK_BorrowerTypeID = Convert.ToString(DB.DataTable.Rows[Index]["FK_BorrowerTypeID"]);
                AnBorrower.FirstName = Convert.ToString(DB.DataTable.Rows[Index]["FirstName"]);
                AnBorrower.LastName = Convert.ToString(DB.DataTable.Rows[Index]["LastName"]);
                AnBorrower.Email = Convert.ToString(DB.DataTable.Rows[Index]["Email"]);
                AnBorrower.TelephoneNo = Convert.ToString(DB.DataTable.Rows[Index]["TelephoneNo"]);
                AnBorrower.Address1 = Convert.ToString(DB.DataTable.Rows[Index]["Address1"]);
                AnBorrower.Address2 = Convert.ToString(DB.DataTable.Rows[Index]["Address2"]);
                AnBorrower.City = Convert.ToString(DB.DataTable.Rows[Index]["City"]);
                AnBorrower.PostCode = Convert.ToString(DB.DataTable.Rows[Index]["PostCode"]);
                AnBorrower.City = Convert.ToString(DB.DataTable.Rows[Index]["City"]);
                AnBorrower.BorrowerStatus = Convert.ToString(DB.DataTable.Rows[Index]["BorrowerStatus"]);
                AnBorrower.BorrowerRecords = Convert.ToString(DB.DataTable.Rows[Index]["BorrowerRecords"]);
                AnBorrower.BorrowerPassword = Convert.ToString(DB.DataTable.Rows[Index]["BorrowerPassword"]);
                //add the records into a private data member
                mBorrowerList.Add(AnBorrower);
                //point to the next record
                Index++;

            }
        }


        public int Add()
        {
            //adds a new record in to the database depending on the values of mThisBooking
            //connect to the database.
            clsDataConnection DB = new clsDataConnection();
            //set the parameters for the stored procedure
            DB.AddParameter("@FK_BorrowerTypeID", mThisBorrower.FK_BorrowerTypeID);
            DB.AddParameter("@FirstName", mThisBorrower.FirstName);
            DB.AddParameter("@LastName", mThisBorrower.LastName);
            DB.AddParameter("@Email", mThisBorrower.Email);
            DB.AddParameter("@TelephoneNo", mThisBorrower.TelephoneNo);
            DB.AddParameter("@Address1", mThisBorrower.Address1);
            DB.AddParameter("@Address2", mThisBorrower.Address2);
            DB.AddParameter("@City", mThisBorrower.City);
            DB.AddParameter("@PostCode", mThisBorrower.PostCode);
            DB.AddParameter("@BorrowerStatus", mThisBorrower.BorrowerStatus);
            DB.AddParameter("@BorrowerRecords", mThisBorrower.BorrowerRecords);
            DB.AddParameter("@BorrowerPassword", mThisBorrower.BorrowerPassword);

            //execute the query returning primary key of new record
            return DB.Execute("sproc_BorrowerTable_Insert");

        }

        public void Delete()
        {
            //delete the record pointed to by thisCustomer
            //connect to the database
            clsDataConnection DB = new clsDataConnection();
            //set the parameters for the stored procedure
            DB.AddParameter("@BorrowerID", mThisBorrower.BorrowerID);
            //execute the stored procdure
            DB.Execute("sproc_BorrowerTable_Delete");
        }

        public void Update()
        {
            //adds a new record in to the database depending on the values of mThisBooking
            //connect to the database
            clsDataConnection DB = new clsDataConnection();
            //set the parameters for the stored procedure
            //set the parameters for the stored procedure
            DB.AddParameter("@BorrowerID", mThisBorrower.BorrowerID);
            DB.AddParameter("@FK_BorrowerTypeID", mThisBorrower.FK_BorrowerTypeID);
            DB.AddParameter("@FirstName", mThisBorrower.FirstName);
            DB.AddParameter("@LastName", mThisBorrower.LastName);
            DB.AddParameter("@Email", mThisBorrower.Email);
            DB.AddParameter("@TelephoneNo", mThisBorrower.TelephoneNo);
            DB.AddParameter("@Address1", mThisBorrower.Address1);
            DB.AddParameter("@Address2", mThisBorrower.Address2);
            DB.AddParameter("@City", mThisBorrower.City);
            DB.AddParameter("@PostCode", mThisBorrower.PostCode);
            DB.AddParameter("@BorrowerStatus", mThisBorrower.BorrowerStatus);
            DB.AddParameter("@BorrowerRecords", mThisBorrower.BorrowerRecords);
            DB.AddParameter("@BorrowerPassword", mThisBorrower.BorrowerPassword);
            //execute the query returning primary key of new record
            DB.Execute("sproc_BorrowerTable_Update");

        }

        public void FilterbyPostCode(string PostCode)
        {
            //filters the records based on a full or partial code
            //connect to the database
            clsDataConnection DB = new clsDataConnection();
            //send the PostCode parameter to the database
            DB.AddParameter("@PostCode", PostCode);
            // execute the stored procedure 
            DB.Execute("sproc_BorrowerTable_FilterByPostCode");
            //populate the array list with the data table
            PopulateArray(DB);
        }

        void PopulateArray(clsDataConnection DB)
        {
            //populates array list based on the data table in the parameter DB
            //var for the index
            Int32 Index = 0;
            //var to store the record count.
            Int32 RecordCount;
            //get the count of records
            RecordCount = DB.Count;
            //clear the private array lsit
            mBorrowerList = new List<clsBorrower>();
            //while there are records to process
            while (Index < RecordCount)
            {
                clsBorrower AnBorrower = new clsBorrower();
                AnBorrower.BorrowerID = Convert.ToInt32(DB.DataTable.Rows[Index]["BorrowerID"]);
                AnBorrower.FK_BorrowerTypeID = Convert.ToString(DB.DataTable.Rows[Index]["FK_BorrowerTypeID"]);
                AnBorrower.FirstName = Convert.ToString(DB.DataTable.Rows[Index]["FirstName"]);
                AnBorrower.LastName = Convert.ToString(DB.DataTable.Rows[Index]["LastName"]);
                AnBorrower.Email = Convert.ToString(DB.DataTable.Rows[Index]["Email"]);
                AnBorrower.TelephoneNo = Convert.ToString(DB.DataTable.Rows[Index]["TelephoneNo"]);
                AnBorrower.Address1 = Convert.ToString(DB.DataTable.Rows[Index]["Address1"]);
                AnBorrower.Address2 = Convert.ToString(DB.DataTable.Rows[Index]["Address2"]);
                AnBorrower.City = Convert.ToString(DB.DataTable.Rows[Index]["City"]);
                AnBorrower.PostCode = Convert.ToString(DB.DataTable.Rows[Index]["PostCode"]);
                AnBorrower.City = Convert.ToString(DB.DataTable.Rows[Index]["City"]);
                AnBorrower.BorrowerStatus = Convert.ToString(DB.DataTable.Rows[Index]["BorrowerStatus"]);
                AnBorrower.BorrowerRecords = Convert.ToString(DB.DataTable.Rows[Index]["BorrowerRecords"]);
                AnBorrower.BorrowerPassword = Convert.ToString(DB.DataTable.Rows[Index]["BorrowerPassword"]);
                //add the records into a private data member
                mBorrowerList.Add(AnBorrower);
                //point to the next record
                Index++;

            }
        }
    }
}
