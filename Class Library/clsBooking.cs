using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Class_Library
{
    public class clsBooking
    {
        //PhoneID private member variable
        private Int32 mbooking_id;
        //PhoneID public property
        public Int32 booking_id
        {
            get
            {
                //this line of code sends data out of the property
                return mbooking_id;
            }
            set
            {
                //this line of code allows data into the property
                mbooking_id = value;
            }
        }

        //DeviceName private member variable
        private string mfirstName;
        //DeviceName public property
        public string firstName
        {
            get
            {
                return mfirstName;
            }
            set
            {
                mfirstName = value;
            }
        }

        //PhoneID private member variable
        private Int32 mfk1_user_id;
        //PhoneID public property
        public Int32 fk1_user_id
        {
            get
            {
                //this line of code sends data out of the property
                return mfk1_user_id;
            }
            set
            {
                //this line of code allows data into the property
                mfk1_user_id = value;
            }
        }




        //PhoneID private member variable
        private Int32 mfk2_seat_id;
        //PhoneID public property
        public Int32 fk2_seat_id
        {
            get
            {
                //this line of code sends data out of the property
                return mfk2_seat_id;
            }
            set
            {
                //this line of code allows data into the property
                mfk2_seat_id = value;
            }
        }



        //PhoneID private member variable
        private Int32 mfk3_screening_id;
        //PhoneID public property
        public Int32 fk3_screening_id
        {
            get
            {
                //this line of code sends data out of the property
                return mfk3_screening_id;
            }
            set
            {
                //this line of code allows data into the property
                mfk3_screening_id = value;
            }
        }




        //PhoneID private member variable
        private Int32 mprice;
        //PhoneID public property
        public Int32 price
        {
            get
            {
                //this line of code sends data out of the property
                return mprice;
            }
            set
            {
                //this line of code allows data into the property
                mprice = value;
            }
        }




        public string BookingValid(string firstName,
                                 string fk1_user_id,
                                 string fk2_seat_id,
                                 string fk3_screening_id,
                                 string price)

        {
            //var to store the error message
            string ErrorMsg = "";
            //check the min length of the firstName
            if (firstName.Length == 0)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "firstName is blank. ";
            }
            //check the max length of the filmName
            if (firstName.Length > 50)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "firstName must be less than 50 characters. ";
            }


            //check the min length of fk1_user_id
            if (fk1_user_id.Length == 0)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "fk1_user_id is blank. ";
            }
            //check the max length of the theaterNo
            if (fk1_user_id.Length > 3)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "fk1_user_id must be less than 3 characters. ";
            }
            //check the min length of the Price


            if (fk2_seat_id.Length == 0)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "fk2_seat_id is blank. ";
            }
            //check the max length of the fk2_seat_id
            if (fk2_seat_id.Length > 3)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "fk2_seat_id must be less than 3 characters. ";
            }

            //check the min length of the fk3_screening_id
            if (fk3_screening_id.Length == 0)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "fk3_screening_id is blank. ";
            }
            //check the max length of the fk3_screening_id
            if (fk3_screening_id.Length > 3)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "fk3_screening_id must be less than 3 characters. ";
            }

            //if there were no errors
            if (ErrorMsg == "")
            {
                //return a blank string
                return "";
            }
            else//otherwise
            {
                //return the errors string value
                return "There were the following errors : " + ErrorMsg;
            }

        }

        //function for the find public method
        public Boolean Find(Int32 booking_id)
        {
            //initialise the DBConnection
            clsDataConnection dBConnection = new clsDataConnection();
            //add the phone no parameter
            dBConnection.AddParameter("booking_id", booking_id);
            //execute the query
            dBConnection.Execute("sproc_FilterBy_booking_id");
            //if the record was found
            if (dBConnection.Count == 1)
            {
                //get the film_id
                mbooking_id = Convert.ToInt32(dBConnection.DataTable.Rows[0]["booking_id"]);
                //get the filmName
                mfirstName = Convert.ToString(dBConnection.DataTable.Rows[0]["firstName"]);
                //get the film_id
                mfk1_user_id = Convert.ToInt32(dBConnection.DataTable.Rows[0]["fk1_user_id"]);
                //get the film_id
                mfk2_seat_id = Convert.ToInt32(dBConnection.DataTable.Rows[0]["fk2_seat_id"]);
                //get the film_id
                mfk3_screening_id = Convert.ToInt32(dBConnection.DataTable.Rows[0]["fk3_screening_id"]);
                //get the film_id
                mprice = Convert.ToInt32(dBConnection.DataTable.Rows[0]["price"]);
                //return success
                return true;
            }
            else
            {
                //return failure
                return false;
            }

        }
    }
}
