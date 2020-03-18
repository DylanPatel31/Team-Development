using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Class_Library
{
    public class clsCartItem
    {
        public clsCartItem()
        {

        }

        private Int32 mShoeNo;

        public Int32 ShoeNo
        {
            get
            {
                return mShoeNo;
            }

            set
            {
                mShoeNo = value;
            }
        }

        private Int32 mQTY;

        public Int32 QTY
        {
            get
            {
                return mQTY;
            }

            set
            {
                mQTY = value;
            }
        }
    }
}
