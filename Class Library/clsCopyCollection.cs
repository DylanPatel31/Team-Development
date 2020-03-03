using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsBookCollection
/// </summary>
public class clsCopyCollection
{
    //private data member for the list
    List<clsCopy> mBookList = new List<clsCopy>();
    //private data member this customer
    clsCopy mThisBook = new clsCopy();



    //public property for the customer list
    public List<clsCopy> BookList
    {
        get
        {
            //return the private data
            return mBookList;

        }
        set
        {
            //set the private data
            mBookList = value;
        }

    }

    //public property count       
    public int Count
    {
        get
        {
            //return count of the list
            return mBookList.Count;
        }
        set
        {
            //later
        }
    }

    public clsCopy ThisBook
    {
        get
        {
            //return the private data
            return mThisBook;
        }
        set
        {
            //set the private data
            mThisBook = value;
        }
    }



    //constructor for the class
    public clsCopyCollection()
    {
        //var for the index
        Int32 Index = 0;
        //var to store the record count
        Int32 RecordCount = 0;
        //object for data connection
        clsDataConnection DB = new clsDataConnection();
        //execute the stored procodure
        DB.Execute("sproc_CopyTable_SelectAll");
        //get the count of records
        RecordCount = DB.Count;
        //while there are records to process
        while (Index < RecordCount)
        {
            //Create a blank Customer
            clsCopy AnBook = new clsCopy();
            AnBook.CopyBarCode = Convert.ToInt32(DB.DataTable.Rows[Index]["CopyBarCode"]);
            AnBook.FK_ISBN = Convert.ToInt32(DB.DataTable.Rows[Index]["FK_ISBN"]);
            AnBook.CopyLoanType = Convert.ToString(DB.DataTable.Rows[Index]["CopyLoanType"]);
            AnBook.CopyCondition = Convert.ToString(DB.DataTable.Rows[Index]["CopyCondition"]);
            AnBook.CopyStatus = Convert.ToString(DB.DataTable.Rows[Index]["CopyStatus"]);

            //add the records into a private data member
            mBookList.Add(AnBook);
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
        DB.AddParameter("@FK_ISBN", mThisBook.FK_ISBN);
        DB.AddParameter("@CopyLoanType", mThisBook.CopyLoanType);
        DB.AddParameter("@CopyCondition", mThisBook.CopyCondition);
        DB.AddParameter("@CopyStatus", mThisBook.CopyStatus);


        //execute the query returning primary key of new record
        return DB.Execute("sproc_CopyTable_Insert");

    }

    public void Delete()
    {
        //delete the record pointed to by thisCustomer
        //connect to the database
        clsDataConnection DB = new clsDataConnection();
        //set the parameters for the stored procedure
        DB.AddParameter("@CopyBarCode", mThisBook.CopyBarCode);
        //execute the stored procdure
        DB.Execute("sproc_CopyTable_Delete");
    }

    public void Update()
    {
        //adds a new record in to the database depending on the values of mThisBooking
        //connect to the database
        clsDataConnection DB = new clsDataConnection();
        //set the parameters for the stored procedure
        //set the parameters for the stored procedure
        DB.AddParameter("@CopyBarCode", mThisBook.CopyBarCode);
        DB.AddParameter("@FK_ISBN", mThisBook.FK_ISBN);
        DB.AddParameter("@CopyLoanType", mThisBook.CopyLoanType);
        DB.AddParameter("@CopyCondition", mThisBook.CopyCondition);
        //execute the query returning primary key of new record
        DB.Execute("sproc_CopyTable_Update");

    }

    public void FilterbyCopyStatus(string BookCopyStatus)
    {
        //filters the records based on a full or partial code
        //connect to the database
        clsDataConnection DB = new clsDataConnection();
        //send the PostCode parameter to the database
        DB.AddParameter("@CopyStatus", BookCopyStatus);
        // execute the stored procedure 
        DB.Execute("sproc_CopyTable_FilterByCopyStatus");
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
        mBookList = new List<clsCopy>();
        //while there are records to process
        while (Index < RecordCount)
        {
            clsCopy AnBook = new clsCopy();
            AnBook.CopyBarCode = Convert.ToInt32(DB.DataTable.Rows[Index]["CopyBarCode"]);
            AnBook.FK_ISBN = Convert.ToInt32(DB.DataTable.Rows[Index]["FK_ISBN"]);
            AnBook.CopyCondition = Convert.ToString(DB.DataTable.Rows[Index]["CopyCondition"]);
            AnBook.CopyStatus = Convert.ToString(DB.DataTable.Rows[Index]["CopyStatus"]);
            AnBook.CopyLoanType = Convert.ToString(DB.DataTable.Rows[Index]["CopyLoanType"]);

            //add the records into a private data member
            mBookList.Add(AnBook);
            //point to the next record
            Index++;

        }
    }


}
