using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Class_Library
{
    public class clsBookingCollection
    {
        clsDataConnection dBConnection = new clsDataConnection(); //create a connection to the database
                                                                  //member var for current address
        clsBooking mThisBooking = new clsBooking();

        public clsBookingCollection()
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
                MyDatabase.AddParameter("@booking_id", mThisBooking.booking_id);
                //execute the stored procedure in the database
                MyDatabase.Execute("sproc_tblBooking_Delete");
                //set the return value for the function
                return true;
            }
            catch //do this if the code above failed for some reason
            {
                //report back that there was an error
                return false;
            }
        }

        public List<clsBooking> BookingList
        {
            get
            {
                //create an array list of type clsPhone
                List<clsBooking> mBookingList = new List<clsBooking>();
                //var to store the count of records
                Int32 RecordCount;
                //var to store the index for the loop
                Int32 Index = 0;
                RecordCount = dBConnection.Count;
                //keep looping till all records are processed
                while (Index < RecordCount)
                {
                    //create a blank phone
                    clsBooking BlankPage = new clsBooking();
                    //copy the data from the table to the RAM
                    BlankPage.booking_id = Convert.ToInt32(dBConnection.DataTable.Rows[Index]["booking_id"]);
                    BlankPage.firstName = Convert.ToString(dBConnection.DataTable.Rows[Index]["firstName"]);
                    BlankPage.fk1_user_id = Convert.ToInt32(dBConnection.DataTable.Rows[Index]["fk1_user_id"]);
                    BlankPage.fk2_seat_id = Convert.ToInt32(dBConnection.DataTable.Rows[Index]["fk2_seat_id"]);
                    BlankPage.fk3_screening_id = Convert.ToInt32(dBConnection.DataTable.Rows[Index]["fk3_screening_id"]);
                    BlankPage.price = Convert.ToInt32(dBConnection.DataTable.Rows[Index]["price"]);


                    //add the blank page to the array list
                    mBookingList.Add(BlankPage);
                    //increase the index
                    Index++;
                }
                //return the list as the return value of the function
                return mBookingList;
            }
        }


        //this function defines theFilterByPostCode method
        public void FilterByFilterByCustomerName(string firstName)
        // it accepts a single parameter DeviceName and returns no value
        {
            //initialise the DBConnection
            dBConnection = new clsDataConnection();
            //add the parameter data used by the stored procedure
            dBConnection.AddParameter("@firstName", firstName);
            //execute the stored procedure
            dBConnection.Execute("sproc_tblBooking_FilterByCustomerName");
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
            NewDBPhone.AddParameter("@firstName", mThisBooking.firstName);
            NewDBPhone.AddParameter("@fk1_user_id", mThisBooking.fk1_user_id);
            NewDBPhone.AddParameter("@fk2_seat_id", mThisBooking.fk2_seat_id);
            NewDBPhone.AddParameter("@fk3_screening_id", mThisBooking.fk3_screening_id);
            NewDBPhone.AddParameter("@price", mThisBooking.price);
            //execute the stored procedure returning the primary key value of the new record
            return NewDBPhone.Execute("sproc_tblBooking_Insert");
        }

        public void Update()
        {
            ///this function will update an existing phone to the databas
            ///it accepts a single parameter an object of type clsPhone
            ///the PhoneID property must have a valid value for this to work
            //connect to the database
            clsDataConnection ExistingDBPhone = new clsDataConnection();
            //add the parameters
            ExistingDBPhone.AddParameter("@booking_id", mThisBooking.booking_id);
            ExistingDBPhone.AddParameter("@firstName", mThisBooking.firstName);
            ExistingDBPhone.AddParameter("@fk1_user_id", mThisBooking.fk1_user_id);
            ExistingDBPhone.AddParameter("@fk2_seat_id", mThisBooking.fk2_seat_id);
            ExistingDBPhone.AddParameter("@fk3_screening_id", mThisBooking.fk3_screening_id);
            ExistingDBPhone.AddParameter("@price", mThisBooking.price);
            //execute the query
            ExistingDBPhone.Execute("sproc_tblBooking_Update");
        }

        //public ThisFilm property
        public clsBooking ThisBooking
        {
            get
            {
                return mThisBooking;
            }
            set
            {
                mThisBooking = value;
            }
        }
    }
}
