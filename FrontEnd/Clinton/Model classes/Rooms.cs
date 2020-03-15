using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Hotel_Delux.Model_classes
{
    public class Rooms
    {
        public int roomID { get; set; }
        public string roomName { get; set; }
        public string roomType { get; set; }
        public string roomAvailability { get; set; }
        public string roomPrice { get; set; }
        public string thumbnail { get; set; }
        public string roomNo { get; set; }
    }
}