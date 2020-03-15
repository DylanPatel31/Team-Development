using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Class_Library
{
    public class clsUserCollection
    {
        clsDataConnection dBConnection = new clsDataConnection(); //create a connection to the database
                                                                  //member var for current address
        clsUser mThisUser = new clsUser();
        public clsUserCollection()
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
                MyDatabase.AddParameter("@user_id", mThisUser.user_id);
                //execute the stored procedure in the database
                MyDatabase.Execute("sproc_tblUser_Delete");
                //set the return value for the function
                return true;
            }
            catch //do this if the code above failed for some reason
            {
                //report back that there was an error
                return false;
            }
        }

        public List<clsUser> UserList
        {
            get
            {
                //create an array list of type clsPhone
                List<clsUser> mUserList = new List<clsUser>();
                //var to store the count of records
                Int32 RecordCount;
                //var to store the index for the loop
                Int32 Index = 0;
                RecordCount = dBConnection.Count;
                //keep looping till all records are processed
                while (Index < RecordCount)
                {
                    //create a blank phone
                    clsUser BlankPage = new clsUser();
                    //copy the data from the table to the RAM
                    BlankPage.user_id = Convert.ToInt32(dBConnection.DataTable.Rows[Index]["user_id"]);
                    BlankPage.firstName = Convert.ToString(dBConnection.DataTable.Rows[Index]["firstName"]);
                    BlankPage.surname = Convert.ToString(dBConnection.DataTable.Rows[Index]["surname"]);
                    BlankPage.email = Convert.ToString(dBConnection.DataTable.Rows[Index]["email"]);
                    BlankPage.password = Convert.ToString(dBConnection.DataTable.Rows[Index]["password"]);
                    BlankPage.fk1_userType_id = Convert.ToString(dBConnection.DataTable.Rows[Index]["fk1_userType_id"]);
                    //add the blank page to the array list
                    mUserList.Add(BlankPage);
                    //increase the index
                    Index++;
                }
                //return the list as the return value of the function
                return mUserList;
            }
        }


        //this function defines theFilterByPostCode method
        public void FilterByFirstName(string firstName)
        // it accepts a single parameter DeviceName and returns no value
        {
            //initialise the DBConnection
            dBConnection = new clsDataConnection();
            //add the parameter data used by the stored procedure
            dBConnection.AddParameter("@firstName", firstName);
            //execute the stored procedure
            dBConnection.Execute("sproc_tblUser_FilterByStaffFirstName");
        }

        public void FilterByFirstName2(string firstName)
        // it accepts a single parameter DeviceName and returns no value
        {
            //initialise the DBConnection
            dBConnection = new clsDataConnection();
            //add the parameter data used by the stored procedure
            dBConnection.AddParameter("@firstName", firstName);
            //execute the stored procedure
            dBConnection.Execute("sproc_tblUser_FilterByCustomerFirstName");
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
            NewDBPhone.AddParameter("@user_id", mThisUser.user_id);
            NewDBPhone.AddParameter("@firstName", mThisUser.firstName);
            NewDBPhone.AddParameter("@surname", mThisUser.surname);
            NewDBPhone.AddParameter("@email", mThisUser.email);
            NewDBPhone.AddParameter("@password", mThisUser.password);
            NewDBPhone.AddParameter("@fk1_userType_id", mThisUser.fk1_userType_id);
            //execute the stored procedure returning the primary key value of the new record
            return NewDBPhone.Execute("sproc_tblUser_Insert3");
        }

        public void Update()
        {
            ///this function will update an existing phone to the databas
            ///it accepts a single parameter an object of type clsPhone
            ///the PhoneID property must have a valid value for this to work
            //connect to the database
            clsDataConnection ExistingDBPhone = new clsDataConnection();
            //add the parameters
            ExistingDBPhone.AddParameter("@user_id", mThisUser.user_id);
            ExistingDBPhone.AddParameter("@firstName", mThisUser.firstName);
            ExistingDBPhone.AddParameter("@surname", mThisUser.surname);
            ExistingDBPhone.AddParameter("@email", mThisUser.email);
            ExistingDBPhone.AddParameter("@password", mThisUser.password);
            ExistingDBPhone.AddParameter("@fk1_userType_id", mThisUser.fk1_userType_id);
            //execute the query
            ExistingDBPhone.Execute("sproc_tblUser_Update3");
        }

        //public ThisFilm property
        public clsUser ThisUser
        {
            get
            {
                return mThisUser;
            }
            set
            {
                mThisUser = value;
            }
        }
    }
}
