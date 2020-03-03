using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsBook
/// </summary>
public class clsBook
{
    //private data member for the MobileNumber property
    private Int32 mISBN;
    //private data member for the CustomerNo property
    private String mTitle;
    //private data member for the CustomerNo property
    private String mAuthor;
    //private data member for the CustomerNo property
    private String mPublisher;
    //private data member for the CustomerNo property
    private Int32 mPublishedYear;
    //private data member for the CustomerNo property
    private String mFK_GenreID;
    //private data member for the CustomerNo property
    private Int32 mEditionNo;
    //private data member for the CustomerNo property
    private String mShelfNo;



    //public property for Mobile number
    public int ISBN
    {
        get
        {
            //return the private data
            return mISBN;
        }


        set
        {
            //set the value of the private data member
            mISBN = value;
        }
    }

    //public property for Customer Number
    public String Title
    {
        get
        {
            //return the private data
            return mTitle;
        }
        set
        {
            //set the value of the private data member
            mTitle = value;
        }
    }

    //public property for First Name
    public string Author
    {
        get
        {
            //return the private data
            return mAuthor;
        }
        set
        {
            //set the value of the private data member
            mAuthor = value;
        }

    }

    //public property for Last Name
    public string Publisher
    {
        get
        {
            //return the private data
            return mPublisher;
        }
        set
        {
            //set the value of the private data member
            mPublisher = value;
        }

    }



    //public property for House Number
    public int PublishedYear
    {
        get
        {
            //return the private data
            return mPublishedYear;
        }
        set
        {
            //set the value of the private data member
            mPublishedYear = value;
        }

    }

    //public property for Post Code
    public string FK_GenreID
    {
        get
        {
            //return the private data
            return mFK_GenreID;
        }
        set
        {
            //set the value of the private data member
            mFK_GenreID = value;
        }

    }

    //public property for Town
    public string ShelfNo
    {
        get
        {
            //return the private data
            return mShelfNo;
        }
        set
        {
            //set the value of the private data member
            mShelfNo = value;
        }

    }

    //public property for Email
    public int EditionNo
    {
        get
        {
            //return the private data
            return mEditionNo;
        }
        set
        {
            //set the value of the private data member
            mEditionNo = value;
        }

    }





    public bool Find(int ISBN)
    {
        //create an instance of the data connection
        clsDataConnection DB = new clsDataConnection();
        //add the parameter for the book ref to search for
        DB.AddParameter("@ISBN", ISBN);
        //execute stored procedure
        DB.Execute("sproc_BookTable_FilterByISBN");
        //if one record is found
        if (DB.Count == 1)
        {
            //copy the data from the database to the private data members
            mISBN = Convert.ToInt32(DB.DataTable.Rows[0]["ISBN"]);
            mTitle = Convert.ToString(DB.DataTable.Rows[0]["Title"]);
            mAuthor = Convert.ToString(DB.DataTable.Rows[0]["Author"]);
            mPublisher = Convert.ToString(DB.DataTable.Rows[0]["Publisher"]);
            mPublishedYear = Convert.ToInt32(DB.DataTable.Rows[0]["PublishedYear"]);
            mFK_GenreID = Convert.ToString(DB.DataTable.Rows[0]["FK_GenreID"]);
            mEditionNo = Convert.ToInt32(DB.DataTable.Rows[0]["EditionNo"]);
            mShelfNo = Convert.ToString(DB.DataTable.Rows[0]["ShelfNo"]);



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


    public string Valid(string title, string author, string publisher, string publishedYear, string genreId, string editionNo, string shelfNo)
    {
        //temp variable to store start date

        string Error = "";


        ////title

        if (title.Length == 0)
        {
            Error = Error + "The first may not be blank";
        }
        if (title.Length > 50)
        {
            Error = Error + " The title book must be less than 50 characters :   ";
        }


        ////Author

        if (author.Length == 0)
        {
            Error = Error + "The first may not be blank";
        }
        if (author.Length > 50)
        {
            Error = Error + " The author name must be less than 50 characters :   ";
        }



        ////Publisher

        if (publisher.Length == 0)
        {
            Error = Error + "The last name may not be blank";
        }
        if (publisher.Length > 50)
        {
            Error = Error + " The last name must be less than 50 characters :   ";
        }

        //Published Year
        if (publishedYear.Length == 0)
        {
            Error = Error + " Contact Number is too short : ";
        }
        if (publishedYear.Length > 5)
        {
            Error = Error + " Contact Number is too long :  ";
        }


        //Genre ID
        if (genreId.Length == 0)
        {
            Error = Error + "The town may not be blank";
        }
        if (genreId.Length > 50)
        {
            Error = Error + " The town must be less than 20 characters :   ";
        }


        //Edition No

        if (editionNo.Length < 0)
        {
            Error = Error + " Contact Number is too short : ";
        }
        if (editionNo.Length > 16)
        {
            Error = Error + " Contact Number is too long :  ";
        }

        //Shelf No
        if (shelfNo.Length == 0)
        {
            Error = Error + "The post code may not be blank";
        }
        if (shelfNo.Length > 30)
        {
            Error = Error + " The post code must be less than 10 characters :   ";
        }

        //return any error message
        return Error;
    }




}


