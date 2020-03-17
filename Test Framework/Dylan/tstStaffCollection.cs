using System;
using Class_Library;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;

namespace Test_Framework.Dylan
{
    [TestClass]
    public class tstStaffCollection
    {
        [TestMethod]
        public void InstanceOK()
        {
            //create an instance of our class clsStaff
            clsStaffCollection AllStaff = new clsStaffCollection();
            //check to see that the class in not null
            Assert.IsNotNull(AllStaff);
        }

        [TestMethod]

        public void StaffListOK()
        {
            //create an instance of the class we want to create 
            clsStaffCollection AllStaff = new clsStaffCollection();
            //create some test data to assign to the property 
            //in this case the data needs to be a list of objects 
            List<clsStaff> TestList = new List<clsStaff>();
            //add an item to the list 
            //create the item of the test
            clsStaff TestItem = new clsStaff();
            //set its properties 
            TestItem.Title = "Mr";
            TestItem.FirstName = "John";
            TestItem.LastName = "Taylor";
            TestItem.DateofBirth = DateTime.Now.Date.AddYears(-16);
            TestItem.Address1 = "18 Some Street";
            TestItem.Address2 = "36 Some Street";
            TestItem.City = "Leicester";
            TestItem.PostCode = "LE2 9AK";
            //add the item to the test list
            TestList.Add(TestItem);
            //assign the data to the property 
            //AllStaff.StaffList = TestList;
            //test to see that the two values are the same
            Assert.AreEqual(AllStaff.StaffList, TestList);

        }

        [TestMethod]
        public void ThisStaffPropertyOK()
        {
            //create an instance of the class we want to create 
            clsStaffCollection AllStaff = new clsStaffCollection();
            //create some test data to assign to the property 
            clsStaff TestStaff = new clsStaff();
            //set its properties 
            TestStaff.Title = "Mr";
            TestStaff.FirstName = "John";
            TestStaff.LastName = "Taylor";
            TestStaff.DateofBirth = DateTime.Now.Date.AddYears(-16);
            TestStaff.Address1 = "18 Some Street";
            TestStaff.Address2 = "36 Some Street";
            TestStaff.City = "Leicester";
            TestStaff.PostCode = "LE2 9AK";
            //assign the data to the property
            AllStaff.ThisStaff = TestStaff;
            //test to see that the two values are the same
            Assert.AreEqual(AllStaff.ThisStaff, TestStaff);


        }

        [TestMethod]
        public void ListAndCountOK()
        {
            //create an instance of the class we want to create 
            clsStaffCollection AllStaff = new clsStaffCollection();
            //create some test data to assign to the property 
            //in this case the data needs to be a list of objects 
            List<clsStaff> TestList = new List<clsStaff>();
            //add an item to the list 
            //create the item of the test
            clsStaff TestItem = new clsStaff();
            //set its properties 
            TestItem.Title = "Mr";
            TestItem.FirstName = "John";
            TestItem.LastName = "Taylor";
            TestItem.DateofBirth = DateTime.Now.Date.AddYears(-16);
            TestItem.Address1 = "18 Some Street";
            TestItem.Address2 = "36 Some Street";
            TestItem.City = "Leicester";
            TestItem.PostCode = "LE2 9AK";
            //add the item to the test list
            TestList.Add(TestItem);
            //assign the data to the property 
            //AllStaff.StaffList = TestList;
            //test to see that the two values are the same
            Assert.AreEqual(AllStaff.Count, TestList.Count);
        }

        [TestMethod]

        public void AddMethodOK()
        {
            //create an instance of the class we want to create 
            clsStaffCollection AllStaff = new clsStaffCollection();
            //create the item of test data
            clsStaff TestItem = new clsStaff();
            //var to store the priamry key
            Int32 PrimaryKey = 0;
            //set its properties 
            TestItem.StaffNo = 1;
            TestItem.Title = "Mr";
            TestItem.FirstName = "John";
            TestItem.LastName = "Taylor";
            TestItem.DateofBirth = DateTime.Now.Date.AddYears(-16);
            TestItem.Address1 = "18 Some Street";
            TestItem.Address2 = "36 Some Street";
            TestItem.City = "Leicester";
            TestItem.PostCode = "LE2 9AK";
            //assign the data to the property
            AllStaff.ThisStaff = TestItem;
            //add the record
            // PrimaryKey = AllStaff.Add();
            //set the primary key of the tst data
            TestItem.StaffNo = PrimaryKey;
            //find the record
            AllStaff.ThisStaff.Find(PrimaryKey);
            //test to see that the two values are the same
            Assert.AreEqual(AllStaff.ThisStaff, TestItem);
        }

    }
}
