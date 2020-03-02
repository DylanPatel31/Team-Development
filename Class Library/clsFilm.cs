using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Class_Library
{
    public class clsFilm
    {
        //PhoneID private member variable
        private Int32 mfilm_id;
        //PhoneID public property
        public Int32 film_id
        {
            get
            {
                //this line of code sends data out of the property
                return mfilm_id;
            }
            set
            {
                //this line of code allows data into the property
                mfilm_id = value;
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

        //Brand private member variable
        private string mgenre;
        //Brand public property
        public string genre
        {
            get
            {
                return mgenre;
            }
            set
            {
                mgenre = value;
            }
        }



        //PhoneID private member variable
        private Int32 mduration;
        //PhoneID public property
        public Int32 duration
        {
            get
            {
                //this line of code sends data out of the property
                return mduration;
            }
            set
            {
                //this line of code allows data into the property
                mduration = value;
            }
        }


        //PhoneID private member variable
        private Int32 mageRated;
        //PhoneID public property
        public Int32 ageRated
        {
            get
            {
                //this line of code sends data out of the property
                return mageRated;
            }
            set
            {
                //this line of code allows data into the property
                mageRated = value;
            }
        }




        //OperatingSystem private member variable
        private string mdirector;
        //OperatingSystem public property
        public string director
        {
            get
            {
                return mdirector;
            }
            set
            {
                mdirector = value;
            }
        }

        //Memory private member variable
        private string mdescription;
        //Memory public property
        public string description
        {
            get
            {
                return mdescription;
            }
            set
            {
                mdescription = value;
            }
        }



        //Price private member variable
        private Int32 mfk1_filmCast_id;
        //Price public property
        public Int32 fk1_filmCast_id
        {
            get
            {
                return mfk1_filmCast_id;
            }
            set
            {
                mfk1_filmCast_id = value;
            }
        }

        //DateAdded private member variable
        private DateTime mreleaseDate;
        //DateAdded public property
        public DateTime releaseDate
        {
            get
            {
                return mreleaseDate;
            }
            set
            {
                mreleaseDate = value;
            }
        }




        public string FilmValid(string filmName,
                                 string genre,
                                 string duration,
                                 string ageRated,
                                 string director,
                                 string description,
                                 string fk1_filmCast_id,
                                 string releaseDate)
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


            //check the min length of genre
            if (genre.Length == 0)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "genre is blank. ";
            }
            //check the max length of the genre
            if (genre.Length > 50)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "genre must be less than 50 characters. ";
            }
            //check the min length of the Price


            if (duration.Length == 0)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "duration is blank. ";
            }
            //check the max length of the duration
            if (duration.Length > 3)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "duration must be less than 3 characters. ";
            }

            //check the min length of the ageRated
            if (ageRated.Length == 0)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "ageRated is blank. ";
            }
            //check the max length of the ageRated
            if (ageRated.Length > 2)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "ageRated must be less than 3 characters. ";
            }

            //check the min length of director
            if (director.Length == 0)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "director is blank. ";
            }
            //check the max length of the Brand
            if (director.Length > 50)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "director must be less than 50 characters. ";
            }


            //check the min length of description
            if (description.Length == 0)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "description is blank. ";
            }
            //check the max length of the description
            if (description.Length > 50)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + " description must be less than 1001 characters. ";
            }



            //check the min length of fk1_filmCast_id
            if (fk1_filmCast_id.Length == 0)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "fk1_filmCast_id is blank. ";
            }
            //check the max length of the fk1_filmCast_id
            if (fk1_filmCast_id.Length > 3)
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + " fk1_filmCast_id must be less than 3 characters. ";
            }


            //test if the date is valid
            try//try the operation
            {
                //var to store the date
                DateTime Temp;
                //assign the date to the temporary var
                Temp = Convert.ToDateTime(releaseDate);
            }
            catch//if it failed report an error
            {
                //set the error messsage
                ErrorMsg = ErrorMsg + "releaseDate is not valid. ";
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
        public Boolean Find(Int32 film_id)
        {
            //initialise the DBConnection
            clsDataConnection dBConnection = new clsDataConnection();
            //add the phone no parameter
            dBConnection.AddParameter("film_id", film_id);
            //execute the query
            dBConnection.Execute("sproc_tblFilm_FilterByFilm_id");
            //if the record was found
            if (dBConnection.Count == 1)
            {
                //get the film_id
                mfilm_id = Convert.ToInt32(dBConnection.DataTable.Rows[0]["film_id"]);
                //get the filmName
                mfilmName = Convert.ToString(dBConnection.DataTable.Rows[0]["filmName"]);
                //get the genre
                mgenre = Convert.ToString(dBConnection.DataTable.Rows[0]["genre"]);
                //get the duration
                mduration = Convert.ToInt32(dBConnection.DataTable.Rows[0]["duration"]);
                //get the ageRated
                mageRated = Convert.ToInt32(dBConnection.DataTable.Rows[0]["ageRated"]);
                //get the director
                mdirector = Convert.ToString(dBConnection.DataTable.Rows[0]["director"]);
                //get the description
                mdescription = Convert.ToString(dBConnection.DataTable.Rows[0]["description"]);
                //get the fk1_filmCast_id
                mfk1_filmCast_id = Convert.ToInt32(dBConnection.DataTable.Rows[0]["fk1_filmCast_id"]);
                //get the releaseDate
                mreleaseDate = Convert.ToDateTime(dBConnection.DataTable.Rows[0]["releaseDate"]);
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
