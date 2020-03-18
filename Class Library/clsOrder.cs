using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Class_Library
{
    public class clsOrder
    {
        //private data member for the CustoemrNo property
        private Int32 mUserNo;
        //private data member for the Delivery Date property
        private DateTime mDeliveryDate;
        ////private data member for the order Date property
        private DateTime mOrderDate;
        //private data member for the order No property
        private Int32 mOrderNo;
        //private data member for the card property
        private string mCardNo;


        public clsOrder()
        {

        }
        public int UserNo
        {
            get
            {
                //return the private data
                return mUserNo;
            }
            set
            {
                //set the private data
                mUserNo = value;
            }
        }
        public DateTime DeliveryDate
        {
            get
            {
                //return the data
                return mDeliveryDate;
            }
            set
            {
                //set the data
                mDeliveryDate = value;
            }
        }
        public DateTime OrderDate
        {
            get
            {
                //return the data
                return mOrderDate;
            }
            set
            {
                //set the data
                mOrderDate = value;
            }
        }
        public int OrderNo
        {
            get
            {
                //return the data
                return mOrderNo;
            }
            set
            {
                //set the data
                mOrderNo = value;
            }
        }
       
        public string CardNo
        {
            get
            {
                //return the data
                return mCardNo;
            }
            set
            {
                //set the data
                mCardNo = value;
            }
        }

        //public bool Find(int orderNo)
        //{

        //}

        public void ProcessCart(clsCart ShoppingCart)
        {
            ///at this point all the data has been captured by the presentation layer
            ///this is the stage where all of the data is passed to the data layer via the two stored procedures like so
            ///

            //first we add the order to the database using data from the cart's private data member s
            //connect to the database
            clsDataConnection DB = new clsDataConnection();
            //pass the data as parameters to the data layer  
            DB.AddParameter("@fk1_UserNo", ShoppingCart.UserNo);
            DB.AddParameter("@OrderDate", DateTime.Now.Date);
            DB.AddParameter("@CardNo", ShoppingCart.CardNo);
            //execute the stored procedure capturing the primary key of the new record in the variable OrderNo
            Int32 NewOrderNo;
            NewOrderNo = DB.Execute("sproc_tblOrder_Insert");

            //now we need to loop through all the products adding them to the order line table
            Int32 Index = 0;
            Int32 Count = ShoppingCart.Shoes.Count;
            while (Index < Count)
            {
                //reset the connection to the database
                DB = new clsDataConnection();
                DB.AddParameter("@fk1_OrderNo", NewOrderNo);
                DB.AddParameter("@fk2_ShoeNo", ShoppingCart.Shoes[Index].ShoeNo);
                DB.AddParameter("@QTY", ShoppingCart.Shoes[Index].QTY);
                Int32 OrderNo = DB.Execute("sproc_tblOrderLine_Insert");
                Index++;
            }
        }
}
