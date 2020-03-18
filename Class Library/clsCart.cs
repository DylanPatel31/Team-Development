using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Class_Library
{
    public class clsCart
    {
        List<clsCartItem> mShoes = new List<clsCartItem>();

        public clsCart()
        {

        }

        private Int32 mUserNo;
        
        public Int32 UserNo
        {
            get
            {
                return mUserNo;
            }
            set
            {
                mUserNo = value;
            }
        }

        private string mCardNo;

        public string CardNo
        {
            get
            {
                return mCardNo;
           
            }
            set
            {
                mCardNo = value;
            }
        }

        public List<clsCartItem>Shoes
        {
            get
            {
                return mShoes;
            }
        }

        public void Checkout()
        {
            clsOrder Order = new clsOrder();
            Order.ProcessCart(this);
        }

    }
}
