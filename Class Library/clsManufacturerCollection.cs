using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Class_Library
{
    public class clsManufacturerCollection
    {
        clsDataConnection DB = new clsDataConnection();
        //private dta member thisStaff
        clsManufacturer mThisManufacturer = new clsManufacturer();
        //private data member to connect to the database*/

        //constructor for the class
        public clsManufacturerCollection()
        {

        }


        //public property for the staff list
        public List<clsManufacturer> ManufacturerList
        {
            get
            {
                List<clsManufacturer> mManufacturerList = new List<clsManufacturer>();
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
                    clsManufacturer AManufacturer = new clsManufacturer();
                    //read in the fileds from teh current record
                    AManufacturer.ManufacturerNo = Convert.ToInt32(DB.DataTable.Rows[Index]["ManufacturerNo"]);
                    AManufacturer.ManufacturerName = Convert.ToString(DB.DataTable.Rows[Index]["ManufacturerName"]);
                    AManufacturer.ManufacturerTelephone = Convert.ToString(DB.DataTable.Rows[Index]["ManufacturerTelephone"]);
                    AManufacturer.ManufacturerEmail = Convert.ToString(DB.DataTable.Rows[Index]["ManufacturerEmail"]);

                    //AManufacturer the record to the private data member
                    mManufacturerList.Add(AManufacturer);
                    //point at the next record
                    Index++;

                }
                //return the private data
                return mManufacturerList;
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
        public clsManufacturer ThisManufacturer
        {
            get
            {
                //return the private data
                return mThisManufacturer;
            }
            set
            {
                //set the private data
                mThisManufacturer = value;
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
            DB.AddParameter("@ManufacturerNo", mThisManufacturer.ManufacturerNo);
            DB.AddParameter("@ManufacturerName", mThisManufacturer.ManufacturerName);
            DB.AddParameter("@ManufacturerTelephone", mThisManufacturer.ManufacturerTelephone);
            DB.AddParameter("@ManufacturerEmail", mThisManufacturer.ManufacturerEmail);


            //execute the stored procedure returning the primary key value of the new record
            return DB.Execute("sproc_tblManufacturer_Insert");
        }

        public void FilterByManufacturerName(string ManufacturerName)
        // it accepts a single parameter Manufacturer and returns no value
        {
            //initialise the DBConnection
            DB = new clsDataConnection();
            //add the parameter data used by the stored procedure
            DB.AddParameter("@ManufacturerName", ManufacturerName);
            //execute the stored procedure to delete the laptop
            DB.Execute("sproc_FilterBy_ManufacturerName");
        }

        public Boolean Delete()
        {
            ///this public function provides the functionality for the delete method

            try //try to delete the record
            {
                //create an instance of the data connection class called db
                clsDataConnection DB = new clsDataConnection();
                //add the staffno parameter passed to this function to the list of parameters to use in the database
                DB.AddParameter("@ManufacturerNo", mThisManufacturer.ManufacturerNo);
                //execute the stored procedure in the database
                DB.Execute("sproc_tblManufacturer_Delete");
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
            DB.AddParameter("@ManufactuerNo", mThisManufacturer.ManufacturerNo);
            DB.AddParameter("@ManufacturerName", mThisManufacturer.ManufacturerName);
            DB.AddParameter("@ManufacturerTelephone", mThisManufacturer.ManufacturerTelephone);
            DB.AddParameter("@ManufacturerEmail", mThisManufacturer.ManufacturerEmail);
            //execute the query
            DB.Execute("sproc_tblManufacturer_Update");
        }
    }
}

