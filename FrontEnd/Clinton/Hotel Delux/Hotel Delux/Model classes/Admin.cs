using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Hotel_Delux.Model_classes
{
    public class Admin
    {
        public int ID { get; set; }
        public string name { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public string roleType { get; set; }
    }
}