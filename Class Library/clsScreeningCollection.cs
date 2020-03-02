using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Class_Library
{
    public class clsScreeningCollection
    {
        clsDataConnection dBConnection = new clsDataConnection(); //create a connection to the database
                                                                  //member var for current address
        clsScreening mThisScreening = new clsScreening();

        public clsScreeningCollection()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public Boolean Delete()
        {
            ///this public function provides the functionality for the delete method

            try //try to delete the record
            {
                //create an instance of the data connection class called MyDatabase
                clsDataConnection MyDatabase = new clsDataConnection();
                //add the PhoneID parameter passed to this function to the list of parameters to use in the database
                MyDatabase.AddParameter("@screening_id", mThisScreening.screening_id);
                //execute the stored procedure in the database
                MyDatabase.Execute("sproc_tblScreening_Delete");
                //set the return value for the function
                return true;
            }
            catch //do this if the code above failed for some reason
            {
                //report back that there was an error
                return false;
            }
        }

        public List<clsScreening> ScreeningList
        {
            get
            {
                //create an array list of type clsPhone
                List<clsScreening> mScreeningList = new List<clsScreening>();
                //var to store the count of records
                Int32 RecordCount;
                //var to store the index for the loop
                Int32 Index = 0;
                RecordCount = dBConnection.Count;
                //keep looping till all records are processed
                while (Index < RecordCount)
                {
                    //create a blank phone
                    clsScreening BlankPage = new clsScreening();
                    //copy the data from the table to the RAM
                    BlankPage.screening_id = Convert.ToInt32(dBConnection.DataTable.Rows[Index]["screening_id"]);
                    BlankPage.filmName = Convert.ToString(dBConnection.DataTable.Rows[Index]["filmName"]);
                    BlankPage.theaterNo = Convert.ToInt32(dBConnection.DataTable.Rows[Index]["theaterNo"]);
                    BlankPage.theaterType = Convert.ToString(dBConnection.DataTable.Rows[Index]["theaterType"]);
                    BlankPage.startTime = Convert.ToInt32(dBConnection.DataTable.Rows[Index]["startTime"]);
                    BlankPage.dateOfScreeening = Convert.ToDateTime(dBConnection.DataTable.Rows[Index]["dateOfScreeening"]);

                    //add the blank page to the array list
                    mScreeningList.Add(BlankPage);
                    //increase the index
                    Index++;
                }
                //return the list as the return value of the function
                return mScreeningList;
            }
        }


        //this function defines theFilterByPostCode method
        public void FilterByFilmName(string filmName)
        // it accepts a single parameter DeviceName and returns no value
        {
            //initialise the DBConnection
            dBConnection = new clsDataConnection();
            //add the parameter data used by the stored procedure
            dBConnection.AddParameter("@filmName", filmName);
            //execute the stored procedure
            dBConnection.Execute("sproc_tblScreening_FilterByScreeningFilmName");
        }


        public Int32 Count
        //public read only property for the count of records found
        {
            get
            {
                //get the count of records
                return dBConnection.Count;
            }
        }

        public Int32 Add()
        ///this function will add a new phone to the database
        ///it accepts a single parameter an object of type clsPhone
        ///once the record is added the function returns the rimary key value of the new record
        {
            //connect to the database
            clsDataConnection NewDBPhone = new clsDataConnection();
            //add the parameters
            NewDBPhone.AddParameter("@filmName", mThisScreening.filmName);
            NewDBPhone.AddParameter("@theaterNo", mThisScreening.theaterNo);
            NewDBPhone.AddParameter("@theaterType", mThisScreening.theaterType);
            NewDBPhone.AddParameter("@startTime", mThisScreening.startTime);
            NewDBPhone.AddParameter("@dateOfScreeening", mThisScreening.dateOfScreeening);
            //execute the stored procedure returning the primary key value of the new record
            return NewDBPhone.Execute("sproc_tblScreening_Insert");
        }

        public void Update()
        {
            ///this function will update an existing phone to the databas
            ///it accepts a single parameter an object of type clsPhone
            ///the PhoneID property must have a valid value for this to work
            //connect to the database
            clsDataConnection ExistingDBPhone = new clsDataConnection();
            //add the parameters
            ExistingDBPhone.AddParameter("@screening_id", mThisScreening.screening_id);
            ExistingDBPhone.AddParameter("@filmName", mThisScreening.filmName);
            ExistingDBPhone.AddParameter("@theaterNo", mThisScreening.theaterNo);
            ExistingDBPhone.AddParameter("@theaterType", mThisScreening.theaterType);
            ExistingDBPhone.AddParameter("@startTime", mThisScreening.startTime);
            ExistingDBPhone.AddParameter("@dateOfScreeening", mThisScreening.dateOfScreeening);
            //execute the query
            ExistingDBPhone.Execute("sproc_tblScreening_Update");
        }

        //public ThisFilm property
        public clsScreening ThisScreening
        {
            get
            {
                return mThisScreening;
            }
            set
            {
                mThisScreening = value;
            }
        }
    }
}
