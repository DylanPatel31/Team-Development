using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Hotel_Delux.Model_classes
{
    public class Booking
    {
        public int bookingID { get; set; }
        public int customerID { get; set; }
        public int roomID { get; set; }
        public int staffID { get; set; }
        public string bookingDate { get; set; }
        public string inDate { get; set; }
        public string outDate { get; set; }
        public int noOfPerson { get; set; }
        public string cancelStatus { get; set; }
    }
}