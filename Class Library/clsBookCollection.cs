using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsBookCollection
/// </summary>
public class clsBookCollection
{
    //private data member for the list
    List<clsBook> mBookList = new List<clsBook>();
    //private data member this customer
    clsBook mThisBook = new clsBook();



    //public property for the customer list
    public List<clsBook> BookList
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

    public clsBook ThisBook
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
    public clsBookCollection()
    {
        //var for the index
        Int32 Index = 0;
        //var to store the record count
        Int32 RecordCount = 0;
        //object for data connection
        clsDataConnection DB = new clsDataConnection();
        //execute the stored procodure
        DB.Execute("sproc_BookTable_SelectAll");
        //get the count of records
        RecordCount = DB.Count;
        //while there are records to process
        while (Index < RecordCount)
        {
            //Create a blank Customer
            clsBook AnBook = new clsBook();
            AnBook.ISBN = Convert.ToInt32(DB.DataTable.Rows[Index]["ISBN"]);
            AnBook.Title = Convert.ToString(DB.DataTable.Rows[Index]["Title"]);
            AnBook.Author = Convert.ToString(DB.DataTable.Rows[Index]["Author"]);
            AnBook.Publisher = Convert.ToString(DB.DataTable.Rows[Index]["Publisher"]);
            AnBook.PublishedYear = Convert.ToInt32(DB.DataTable.Rows[Index]["PublishedYear"]);
            AnBook.FK_GenreID = Convert.ToString(DB.DataTable.Rows[Index]["FK_GenreID"]);
            AnBook.EditionNo = Convert.ToInt32(DB.DataTable.Rows[Index]["EditionNo"]);
            AnBook.ShelfNo = Convert.ToString(DB.DataTable.Rows[Index]["ShelfNo"]);
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
        DB.AddParameter("@Title", mThisBook.Title);
        DB.AddParameter("@Author", mThisBook.Author);
        DB.AddParameter("@Publisher", mThisBook.Publisher);
        DB.AddParameter("@PublishedYear", mThisBook.PublishedYear);
        DB.AddParameter("@FK_GenreID", mThisBook.FK_GenreID);
        DB.AddParameter("@EditionNo", mThisBook.EditionNo);
        DB.AddParameter("@ShelfNo", mThisBook.ShelfNo);


        //execute the query returning primary key of new record
        return DB.Execute("sproc_BookTable_Insert");

    }

    public void Delete()
    {
        //delete the record pointed to by thisCustomer
        //connect to the database
        clsDataConnection DB = new clsDataConnection();
        //set the parameters for the stored procedure
        DB.AddParameter("@ISBN", mThisBook.ISBN);
        //execute the stored procdure
        DB.Execute("sproc_BookTable_Delete");
    }

    public void Update()
    {
        //adds a new record in to the database depending on the values of mThisBooking
        //connect to the database
        clsDataConnection DB = new clsDataConnection();
        //set the parameters for the stored procedure
        //set the parameters for the stored procedure
        DB.AddParameter("@ISBN", mThisBook.ISBN);
        DB.AddParameter("@Title", mThisBook.Title);
        DB.AddParameter("@Author", mThisBook.Author);
        DB.AddParameter("@Publisher", mThisBook.Publisher);
        DB.AddParameter("@PublishedYear", mThisBook.PublishedYear);
        DB.AddParameter("@FK_GenreID", mThisBook.FK_GenreID);
        DB.AddParameter("@EditionNo", mThisBook.EditionNo);
        DB.AddParameter("@ShelfNo", mThisBook.ShelfNo);
        //execute the query returning primary key of new record
        DB.Execute("sproc_BookTable_Update");

    }

    public void FilterbyTitle(string Title)
    {
        //filters the records based on a full or partial code
        //connect to the database
        clsDataConnection DB = new clsDataConnection();
        //send the PostCode parameter to the database
        DB.AddParameter("@Title", Title);
        // execute the stored procedure 
        DB.Execute("sproc_BookTable_FilterByTitle");
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
        mBookList = new List<clsBook>();
        //while there are records to process
        while (Index < RecordCount)
        {
            clsBook AnBook = new clsBook();
            AnBook.ISBN = Convert.ToInt32(DB.DataTable.Rows[Index]["ISBN"]);
            AnBook.Title = Convert.ToString(DB.DataTable.Rows[Index]["Title"]);
            AnBook.Author = Convert.ToString(DB.DataTable.Rows[Index]["Author"]);
            AnBook.Publisher = Convert.ToString(DB.DataTable.Rows[Index]["Publisher"]);
            AnBook.PublishedYear = Convert.ToInt32(DB.DataTable.Rows[Index]["PublishedYear"]);
            AnBook.FK_GenreID = Convert.ToString(DB.DataTable.Rows[Index]["FK_GenreID"]);
            AnBook.EditionNo = Convert.ToInt32(DB.DataTable.Rows[Index]["EditionNo"]);
            AnBook.ShelfNo = Convert.ToString(DB.DataTable.Rows[Index]["ShelfNo"]);
            //add the records into a private data member
            mBookList.Add(AnBook);
            //point to the next record
            Index++;

        }
    }


}
