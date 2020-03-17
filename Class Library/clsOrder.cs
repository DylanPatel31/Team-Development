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
        public int CustomerNo
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

       /* public bool Find(int orderNo)
        {
            
        }*/
    }
}
