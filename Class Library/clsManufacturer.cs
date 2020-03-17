using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Class_Library
{
        public class clsManufacturer
        {
            //private data member for the StaffNo property
            private Int32 mManufacturerNo;
            //private data member for the Title property
            private string mManufacturerName;
            ////private data member for the FirstName property
            private string mManufacturerTelephone;
            //private data member for the LastName property
            private string mManufacturerEmail;
            
            public clsManufacturer()
            {
            }


            //public property for staffno
            public int ManufacturerNo
        {
                get
                {
                    //return the private data
                    return ManufacturerNo;
                }
                set
                {
                //set the private data
                mManufacturerNo = value;
                }
            }
            public string ManufacturerName
        {
                get
                {
                    //return the private data
                    return mManufacturerName;
                }
                set
                {
                //set the data
                mManufacturerName = value;
                }
            }
            public string ManufacturerTelephone
        {
                get
                {
                    //return the data
                    return mManufacturerTelephone;
                }
                set
                {
                //set the data
                mManufacturerTelephone = value;
                }
            }
            public string ManufacturerEmail
        {
                get
                {
                    //return the data
                    return mManufacturerEmail;

                }
                set
                {
                //set the data
                mManufacturerEmail = value;
                }
            }
            
            


            public bool Find(int manufacturerNo)
            {
                //initialise the DBConnection
                clsDataConnection DB = new clsDataConnection();
                //add the phone no parameter
                DB.AddParameter("ManufacturerNo", manufacturerNo);
                //execute the query
                DB.Execute("sproc_FilterBy_ManufacturerNo");
                //if the record was found
                if (DB.Count == 1)
                {
                //get the id
                mManufacturerNo = Convert.ToInt32(DB.DataTable.Rows[0]["ManufacturerNo"]);
                //get the title
                mManufacturerName = Convert.ToString(DB.DataTable.Rows[0]["ManufacturerName"]);
                //get the name
                mManufacturerTelephone = Convert.ToString(DB.DataTable.Rows[0]["ManufacturerTelephone"]);
                //get the surname
                mManufacturerEmail = Convert.ToString(DB.DataTable.Rows[0]["ManufacturerEmail"]);
                    //get the 

                    return true;
                }
                else
                {
                    //return failure
                    return false;
                }
            }

            public string Valid(string manufacturerName, string manufacturerTelephone, string manufacturerEmail)
            {
                //create a string variable to store the error
                String Error = "";


                //if the Title is blank
                if (manufacturerName.Length == 0)
                {
                    //record the error
                    Error = Error + "The manufacturer name may not be blank";
                }
                //if the titel is greater than 4 characters
                if (manufacturerName.Length > 50)
                {
                    //record the error
                    Error = Error + "The name must be less than 50 characters : ";
                }

                //is the post code blank
                if (manufacturerTelephone.Length == 0)
                {
                    //record the error
                    Error = Error + "The telephone may not be blank";
                }
                //if post code is too long
                if (manufacturerTelephone.Length > 11)
                {
                    //record the error
                    Error = Error + "The post code must be less than 12 characters : ";
                }

                //is the city blank
                if (mManufacturerEmail.Length == 0)
                {
                    //record the error
                    Error = Error + "The email may not be blank";
                }
                //if city too long
                if (manufacturerEmail.Length > 50)
                {
                    //record the error
                    Error = Error + "The email must be less than 50 characters : ";
                }

               


                //return any error message
                return Error;
            }
        }
    
}
