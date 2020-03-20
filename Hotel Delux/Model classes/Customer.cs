using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Hotel_Delux.Model_classes
{
    public class Customer
    {
        public int ID { get; set; }
        public string name { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public string address { get; set; }
        public string mobile { get; set; }
        public string state { get; set; }
        public string email { get; set; }
        public string roleType { get; set; }
    }
}