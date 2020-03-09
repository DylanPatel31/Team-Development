using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Class_Library
{
    public class clsCopy
    {
        //private data member for the MobileNumber property
        private Int32 mCopyBarCode;
        //private data member for the MobileNumber property
        private Int32 mFK_ISBN;
        //private data member for the CustomerNo property
        private String mCopyCondition;
        //private data member for the CustomerNo property
        private String mCopyStatus;
        //private data member for the CustomerNo property
        private String mCopyLoanType;


        //public property for Mobile number
        public int CopyBarCode
        {
            get
            {
                //return the private data
                return mCopyBarCode;
            }


            set
            {
                //set the value of the private data member
                mCopyBarCode = value;
            }
        }


        //public property for Mobile number
        public int FK_ISBN
        {
            get
            {
                //return the private data
                return mFK_ISBN;
            }


            set
            {
                //set the value of the private data member
                mFK_ISBN = value;
            }
        }



        //public property for Post Code
        public string CopyCondition
        {
            get
            {
                //return the private data
                return mCopyCondition;
            }
            set
            {
                //set the value of the private data member
                mCopyCondition = value;
            }

        }

        //public property for Post Code
        public string CopyStatus
        {
            get
            {
                //return the private data
                return mCopyStatus;
            }
            set
            {
                //set the value of the private data member
                mCopyStatus = value;
            }

        }


        //public property for Town
        public string CopyLoanType
        {
            get
            {
                //return the private data
                return mCopyLoanType;
            }
            set
            {
                //set the value of the private data member
                mCopyLoanType = value;
            }

        }





        public bool Find(int CopyBarCode)
        {
            //create an instance of the data connection
            clsDataConnection DB = new clsDataConnection();
            //add the parameter for the book ref to search for
            DB.AddParameter("@CopyBarCode", CopyBarCode);
            //execute stored procedure
            DB.Execute("sproc_CopyTable_FilterByCopyBarCode");
            //if one record is found
            if (DB.Count == 1)
            {
                //copy the data from the database to the private data members
                mFK_ISBN = Convert.ToInt32(DB.DataTable.Rows[0]["FK_ISBN"]);
                mCopyBarCode = Convert.ToInt32(DB.DataTable.Rows[0]["CopyBarCode"]);
                mCopyCondition = Convert.ToString(DB.DataTable.Rows[0]["CopyCondition"]);
                mCopyStatus = Convert.ToString(DB.DataTable.Rows[0]["CopyStatus"]);
                mCopyLoanType = Convert.ToString(DB.DataTable.Rows[0]["CopyLoanType"]);


                //return an record has been found
                return true;
            }
            //if no record is found
            else
            {
                //record no record has been found
                return false;
            }
        }


        public string Valid(string copyLoanType, string copyCondition, string copyStatus, string fk_ISBN)
        {
            //temp variable to store start date

            string Error = "";

            ////Copy Condition

            if (fk_ISBN.Length == 0)
            {
                Error = Error + "The first may not be blank";
            }
            if (fk_ISBN.Length > 50)
            {
                Error = Error + " The title book must be less than 50 characters :   ";
            }


            ////Copy Condition

            if (copyCondition.Length == 0)
            {
                Error = Error + "The first may not be blank";
            }
            if (copyCondition.Length > 50)
            {
                Error = Error + " The title book must be less than 50 characters :   ";
            }

            ////Copy Loan Type

            if (copyLoanType.Length == 0)
            {
                Error = Error + "The first may not be blank";
            }
            if (copyLoanType.Length > 50)
            {
                Error = Error + " The title book must be less than 50 characters :   ";
            }

            ////Copy Status

            if (copyStatus.Length == 0)
            {
                Error = Error + "The first may not be blank";
            }
            if (copyStatus.Length > 50)
            {
                Error = Error + " The title book must be less than 50 characters :   ";
            }



            //return any error message
            return Error;
        }

    }
}
