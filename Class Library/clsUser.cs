using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Class_Library
{
    public class clsUser
    {
        //PhoneID private member variable
        private Int32 muser_id;
        //PhoneID public property
        public Int32 user_id
        {
            get
            {
                //this line of code sends data out of the property
                return muser_id;
            }
            set
            {
                //this line of code allows data into the property
                muser_id = value;
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

        //Brand private member variable
        private string msurname;
        //Brand public property
        public string surname
        {
            get
            {
                return msurname;
            }
            set
            {
                msurname = value;
            }
        }






        //OperatingSystem private member variable
        private string memail;
        //OperatingSystem public property
        public string email
        {
            get
            {
                return memail;
            }
            set
            {
                memail = value;
            }
        }

        //Memory private member variable
        private string mpassword;
        //Memory public property
        public string password
        {
            get
            {
                return mpassword;
            }
            set
            {
                mpassword = value;
            }
        }






        //Memory private member variable
        private string mfk1_userType_id;
        //Memory public property
        public string fk1_userType_id
        {
            get
            {
                return mfk1_userType_id;
            }
            set
            {
                mfk1_userType_id = value;
            }
        }



        public string UserValid( string user_id,
                                 string firstName,
                                 string surname,
                                 string email,
                                 string password,
                                 string fk1_userType_id)

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


            //check the min length of surname
            if (surname.Length == 0)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "surname is blank. ";
            }
            //check the max length of the genre
            if (surname.Length > 50)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "surname must be less than 50 characters. ";
            }
            //check the min length of the Price


            if (email.Length == 0)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "email is blank. ";
            }
            //check the max length of the email
            if (email.Length > 50)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "email must be less than 50 characters. ";
            }

            //check the min length of the password
            if (password.Length == 0)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "password is blank. ";
            }
            //check the max length of the password
            if (password.Length > 50)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "password must be less than 50 characters. ";
            }


            //check the min length of fk1_userType_id
            if (fk1_userType_id.Length == 0)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "fk1_userType_id is blank. ";
            }
            //check the max length of the fk1_userType_id
            if (fk1_userType_id.Length > 50)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + " fk1_userType_id must be less than 50 characters. ";
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
        public Boolean Find(Int32 user_id)
        {
            //initialise the DBConnection
            clsDataConnection dBConnection = new clsDataConnection();
            //add the phone no parameter
            dBConnection.AddParameter("user_id", user_id);
            //execute the query
            dBConnection.Execute("sproc_FilterBy_UserID2");
            //if the record was found
            if (dBConnection.Count == 1)
            {
                //get the film_id
                muser_id = Convert.ToInt32(dBConnection.DataTable.Rows[0]["user_id"]);
                //get the filmName
                mfirstName = Convert.ToString(dBConnection.DataTable.Rows[0]["firstName"]);
                //get the genre
                msurname = Convert.ToString(dBConnection.DataTable.Rows[0]["surname"]);
                //get the duration
                memail = Convert.ToString(dBConnection.DataTable.Rows[0]["email"]);
                //get the ageRated
                mpassword = Convert.ToString(dBConnection.DataTable.Rows[0]["password"]);
                //return success
                //get the director
                mfk1_userType_id = Convert.ToString(dBConnection.DataTable.Rows[0]["fk1_userType_id"]);
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
