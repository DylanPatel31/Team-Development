using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Class_Library
{
    public class clsStockCollection
    {
        clsDataConnection DB = new clsDataConnection();
        //private dta member thisStock
        clsStock mThisStock = new clsStock();
        //private data member to connect to the database*/

        //constructor for the class
        public clsStockCollection()
        {

        }

        public Boolean Delete()
        {
            ///this public function provides the functionality for the delete method

            try //try to delete the record
            {
                //create an instance of the data connection class called DB
                clsDataConnection DB = new clsDataConnection();
                //add the shoeno parameter passed to this function to the list of parameters to use in the database
                DB.AddParameter("@ShoeNo", mThisStock.ShoeNo);
                //execute the stored procedure in the database
                DB.Execute("sproc_tblStock_Delete");
                //set the return value for the function
                return true;
            }
            catch //do this if the code above failed for some reason
            {
                //report back that there was an error
                return false;
            }
        }

        //public property for the staff list
        public List<clsStock> StockList
        {
            get
            {
                List<clsStock> mStockList = new List<clsStock>();
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
                    clsStock AStock = new clsStock();
                    //read in the fileds from teh current record
                    AStock.ShoeNo = Convert.ToInt32(DB.DataTable.Rows[Index]["StaffNo"]);
                    AStock.ShoeName = Convert.ToString(DB.DataTable.Rows[Index]["ShoeName"]);
                    AStock.MainColour = Convert.ToString(DB.DataTable.Rows[Index]["MainColour"]);
                    AStock.ManufacturerName = Convert.ToString(DB.DataTable.Rows[Index]["ManufacturerName"]);
                    AStock.Price = Convert.ToString(DB.DataTable.Rows[Index]["ManufacturerName"]);                 
                    //add the record to the private data member
                    mStockList.Add(AStock);
                    //point at the next record
                    Index++;

                }
                //return the private data
                return mStockList;
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
        public clsStock ThisStock
        {
            get
            {
                //return the private data
                return mThisStock;
            }
            set
            {
                //set the private data
                mThisStock = value;
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
            DB.AddParameter("@ShoeNo", mThisStock.ShoeNo);
            DB.AddParameter("@ShoeName", mThisStock.ShoeName);
            DB.AddParameter("@MainColour", mThisStock.MainColour);
            DB.AddParameter("@ManufactureName", mThisStock.ManufacturerName);
            DB.AddParameter("@Price", mThisStock.Price);
  

            //execute the stored procedure returning the primary key value of the new record
            return DB.Execute("sproc_tblStock_Insert");
        }

        public void FilterByManufacturerName(string ManufacturerName)
        // it accepts a single parameter Manufacturer and returns no value
        {
            //initialise the DBConnection
            DB = new clsDataConnection();
            //add the parameter data used by the stored procedure
            DB.AddParameter("@ManufacturerName", ManufacturerName);
            //execute the stored procedure to delete the laptop
            DB.Execute("sproc_FilterBy_ManufacturerNameStock");
        }

        public void Update()
        {
            ///this function will update an existing shoe to the databas
            ///it accepts a single parameter an object of type clsstock
            ///the shoeno property must have a valid value for this to work
            //connect to the database
            clsDataConnection DB = new clsDataConnection();
            //add the parameters
            DB.AddParameter("@ShoeNo", mThisStock.ShoeNo);
            DB.AddParameter("@ShoeName", mThisStock.ShoeName);
            DB.AddParameter("@MainColour", mThisStock.MainColour);
            DB.AddParameter("@ManufacturerName", mThisStock.ManufacturerName);
            DB.AddParameter("@Price", mThisStock.Price);

            //execute the query
            DB.Execute("sproc_tblStock_Update");
        }
    }
}
    

