using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Class_Library
{
    public class clsFilmCollection
    {
        clsDataConnection dBConnection = new clsDataConnection(); //create a connection to the database
                                                                  //member var for current address
        clsFilm mThisFilm = new clsFilm();
        public clsFilmCollection()
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
                MyDatabase.AddParameter("@film_id", mThisFilm.film_id);
                //execute the stored procedure in the database
                MyDatabase.Execute("sproc_tblFilm_Delete");
                //set the return value for the function
                return true;
            }
            catch //do this if the code above failed for some reason
            {
                //report back that there was an error
                return false;
            }
        }

        public List<clsFilm> FilmList
        {
            get
            {
                //create an array list of type clsPhone
                List<clsFilm> mFilmList = new List<clsFilm>();
                //var to store the count of records
                Int32 RecordCount;
                //var to store the index for the loop
                Int32 Index = 0;
                RecordCount = dBConnection.Count;
                //keep looping till all records are processed
                while (Index < RecordCount)
                {
                    //create a blank phone
                    clsFilm BlankPage = new clsFilm();
                    //copy the data from the table to the RAM
                    BlankPage.film_id = Convert.ToInt32(dBConnection.DataTable.Rows[Index]["film_id"]);
                    BlankPage.filmName = Convert.ToString(dBConnection.DataTable.Rows[Index]["filmName"]);
                    BlankPage.genre = Convert.ToString(dBConnection.DataTable.Rows[Index]["genre"]);
                    BlankPage.duration = Convert.ToInt32(dBConnection.DataTable.Rows[Index]["duration"]);
                    BlankPage.ageRated = Convert.ToInt32(dBConnection.DataTable.Rows[Index]["ageRated"]);
                    BlankPage.director = Convert.ToString(dBConnection.DataTable.Rows[Index]["director"]);
                    BlankPage.description = Convert.ToString(dBConnection.DataTable.Rows[Index]["description"]);
                    BlankPage.fk1_filmCast_id = Convert.ToInt32(dBConnection.DataTable.Rows[Index]["fk1_filmCast_id"]);
                    BlankPage.releaseDate = Convert.ToDateTime(dBConnection.DataTable.Rows[Index]["releaseDate"]);
                    //add the blank page to the array list
                    mFilmList.Add(BlankPage);
                    //increase the index
                    Index++;
                }
                //return the list as the return value of the function
                return mFilmList;
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
            dBConnection.Execute("sproc_tblFilm_FilterByFilmName");
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
        //INSERT INTO tblPhones
        //        (DeviceName, Brand, OperatingSystem, Memory, Camera, Price, DateAdded, Available)

        //SELECT @DeviceName, @Brand, @OperatingSystem, @Memory, @Camera, @Price, @DateAdded, @Available;
        {
            //connect to the database
            clsDataConnection NewDBPhone = new clsDataConnection();
            //add the parameters
            NewDBPhone.AddParameter("@filmName", mThisFilm.filmName);
            NewDBPhone.AddParameter("@genre", mThisFilm.genre);
            NewDBPhone.AddParameter("@duration", mThisFilm.duration);
            NewDBPhone.AddParameter("@ageRated", mThisFilm.ageRated);
            NewDBPhone.AddParameter("@director", mThisFilm.director);
            NewDBPhone.AddParameter("@description", mThisFilm.description);
            NewDBPhone.AddParameter("@fk1_filmCast_id", mThisFilm.fk1_filmCast_id);
            NewDBPhone.AddParameter("@releaseDate", mThisFilm.releaseDate);
            //execute the stored procedure returning the primary key value of the new record
            return NewDBPhone.Execute("sproc_tblFilm_Insert2");
        }

        public void Update()
        {
            ///this function will update an existing phone to the databas
            ///it accepts a single parameter an object of type clsPhone
            ///the PhoneID property must have a valid value for this to work
            //connect to the database
            clsDataConnection ExistingDBPhone = new clsDataConnection();
            //add the parameters
            ExistingDBPhone.AddParameter("@film_id", mThisFilm.film_id);
            ExistingDBPhone.AddParameter("@filmName", mThisFilm.filmName);
            ExistingDBPhone.AddParameter("@genre", mThisFilm.genre);
            ExistingDBPhone.AddParameter("@duration", mThisFilm.duration);
            ExistingDBPhone.AddParameter("@ageRated", mThisFilm.ageRated);
            ExistingDBPhone.AddParameter("@director", mThisFilm.director);
            ExistingDBPhone.AddParameter("@description", mThisFilm.description);
            ExistingDBPhone.AddParameter("@fk1_filmCast_id", mThisFilm.fk1_filmCast_id);
            ExistingDBPhone.AddParameter("@releaseDate", mThisFilm.releaseDate);
            //execute the query
            ExistingDBPhone.Execute("sproc_tblFilm_Update");
        }

        //public ThisFilm property
        public clsFilm ThisFilm
        {
            get
            {
                return mThisFilm;
            }
            set
            {
                mThisFilm = value;
            }
        }
    }
}
