using System;
using Class_Library;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Test_Framework.Dylan
{
    [TestClass]
    public class tstStaff
    {
        //good test data
        //create some test data to pass to the method
        string Title = "Mr";
        string FirstName = "John";
        string LastName = "Taylor";
        string DateOfBirth = DateTime.Now.Date.AddYears(-16).ToString();
        string Address1 = "18 Some Street";
        string Address2 = "36 Some Street";
        string City = "Leicester";
        string PostCode = "LE2 9AK";

        [TestMethod]
        public void InstanceOK()
        {

            //create an instance of our class clsStaff
            clsStaff AStaff = new clsStaff();
            //check to see that the class in not null
            Assert.IsNotNull(AStaff);
        }

        [TestMethod]
        public void Address1PropertyOK()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //create some test data to assign to the property
            string TestData = "18 Some Street";
            //assign the data to the property
            AStaff.Address1 = TestData;
            //test to see that the two values are the same
            Assert.AreEqual(AStaff.Address1, TestData);
        }

        [TestMethod]
        public void Address2PropertyOK()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //create some test data to assign to the property
            string TestData = "36 Some Street";
            //assign the data to the property
            AStaff.Address2 = TestData;
            //test to see that the two values are the same
            Assert.AreEqual(AStaff.Address2, TestData);
        }

        [TestMethod]
        public void CityPropertyOK()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //create some test data to assign to the property
            string TestData = "Leicester";
            //assign the data to the property
            AStaff.City = TestData;
            //test to see that the two values are the same
            Assert.AreEqual(AStaff.City, TestData);
        }

        [TestMethod]
        public void DateOfBirthPropertyOK()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //create some test data to assign to the property
            DateTime TestData = DateTime.Now.Date;
            //assign the data to the property
            AStaff.DateofBirth = TestData;
            //test to see that the two values are the same
            Assert.AreEqual(AStaff.DateofBirth, TestData);
        }

        [TestMethod]
        public void FirstNamePropertyOK()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //create some test data to assign to the property
            string TestData = "John";
            //assign the data to the property
            AStaff.FirstName = TestData;
            //test to see that the two values are the same
            Assert.AreEqual(AStaff.FirstName, TestData);
        }

        [TestMethod]
        public void LastNamePropertyOK()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //create some test data to assign to the property
            string TestData = "Taylor";
            //assign the data to the property
            AStaff.LastName = TestData;
            //test to see that the two values are the same
            Assert.AreEqual(AStaff.LastName, TestData);
        }

        [TestMethod]
        public void PostCodePropertyOK()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //create some test data to assign to the property
            string TestData = "LE2 9AK";
            //assign the data to the property
            AStaff.PostCode = TestData;
            //test to see that the two values are the same
            Assert.AreEqual(AStaff.PostCode, TestData);
        }

        [TestMethod]
        public void StaffNoPropertyOK()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //create some test data to assign to the property
            Int32 TestData = 1;
            //assign the data to the property
            AStaff.StaffNo = TestData;
            //test to see that the two values are the same
            Assert.AreEqual(AStaff.StaffNo, TestData);
        }

        [TestMethod]
        public void TitlePropertyOK()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //create some test data to assign to the property
            string TestData = "Mr";
            //assign the data to the property
            AStaff.Title = TestData;
            //test to see that the two values are the same
            Assert.AreEqual(AStaff.Title, TestData);
        }

        [TestMethod]
        public void FindMethodOK()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //boolean variable to store the result of the validation
            Boolean Found = false;
            //create some test data to use with the method 
            Int32 StaffNo = 1;
            //invoke the method
            Found = AStaff.Find(StaffNo);
            //test to see that the result is correct
            Assert.IsTrue(Found);
        }

        [TestMethod]
        public void TestStaffNoFound()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //boolean variable to store the result of the validation
            Boolean Found = false;
            //boolean variable to record if data is OK (assume it is)
            Boolean OK = true;
            //create test data to use with the method
            Int32 StaffNo = 1;
            //incoke the method
            Found = AStaff.Find(StaffNo);
            //check the Staff no
            if (AStaff.StaffNo != 1)
            {
                OK = false;
            }
            //test to see that the result is correct 
            Assert.IsTrue(OK);
        }

        [TestMethod]
        public void TestTitleFound()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //boolean variable to store the result of the validation
            Boolean Found = false;
            //boolean variable to record if data is OK (assume it is)
            Boolean OK = true;
            //create test data to use with the method
            Int32 StaffNo = 1;
            //incoke the method
            Found = AStaff.Find(StaffNo);
            //check the title
            if (AStaff.Title != "Mr")
            {
                OK = false;
            }
            //test to see that the result is correct 
            Assert.IsTrue(OK);
        }


        [TestMethod]
        public void TestFirstNameFound()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //boolean variable to store the result of the validation
            Boolean Found = false;
            //boolean variable to record if data is OK (assume it is)
            Boolean OK = true;
            //create test data to use with the method
            Int32 StaffNo = 1;
            //incoke the method
            Found = AStaff.Find(StaffNo);
            //check the title
            if (AStaff.FirstName != "John")
            {
                OK = false;
            }
            //test to see that the result is correct 
            Assert.IsTrue(OK);
        }

        [TestMethod]
        public void TestLastNameFound()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //boolean variable to store the result of the validation
            Boolean Found = false;
            //boolean variable to record if data is OK (assume it is)
            Boolean OK = true;
            //create test data to use with the method
            Int32 StaffNo = 1;
            //incoke the method
            Found = AStaff.Find(StaffNo);
            //check the title
            if (AStaff.LastName != "Taylor")
            {
                OK = false;
            }
            //test to see that the result is correct 
            Assert.IsTrue(OK);
        }

        [TestMethod]
        public void TestDateOfBirthFound()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //boolean variable to store the result of the validation
            Boolean Found = false;
            //boolean variable to record if data is OK (assume it is)
            Boolean OK = true;
            //create test data to use with the method
            Int32 StaffNo = 1;
            //incoke the method
            Found = AStaff.Find(StaffNo);
            //check the title
            if (AStaff.DateofBirth != Convert.ToDateTime("01/01/1998"))
            {
                OK = false;
            }
            //test to see that the result is correct 
            Assert.IsTrue(OK);
        }

        [TestMethod]
        public void TestAddress1Found()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //boolean variable to store the result of the validation
            Boolean Found = false;
            //boolean variable to record if data is OK (assume it is)
            Boolean OK = true;
            //create test data to use with the method
            Int32 StaffNo = 1;
            //incoke the method
            Found = AStaff.Find(StaffNo);
            //check the title
            if (AStaff.Address1 != "18 Some Street")
            {
                OK = false;
            }
            //test to see that the result is correct 
            Assert.IsTrue(OK);
        }

        [TestMethod]
        public void TestAddress2Found()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //boolean variable to store the result of the validation
            Boolean Found = false;
            //boolean variable to record if data is OK (assume it is)
            Boolean OK = true;
            //create test data to use with the method
            Int32 StaffNo = 1;
            //incoke the method
            Found = AStaff.Find(StaffNo);
            //check the title
            if (AStaff.Address2 != "36 Some Street")
            {
                OK = false;
            }
            //test to see that the result is correct 
            Assert.IsTrue(OK);
        }

        [TestMethod]
        public void TestCityFound()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //boolean variable to store the result of the validation
            Boolean Found = false;
            //boolean variable to record if data is OK (assume it is)
            Boolean OK = true;
            //create test data to use with the method
            Int32 StaffNo = 1;
            //incoke the method
            Found = AStaff.Find(StaffNo);
            //check the title
            if (AStaff.City != "Leicester")
            {
                OK = false;
            }
            //test to see that the result is correct 
            Assert.IsTrue(OK);
        }

        [TestMethod]
        public void TestPostCodeFound()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //boolean variable to store the result of the validation
            Boolean Found = false;
            //boolean variable to record if data is OK (assume it is)
            Boolean OK = true;
            //create test data to use with the method
            Int32 StaffNo = 1;
            //incoke the method
            Found = AStaff.Find(StaffNo);
            //check the title
            if (AStaff.PostCode != "LE2 9AK")
            {
                OK = false;
            }
            //test to see that the result is correct 
            Assert.IsTrue(OK);
        }

        [TestMethod]
        public void ValidMethodOK()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store ant error message
            String Error = "";
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see that the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void TitleMinLessOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            string Error = "";
            //create some test data to pass to the method
            string Title = ""; //this should trigger an error
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void TitleMin()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //boolean variable to store the result of the validation
            String Error = "";
            //create some test data to pass to the method
            string Title = "M"; //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void TitleMinPlusOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            string Error = "";
            //create some test data to pass to the method
            string Title = "Mr"; //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void TitleMaxLessOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            string Error = "";
            //create some test data to pass to the method
            string Title = "Mrs"; //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void TitleMaxOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            string Error = "";
            //create some test data to pass to the method
            string Title = "Miss"; //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void TitleMaxPlusOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            string Error = "";
            //create some test data to pass to the method
            string Title = "Misss"; //this should trigger an error
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void TitleMid()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            string Error = "";
            //create some test data to pass to the method
            string Title = "Ms"; //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void TitleExtremeMax()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            string Error = "";
            //create some test data to pass to the method
            string Title = "";
            Title = Title.PadRight(100, 'm');//this should trigger an error
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void FirstNameMinLessOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            string Error = "";
            //create some test data to pass to the method
            string FirstName = ""; //this should trigger an error
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void FirstNameMin()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            string Error = "";
            //create some test data to pass to the method
            string FirstName = "A"; //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void FirstNameMinPlusOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            string Error = "";
            //create some test data to pass to the method
            string FirstName = "An"; //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void FirstNameMaxLessOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            string Error = "";
            //create some test data to pass to the method
            string FirstName = "";
            FirstName = FirstName.PadRight(49, 'a'); //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void FirstNameMax()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            string Error = "";
            //create some test data to pass to the method
            string FirstName = "";
            FirstName = FirstName.PadRight(40, 'a'); //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void FirstNameMaxPlusOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            string Error = "";
            //create some test data to pass to the method
            string FirstName = "";
            FirstName = FirstName.PadRight(51, 'a'); //this should trigger an error
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void FirstNameMid()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            string Error = "";
            //create some test data to pass to the method
            string FirstName = "";
            FirstName = FirstName.PadRight(25, 'a'); //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void FirstNameExtremeMax()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            string Error = "";
            //create some test data to pass to the method
            string FirstName = "";
            FirstName = FirstName.PadRight(500, 'a'); //this should trigger an error
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void LastNameMinLessOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String LastName = ""; //this should trigger an error
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void LastNameMin()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String LastName = "B"; //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void LastNameMinPlusOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String LastName = "Be"; //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void LastNameMaxLessOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String LastName = "";
            LastName = LastName.PadRight(49, 'a'); //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void LastNameMax()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String LastName = "";
            LastName = LastName.PadRight(50, 'a'); //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void LastNameMaxPlusOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String LastName = "";
            LastName = LastName.PadRight(51, 'a'); //this should trigger an error
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void LastNameMid()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String LastName = "";
            LastName = LastName.PadRight(25, 'a'); //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void LastNameExtremeMax()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String LastName = "";
            LastName = LastName.PadRight(500, 'a'); //this should trigger an error
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void DateOfBirthExtremeMin()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message

            //string ErrMsg;
            //create a variable to store the test date data
            String Error = "";
            String TestDate;
            //set the data to today minus - 16 years date
            TestDate = DateTime.Now.Date.AddYears(1000).ToString();
            //change the date to whatever the date is less 1000 years
            //TestDate = TestDate.AddYears(-1000);
            //convert the date  variable to a string variable 
            string DateOfBirth = TestDate.ToString();
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, TestDate, Address1, Address2, City, PostCode);
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void DateOfBirthMinLessOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create a variable to store the test date data
            String TestDate;
            //set the data to todays date
            TestDate = DateTime.Now.Date.AddYears(-16).AddDays(1).ToString();
            //convert the date  variable to a string variable 
            string DateOfBirth = TestDate.ToString();
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, TestDate, Address1, Address2, City, PostCode);
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void DateOfBirthMin()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create a variable to store the test date data
            String TestDate;
            //set the data to todays date
            TestDate = DateTime.Now.Date.AddYears(-16).ToString();
            //convert the date  variable to a string variable 
            string DateOfBirth = TestDate.ToString();
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, TestDate, Address1, Address2, City, PostCode);
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void DateOfBirthMinPlusOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create a variable to store the test date data
            String TestDate;
            //set the data to todays date
            TestDate = DateTime.Now.Date.AddYears(-16).AddDays(-1).ToString();
            //convert the date  variable to a string variable 
            string DateOfBirth = TestDate.ToString();
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, TestDate, Address1, Address2, City, PostCode);
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void DateOfBirthMaxLessOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create a variable to store the test date data
            String TestDate;
            //set the data to todays date
            TestDate = DateTime.Now.Date.AddYears(-100).AddDays(1).ToString();
            //convert the date  variable to a string variable 
            string DateOfBirth = TestDate.ToString();
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, TestDate, Address1, Address2, City, PostCode);
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void DateOfBirthMax()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create a variable to store the test date data
            String TestDate;
            //set the data to todays date
            TestDate = DateTime.Now.Date.AddYears(-100).ToString();
            //convert the date  variable to a string variable 
            string DateOfBirth = TestDate.ToString();
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, TestDate, Address1, Address2, City, PostCode);
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void DateOfBirthMaxPlusOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create a variable to store the test date data
            String TestDate;
            //set the data to todays date
            TestDate = DateTime.Now.Date.AddYears(-100).AddDays(-1).ToString();
            //convert the date  variable to a string variable 
            string DateOfBirth = TestDate.ToString();
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, TestDate, Address1, Address2, City, PostCode);
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void DateOfBirthMid()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create a variable to store the test date data
            String TestDate;
            //set the data to todays date
            TestDate = DateTime.Now.Date.AddYears(-58).ToString();
            //convert the date  variable to a string variable 
            string DateOfBirth = TestDate.ToString();
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, TestDate, Address1, Address2, City, PostCode);
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void DateOfBirthExtremeMax()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create a variable to store the test date data
            String TestDate;
            //set the data to todays date
            TestDate = DateTime.Now.Date.AddYears(-1000).ToString();
            //convert the date  variable to a string variable 
            //string DateOfBirth = TestDate.ToString();
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, TestDate, Address1, Address2, City, PostCode);
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]

        public void DateOfBirthInvalidData()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            String TestDate;
            //set the DateOfBirth to a non data value
            TestDate = "this is not a date";
            //invoke the mehtod
            Error = AStaff.Valid(Title, FirstName, LastName, TestDate, Address1, Address2, City, PostCode);
            //test to see if the result is correct
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void Address1MinLessOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String Address1 = ""; //this should trigger an error
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void Address1Min()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String Address1 = "1"; //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void Address1MinPlusOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String Address1 = "12"; //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void Address1MaxLessOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String Address1 = "";
            Address1 = Address1.PadRight(49, '3'); //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void Address1Max()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String Address1 = "";
            Address1 = Address1.PadRight(50, '3'); //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void Address1MaxPlusOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String Address1 = "";
            Address1 = Address1.PadRight(51, '3'); //this should trigger an error
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void Address1Mid()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String Address1 = "";
            Address1 = Address1.PadRight(25, '3'); //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void Address1ExtremeMax()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            string Address1 = "";
            Address1 = Address1.PadRight(500, '3'); //this should trigger an error
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void Address2MinLessOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String Address2 = ""; //this should trigger an error
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void Address2Min()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String Address2 = "a"; //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void Address2MinPlusOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String Address2 = "aa"; //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void Address2MaxLessOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String Address2 = "";
            Address2 = Address2.PadRight(49, 'a'); //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void Address2Max()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String Address2 = "";
            Address2 = Address2.PadRight(50, 'a'); //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void Address2MaxPlusOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String Address2 = "";
            Address2 = Address2.PadRight(51, 'a'); //this should trigger an error
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void Address2Mid()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String Address2 = "";
            Address2 = Address2.PadRight(25, 'a'); //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void Address2ExtremeMax()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            string Address2 = "";
            Address2 = Address2.PadRight(500, 'a'); //this should trigger an error
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void CityMinLessOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String City = ""; //this should trigger an error
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void CityMin()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String City = "a"; //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void CityMinPlusOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String City = "aa"; //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void CityMaxLessOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String City = "";
            City = City.PadRight(49, 'a'); //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void CityMax()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String City = "";
            City = City.PadRight(50, 'a'); //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void CityMaxPlusOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String City = "";
            City = City.PadRight(51, 'a'); //this should trigger an error
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void CityMid()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String City = "";
            City = City.PadRight(25, 'a'); //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void CityExtremeMax()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            string City = "";
            City = City.PadRight(500, 'a'); //this should trigger an error
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void PostCodeLessOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String PostCode = ""; //this should trigger an error
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void PostCodeMin()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String PostCode = "a"; //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void PostCodeMinPlusOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String PostCode = "aa"; //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void PostCodeMaxLessOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String PostCode = "aaaaaa"; //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void PostCodeMax()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String PostCode = "aaaaaaa"; //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void PostCodeMaxPlusOne()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String PostCode = "aaaaaaaa"; //this should trigger an error
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreNotEqual(Error, "");
        }

        [TestMethod]
        public void PostCodeMid()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            String PostCode = "aaa"; //this should be ok
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreEqual(Error, "");
        }

        [TestMethod]
        public void PostCodeExtremeMax()
        {
            //create an instance of the class we want to create
            clsStaff AStaff = new clsStaff();
            //string variable to store any error message
            String Error = "";
            //create some test data to pass to the method
            string PostCode = "";
            PostCode = PostCode.PadRight(500, 'a'); //this should trigger an error
            //invoke the method
            Error = AStaff.Valid(Title, FirstName, LastName, DateOfBirth, Address1, Address2, City, PostCode);
            //test to see thta the result is correct
            Assert.AreNotEqual(Error, "");
        }
    }
}
