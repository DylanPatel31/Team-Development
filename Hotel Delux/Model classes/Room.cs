using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Hotel_Delux.Model_classes
{
    public class Room
    {
        public int roomID { get; set; }
        public string roomName { get; set; }
        public string roomType { get; set; }
        public bool roomAvailability { get; set; }
        public int roomPrice { get; set; }
        public string roomNo { get; set; }
        public string thumbnail { get; set; }

    }
}