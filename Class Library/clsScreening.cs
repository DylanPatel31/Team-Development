using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Class_Library
{
    public class clsScreening
    {
        //PhoneID private member variable
        private Int32 mscreening_id;
        //PhoneID public property
        public Int32 screening_id
        {
            get
            {
                //this line of code sends data out of the property
                return mscreening_id;
            }
            set
            {
                //this line of code allows data into the property
                mscreening_id = value;
            }
        }

        //DeviceName private member variable
        private string mfilmName;
        //DeviceName public property
        public string filmName
        {
            get
            {
                return mfilmName;
            }
            set
            {
                mfilmName = value;
            }
        }

        //PhoneID private member variable
        private Int32 mtheaterNo;
        //PhoneID public property
        public Int32 theaterNo
        {
            get
            {
                //this line of code sends data out of the property
                return mtheaterNo;
            }
            set
            {
                //this line of code allows data into the property
                mtheaterNo = value;
            }
        }



        //Memory private member variable
        private string mtheaterType;
        //Memory public property
        public string theaterType
        {
            get
            {
                return mtheaterType;
            }
            set
            {
                mtheaterType = value;
            }
        }


        //PhoneID private member variable
        private Int32 mstartTime;
        //PhoneID public property
        public Int32 startTime
        {
            get
            {
                //this line of code sends data out of the property
                return mstartTime;
            }
            set
            {
                //this line of code allows data into the property
                mstartTime = value;
            }
        }


        //DateAdded private member variable
        private DateTime mdateOfScreeening;
        //DateAdded public property
        public DateTime dateOfScreeening
        {
            get
            {
                return mdateOfScreeening;
            }
            set
            {
                mdateOfScreeening = value;
            }
        }




        public string ScreeningValid(string filmName,
                                 string theaterNo,
                                 string theaterType,
                                 string startTime,
                                 string dateOfScreeening)

        {
            //var to store the error message
            string ErrorMsg = "";
            //check the min length of the filmName
            if (filmName.Length == 0)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "filmName is blank. ";
            }
            //check the max length of the filmName
            if (filmName.Length > 50)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "filmName must be less than 50 characters. ";
            }


            //check the min length of theaterNo
            if (theaterNo.Length == 0)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "theaterNo is blank. ";
            }
            //check the max length of the theaterNo
            if (theaterNo.Length > 2)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "theaterNo must be less than 2 characters. ";
            }
            //check the min length of the Price


            if (theaterType.Length == 0)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "theaterType is blank. ";
            }
            //check the max length of the email
            if (theaterType.Length > 50)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "theaterType must be less than 50 characters. ";
            }

            //check the min length of the startTime
            if (startTime.Length == 0)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "startTime is blank. ";
            }
            //check the max length of the password
            if (startTime.Length > 5)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "startTime must be less than 5 characters. ";
            }



            //test if the date is valid
            try//try the operation
            {
                //var to store the date
                DateTime Temp;
                //assign the date to the temporary var
                Temp = Convert.ToDateTime(dateOfScreeening);
            }
            catch//if it failed report an error
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "dateOfScreeening is not valid. ";
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
        public Boolean Find(Int32 screening_id)
        {
            //initialise the DBConnection
            clsDataConnection dBConnection = new clsDataConnection();
            //add the phone no parameter
            dBConnection.AddParameter("screening_id", screening_id);
            //execute the query
            dBConnection.Execute("sproc_FilterBy_screening_id");
            //if the record was found
            if (dBConnection.Count == 1)
            {
                //get the film_id
                mscreening_id = Convert.ToInt32(dBConnection.DataTable.Rows[0]["screening_id"]);
                //get the filmName
                mfilmName = Convert.ToString(dBConnection.DataTable.Rows[0]["filmName"]);
                //get the film_id
                mtheaterNo = Convert.ToInt32(dBConnection.DataTable.Rows[0]["theaterNo"]);
                //get the duration
                mtheaterType = Convert.ToString(dBConnection.DataTable.Rows[0]["theaterType"]);
                //get the film_id
                mstartTime = Convert.ToInt32(dBConnection.DataTable.Rows[0]["startTime"]);
                //get the releaseDate
                mdateOfScreeening = Convert.ToDateTime(dBConnection.DataTable.Rows[0]["dateOfScreeening"]);
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
