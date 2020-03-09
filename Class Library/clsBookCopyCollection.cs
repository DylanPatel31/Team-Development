using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Class_Library
{
    public class clsBookCopyCollection
    {
        public clsBookCopyCollection()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public List<clsBookCopy> PhoneList
        {
            get
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
                //add it to the array list
                mPhoneList.Add(SomePhone);
                //return the populated list
                return mPhoneList;

            }
        }

        public Int32 Count
        {
            //hard coded count property
            get
            {
                return 3;
            }
        }
    }
}
