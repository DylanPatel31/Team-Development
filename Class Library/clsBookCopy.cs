using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsPhone
/// </summary>
public class clsBookCopy
{
    public clsBookCopy()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    private Int32 mISBN;
    public Int32 ISBN
    {
        get
        {
            return mISBN;
        }
        set
        {
            mISBN = value;
        }
    }

    private string mTitle;
    public string Title
    {
        get
        {
            return mTitle;
        }
        set
        {
            mTitle = value;
        }
    }

    private string mAuthor;
    public string Author
    {
        get
        {
            return mAuthor;
        }
        set
        {
            mAuthor = value;
        }
    }

    private string mPublisher;
    public string Publisher
    {
        get
        {
            return mPublisher;
        }
        set
        {
            mPublisher = value;
        }
    }

    private Int32 mPublishedYear;
    public Int32 PublishedYear
    {
        get
        {
            return mPublishedYear;
        }
        set
        {
            mPublishedYear = value;
        }
    }

    private Int32 mEditionNo;
    public Int32 EditionNo
    {
        get
        {
            return mEditionNo;
        }
        set
        {
            mEditionNo = value;
        }
    }

    private string mCopyCondition;
    public string CopyCondition
    {
        get
        {
            return mCopyCondition;
        }
        set
        {
            mCopyCondition = value;
        }
    }

    private string mCopyStatus;
    public string CopyStatus
    {
        get
        {
            return mCopyStatus;
        }
        set
        {
            mCopyStatus = value;
        }
    }

    private string mPhoneImage;
    public string PhoneImage
    {
        get
        {
            return mPhoneImage;
        }
        set
        {
            mPhoneImage = value;
        }
    }

    public Boolean Find(Int32 PhoneNo)
    {
        //create and array List of DVDs 
        List<clsBookCopy> mPhoneList = new List<clsBookCopy>();
        //create a single Phone
        clsBookCopy SomePhone = new clsBookCopy();
        SomePhone.ISBN = 1;
        SomePhone.Title = "A spy among friends";
        SomePhone.Author = "Willian Boyd";
        SomePhone.Publisher = "Daily Express";
        SomePhone.PublishedYear = 2013;
        SomePhone.EditionNo = 1;
        SomePhone.CopyCondition = "Good Condition";
        SomePhone.CopyStatus = "Available";
        SomePhone.PhoneImage = "ImageBook1.JPEG";
        //add it to the array list
        mPhoneList.Add(SomePhone);

        //create another Phone
        SomePhone = new clsBookCopy();
        SomePhone.ISBN = 2;
        SomePhone.Title = "Road To Madrid";
        SomePhone.Author = "Jose Morinho";
        SomePhone.Publisher = "Marco Delmo";
        SomePhone.PublishedYear = 2016;
        SomePhone.EditionNo = 1;
        SomePhone.CopyCondition = "Damaged";
        SomePhone.CopyStatus = "Available";
        SomePhone.PhoneImage = "Book1.JPEG";
        //add it to the array list
        mPhoneList.Add(SomePhone);

        //create another DVD
        SomePhone = new clsBookCopy();
        SomePhone.ISBN = 3;
        SomePhone.Title = "Learn C#";
        SomePhone.Author = "Mathew Dean";
        SomePhone.Publisher = "DMU Library";
        SomePhone.PublishedYear = 2014;
        SomePhone.EditionNo = 1;
        SomePhone.CopyCondition = "Good Condition";
        SomePhone.CopyStatus = "Available";
        SomePhone.PhoneImage = "DMU.jpg";
        //add it to the array list
        mPhoneList.Add(SomePhone);

        //is the value to find between 1 and 3?
        if (PhoneNo >= 1 & PhoneNo <= 3)
        {
            //subtrace 1 off he primary key so that it maps to the index of the array
            PhoneNo--;
            //copy the data from the array list to the private member variable
            mISBN = mPhoneList[PhoneNo].ISBN;
            mTitle = mPhoneList[PhoneNo].Title;
            mAuthor = mPhoneList[PhoneNo].Author;
            mPublisher = mPhoneList[PhoneNo].Publisher;
            mPublishedYear = mPhoneList[PhoneNo].PublishedYear;
            mEditionNo = mPhoneList[PhoneNo].EditionNo;
            mCopyCondition = mPhoneList[PhoneNo].CopyCondition;
            mCopyStatus = mPhoneList[PhoneNo].CopyStatus;
            mPhoneImage = mPhoneList[PhoneNo].PhoneImage;
            //return true i.e record found 
            return true;
        }
        else
        {
            //return false i.e record not found 
            return false;
        }
    }
}