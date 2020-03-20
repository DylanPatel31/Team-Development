using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Class_Library
{
   public class clsStaff
    {
        //private data member for the StaffNo property
        private Int32 mStaffNo;
        //private data member for the Title property
        private string mTitle;
        ////private data member for the FirstName property
        private string mFirstName;
        //private data member for the LastName property
        private string mLastName;
        ////private data member for the DateOfBirth property
        private string mDateofBirth;
        //private data member for the Address1 property
        private string mAddress1;
        //private data member for the Address2 property
        private string mAddress2;
        //private data member for the City property
        private string mCity;
        //private data member for the PostCode property
        private string mPostCode;

        public clsStaff()
        {
        }


        //public property for staffno
        public int StaffNo
        {
            get
            {
                //return the private data
                return mStaffNo;
            }
            set
            {
                //set the private data
                mStaffNo = value;
            }
        }
        public string Address1
        {
            get
            {
                //return the private data
                return mAddress1;
            }
            set
            {
                //set the data
                mAddress1 = value;
            }
        }
        public string Address2
        {
            get
            {
                //return the data
                return mAddress2;
            }
            set
            {
                //set the data
                mAddress2 = value;
            }
        }
        public string City
        {
            get
            {
                //return the data
                return mCity;

            }
            set
            {
                //set the data
                mCity = value;
            }
        }
        public string DateofBirth
        {
            get
            {
                //return the data
                return mDateofBirth;
            }
            set
            {
                //set the data
                mDateofBirth = value;
            }
        }
        public string FirstName
        {
            get
            {
                //return the data 
                return mFirstName;
            }
            set
            {
                //setr the data
                mFirstName = value;
            }
        }
        public string LastName
        {
            get
            {
                //return the data 
                return mLastName;
            }
            set
            {
                //set the data
                mLastName = value;
            }
        }
        public string PostCode
        {
            get
            {
                //return the data
                return mPostCode;
            }
            set
            {
                //set the data
                mPostCode = value;
            }
        }

        //public property for title
        public string Title
        {
            get
            {
                //return the data
                return mTitle;
            }
            set
            {
                //set the data
                mTitle = value;
            }
        }


        public bool Find(int staffNo)
        {
            //initialise the DBConnection
            clsDataConnection DB = new clsDataConnection();
            //add the phone no parameter
            DB.AddParameter("StaffNo", staffNo);
            //execute the query
            DB.Execute("sproc_FilterBy_StaffNo");
            //if the record was found
            if (DB.Count == 1)
            {
                //get the id
                mStaffNo = Convert.ToInt32(DB.DataTable.Rows[0]["StaffNo"]);
                //get the title
                mTitle = Convert.ToString(DB.DataTable.Rows[0]["Title"]);
                //get the name
                mFirstName = Convert.ToString(DB.DataTable.Rows[0]["FirstName"]);
                //get the surname
                mLastName = Convert.ToString(DB.DataTable.Rows[0]["LastName"]);
                //get the 
                mDateofBirth = Convert.ToString(DB.DataTable.Rows[0]["DateofBirth"]);
                //
                mAddress1 = Convert.ToString(DB.DataTable.Rows[0]["Address1"]);
                //
                mAddress2 = Convert.ToString(DB.DataTable.Rows[0]["Address2"]);
                //
                mCity = Convert.ToString(DB.DataTable.Rows[0]["City"]);
                //
                mPostCode = Convert.ToString(DB.DataTable.Rows[0]["PostCode"]);
                //get the 

                return true;
            }
            else
            {
                //return failure
                return false;
            }
        }

        public string Valid(string title, string firstName, string lastName, string dateOfBirth, string address1, string address2, string city, string postCode)
        {
            //create a string variable to store the error
            String Error = "";
            //create a temporary variable to store date values
            DateTime DateTemp;

            //if the Title is blank
            if (title.Length == 0)
            {
                //record the error
                Error = Error + "The title may not be blank";
            }
            //if the titel is greater than 4 characters
            if (title.Length > 4)
            {
                //record the error
                Error = Error + "The title must be less than 4 characters : ";
            }

            //is the post code blank
            if (postCode.Length == 0)
            {
                //record the error
                Error = Error + "The Post code may not be blank";
            }
            //if post code is too long
            if (postCode.Length > 7)
            {
                //record the error
                Error = Error + "The post code must be less than 7 characters : ";
            }

            //is the city blank
            if (city.Length == 0)
            {
                //record the error
                Error = Error + "The City may not be blank";
            }
            //if city too long
            if (city.Length > 50)
            {
                //record the error
                Error = Error + "The City must be less than 50 characters : ";
            }

            //is the  address1 blank
            if (address1.Length == 0)
            {
                //record the error
                Error = Error + "The Address may not be blank";
            }
            //if address1 too long
            if (address1.Length > 50)
            {
                //record the error
                Error = Error + "The Address must be less than 50 characters : ";
            }

            //is the address2 blank
            if (address2.Length == 0)
            {
                //record the error
                Error = Error + "The Address 2 may not be blank";
            }
            //if address2 too long
            if (address2.Length > 50)
            {
                //record the error
                Error = Error + "The Address 2 must be less than 50 characters : ";
            }

            //is the last name blank
            if (lastName.Length == 0)
            {
                //record the error
                Error = Error + "The Last Name may not be blank";
            }
            //if last name too long
            if (lastName.Length > 50)
            {
                //record the error
                Error = Error + "The Last Name must be less than 50 characters : ";
            }

            //is the first name blank
            if (firstName.Length == 0)
            {
                //record the error
                Error = Error + "The First Name must not be blank";
            }

            //if first name is too long
            if (firstName.Length > 50)
            {
                //record the error
                Error = Error + "The First Name must be less that 50 characters : ";
            }
            try
            {
                //copy the dateOfBirth value t othe DateTemp variable
                DateTemp = Convert.ToDateTime(dateOfBirth);
                if (DateTemp > DateTime.Now.AddYears(-16))
                {
                    //record the error
                    Error = Error + "too young : ";
                }
                //check to se if th date is greater than today's date
                if (DateTemp < DateTime.Now.AddYears(-100))
                {
                    //record the error 
                    Error = Error + "Too old : ";
                }
            }
            catch
            {
                //record the error
                Error = Error + "The date was not a valid date of birth : ";
            }


            //return any error message
            return Error;
        }
    }
}
