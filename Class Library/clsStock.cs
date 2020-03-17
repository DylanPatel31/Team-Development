using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Class_Library
{
    public class clsStock
    {
        //private data member for the StaffNo property
        private Int32 mShoeNo;
        //private data member for the Title property
        private string mShoeName;
        ////private data member for the FirstName property
        private string mMainColour;
        //private data member for the LastName property
        private string mManufacturerName;
        //private data member for the Address1 property
        private string mPrice;


        public clsStock()
        {
        }


        //public property for shoeno
        public int ShoeNo
        {
            get
            {
                //return the private data
                return mShoeNo;
            }
            set
            {
                //set the private data
                mShoeNo = value;
            }
        }
        public string ShoeName
        {
            get
            {
                //return the private data
                return mShoeName;
            }
            set
            {
                //set the data
                mShoeName = value;
            }
        }
        public string MainColour
        {
            get
            {
                //return the data
                return mMainColour;
            }
            set
            {
                //set the data
                mMainColour = value;
            }
        }
        public string ManufacturerName
        {
            get
            {
                //return the data
                return mManufacturerName;

            }
            set
            {
                //set the data
                mManufacturerName = value;
            }
        }
        public string Price
        {
            get
            {
                //return the data
                return mPrice;
            }
            set
            {
                //set the data
                mPrice = value;
            }
        }



        public bool Find(int shoeNo)
        {
            //initialise the DBConnection
            clsDataConnection DB = new clsDataConnection();
            //add the phone no parameter
            DB.AddParameter("ShoeNo", shoeNo);
            //execute the query
            DB.Execute("sproc_FilterBy_ShoeNo");
            //if the record was found
            if (DB.Count == 1)
            {
                //get the id
                mShoeNo = Convert.ToInt32(DB.DataTable.Rows[0]["ShoeNo"]);
                //get the name
                mShoeName = Convert.ToString(DB.DataTable.Rows[0]["ShoeName"]);
                //get the colour
                mMainColour = Convert.ToString(DB.DataTable.Rows[0]["MainColour"]);
                //get the name
                mManufacturerName = Convert.ToString(DB.DataTable.Rows[0]["ManufacturerName"]);
                //get the price 
                mPrice = Convert.ToString(DB.DataTable.Rows[0]["Price"]);
                //get the 

                return true;
            }
            else
            {
                //return failure
                return false;
            }
        }

        public string Valid(string ShoeName, string MainColour, string ManufacturerName, string Price)
        {
            //create a string variable to store the error
            String Error = "";


            //if the Title is blank
            if (ShoeName.Length == 0)
            {
                //record the error
                Error = Error + "Please enter the name of the shoe";
            }
            //if the titel is greater than 4 characters
            if (ShoeName.Length > 50)
            {
                //record the error
                Error = Error + "The shoe name must be less than 50 characters : ";
            }

            //is the post code blank
            if (MainColour.Length == 0)
            {
                //record the error
                Error = Error + "The Main colour may not be blank";
            }
            //if post code is too long
            if (ManufacturerName.Length > 50)
            {
                //record the error
                Error = Error + "The post code must be less than 50 characters : ";
            }

            //is the city blank
            if (Price.Length == 0)
            {
                //record the error
                Error = Error + "Please enter the price";
            }


            //return any error message
            return Error;
        }
    }
}
