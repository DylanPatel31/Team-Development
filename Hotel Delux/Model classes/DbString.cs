using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Hotel_Delux.Model_classes
{
    public class DbString
    {
        public static string connectionString = ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString;
    }
}