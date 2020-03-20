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


    }
}

