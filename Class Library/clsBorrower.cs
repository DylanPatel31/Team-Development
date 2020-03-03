using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsBorrower
/// </summary>
public class clsBorrower
{


    //private data member for the MobileNumber property
    private Int32 mBorrowerID;
    //private data member for the CustomerNo property
    private String mFirstName;
    //private data member for the CustomerNo property
    private String mFK_BorrowerTypeID;
    //private data member for the CustomerNo property
    private String mLastName;
    //private data member for the CustomerNo property
    private String mEmail;
    //private data member for the CustomerNo property
    private String mAddress1;
    //private data member for the CustomerNo property
    private String mAddress2;
    //private data member for the CustomerNo property
    private String mCity;
    //private data member for the CustomerNo property
    private String mTelephoneNo;
    //private data member for the CustomerNo property
    private String mPostCode;
    //private data member for the CustomerNo property
    private String mBorrowerStatus;
    //private data member for the CustomerNo property
    private String mBorrowerRecords;
    //private data member for the CustomerNo property
    private String mBorrowerPassword;


    //public property for Mobile number
    public int BorrowerID
    {
        get
        {
            //return the private data
            return mBorrowerID;
        }


        set
        {
            //set the value of the private data member
            mBorrowerID = value;
        }
    }

    //public property for Customer Number
    public String FK_BorrowerTypeID
    {
        get
        {
            //return the private data
            return mFK_BorrowerTypeID;
        }
        set
        {
            //set the value of the private data member
            mFK_BorrowerTypeID = value;
        }
    }

    //public property for Customer Number
    public String FirstName
    {
        get
        {
            //return the private data
            return mFirstName;
        }
        set
        {
            //set the value of the private data member
            mFirstName = value;
        }
    }

    //public property for Customer Number
    public String LastName
    {
        get
        {
            //return the private data
            return mLastName;
        }
        set
        {
            //set the value of the private data member
            mLastName = value;
        }
    }

    //public property for First Name
    public string Email
    {
        get
        {
            //return the private data
            return mEmail;
        }
        set
        {
            //set the value of the private data member
            mEmail = value;
        }

    }

    //public property for Last Name
    public string Address1
    {
        get
        {
            //return the private data
            return mAddress1;
        }
        set
        {
            //set the value of the private data member
            mAddress1 = value;
        }

    }


    //public property for Last Name
    public string Address2
    {
        get
        {
            //return the private data
            return mAddress2;
        }
        set
        {
            //set the value of the private data member
            mAddress2 = value;
        }

    }

    //public property for Last Name
    public string City
    {
        get
        {
            //return the private data
            return mCity;
        }
        set
        {
            //set the value of the private data member
            mCity = value;
        }

    }
    //public property for House Number
    public string TelephoneNo
    {
        get
        {
            //return the private data
            return mTelephoneNo;
        }
        set
        {
            //set the value of the private data member
            mTelephoneNo = value;
        }

    }

    //public property for Post Code
    public string PostCode
    {
        get
        {
            //return the private data
            return mPostCode;
        }
        set
        {
            //set the value of the private data member
            mPostCode = value;
        }

    }

    //public property for Town
    public string BorrowerStatus
    {
        get
        {
            //return the private data
            return mBorrowerStatus;
        }
        set
        {
            //set the value of the private data member
            mBorrowerStatus = value;
        }

    }

    //public property for Email
    public string BorrowerRecords
    {
        get
        {
            //return the private data
            return mBorrowerRecords;
        }
        set
        {
            //set the value of the private data member
            mBorrowerRecords = value;
        }

    }


    public string BorrowerPassword
    {
        get
        {
            //return the private data
            return mBorrowerPassword;
        }
        set
        {
            //set the value of the private data member
            mBorrowerPassword = value;
        }

    }

    public bool Find(int BorrowerID)
    {
        //create an instance of the data connection
        clsDataConnection DB = new clsDataConnection();
        //add the parameter for the book ref to search for
        DB.AddParameter("@BorrowerID", BorrowerID);
        //execute stored procedure
        DB.Execute("sproc_BorrowerTable_FilterByBorrowerID");
        //if one record is found
        if (DB.Count == 1)
        {
            //copy the data from the database to the private data members
            mBorrowerID = Convert.ToInt32(DB.DataTable.Rows[0]["BorrowerID"]);
            mFK_BorrowerTypeID = Convert.ToString(DB.DataTable.Rows[0]["FK_BorrowerTypeID"]);
            mFirstName = Convert.ToString(DB.DataTable.Rows[0]["FirstName"]);
            mLastName = Convert.ToString(DB.DataTable.Rows[0]["LastName"]);
            mEmail = Convert.ToString(DB.DataTable.Rows[0]["Email"]);
            mAddress1 = Convert.ToString(DB.DataTable.Rows[0]["Address1"]);
            mAddress2 = Convert.ToString(DB.DataTable.Rows[0]["Address2"]);
            mCity = Convert.ToString(DB.DataTable.Rows[0]["City"]);
            mTelephoneNo = Convert.ToString(DB.DataTable.Rows[0]["TelephoneNo"]);
            mPostCode = Convert.ToString(DB.DataTable.Rows[0]["PostCode"]);
            mBorrowerStatus = Convert.ToString(DB.DataTable.Rows[0]["BorrowerStatus"]);
            mBorrowerRecords = Convert.ToString(DB.DataTable.Rows[0]["BorrowerRecords"]);
            mBorrowerPassword = Convert.ToString(DB.DataTable.Rows[0]["BorrowerPassword"]);



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





    public string Valid(string borrowerTypeID, string firstName, string lastName, string email, string address1, string address2, string city, string telephoneNo, string postCode, string borrowerStatus, string borrowerRecords, string borrowerPassword)
    {
        //temp variable to store start date

        string Error = "";


        ////Borrower Type ID

        if (borrowerTypeID.Length == 0)
        {
            Error = Error + "The Borrower Type ID may not be blank";
        }
        if (borrowerTypeID.Length > 10)
        {
            Error = Error + " The Borrower Type ID must be less than 10 characters :   ";
        }


        ////First Name

        if (firstName.Length == 0)
        {
            Error = Error + "The Borrower first Name may not be blank";
        }
        if (firstName.Length > 50)
        {
            Error = Error + " The Borrower First name must be less than 50 characters :   ";
        }


        ////Last Name

        if (lastName.Length == 0)
        {
            Error = Error + "The Borrower Last Name may not be blank";
        }
        if (lastName.Length > 50)
        {
            Error = Error + " The Borrower First name must be less than 50 characters :   ";
        }

        ////Email

        if (email.Length == 0)
        {
            Error = Error + "The Borrower Email may not be blank";
        }
        if (email.Length > 50)
        {
            Error = Error + " The Borrower Email must be less than 50 characters :   ";
        }


        ////Telephone Number

        if (telephoneNo.Length == 0)
        {
            Error = Error + "The Borrower Telephone Number may not be blank";
        }
        if (telephoneNo.Length > 20)
        {
            Error = Error + " The Borrower Telephone Number must be less than 20 characters :   ";
        }

        ////The Borrower Address 1

        if (address1.Length == 0)
        {
            Error = Error + "The Borrower Address 1 may not be blank";
        }
        if (address1.Length > 50)
        {
            Error = Error + " The Borrower Address 1 must be less than 50 characters :   ";
        }

        ////The borrower address 2

        if (address2.Length == 0)
        {
            Error = Error + "The borrower address 2 may not be blank";
        }
        if (address2.Length > 50)
        {
            Error = Error + " The borrower address 2 must be less than 50 characters :   ";
        }



        //Post Code
        if (city.Length == 0)
        {
            Error = Error + "The Post Code may not be blank";
        }
        if (city.Length > 50)
        {
            Error = Error + " The Post Code must be less than 20 characters :   ";
        }

        //Borrower Status
        if (borrowerStatus.Length == 0)
        {
            Error = Error + "The Borrower Status may not be blank";
        }
        if (borrowerStatus.Length > 50)
        {
            Error = Error + " The Borrower Status  must be less than 50 characters :   ";
        }




        //Borrower Records
        if (borrowerRecords.Length == 0)
        {
            Error = Error + "The Borrower Records may not be blank";
        }
        if (borrowerRecords.Length > 300)
        {
            Error = Error + " The Borrower Status  must be less than 300 characters :   ";
        }

        //Borrower Password
        if (borrowerPassword.Length == 0)
        {
            Error = Error + "The post code may not be blank";
        }
        if (borrowerPassword.Length > 30)
        {
            Error = Error + " The post code must be less than 10 characters :   ";
        }

        //return any error message
        return Error;
    }


}