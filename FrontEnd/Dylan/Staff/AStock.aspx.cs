using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FrontEnd.Dylan.Staff
{
    public partial class AStock : System.Web.UI.Page
    {
        Int32 ShoeNo;
        protected void Page_Load(object sender, EventArgs e)
        {
            //copy the data from the query string to the variable
            ShoeNo = Convert.ToInt32(Request.QueryString["ShoeNo"]);
            if (IsPostBack != true)
            {

                //if the LaptopNo is not -1 then display the data from the record
                if (ShoeNo != -1)
                {
                    //display the existing data
                    DisplayStock(ShoeNo);
                }

            }
        }
        //this function displays the data for a staff member on the web form
        void DisplayStock(Int32 ShoeNo)
        {
            //create an instance of the laptops class
            clsStock Stock = new clsStock();
            //find the record we want to display
            Stock.Find(ShoeNo);
            //display title
            txtShoeName.Text = Stock.ShoeName;
            //display fname
            txtMainColour.Text = Stock.MainColour;
            //display lname
            txtManufacturerName.Text = Stock.ManufacturerName;
            //display dob
            txtPrice.Text = Stock.Price;
        }
        //end

        protected void btnOK_Click(object sender, EventArgs e)
        {
            //create an instance of the address page class
            clsStock ThisStock = new clsStock();
            //var to store any error message
            string ErrorMessage;
            //test the data on teh web form
            ErrorMessage = ThisStock.Valid(
                                                  txtShoeName.Text,
                                                  txtMainColour.Text,
                                                  txtManufacturerName.Text,
                                                  txtPrice.Text);


            //if there is no error message
            if (ErrorMessage == "")
            {
                //create a new instance of the address book class
                clsStockCollection Stock = new clsStockCollection();
                //do something with the data - insert or update
                //
                //if the Laptop Number is -1
                if (ShoeNo == -1)
                {
                    //copy the data from the interface to the object;
                    Stock.ThisStock.ShoeName = txtShoeName.Text;
                    Stock.ThisStock.MainColour = txtMainColour.Text;
                    Stock.ThisStock.ManufacturerName = txtManufacturerName.Text;
                    Stock.ThisStock.Price = txtPrice.Text;
                    //add the new record
                    Stock.Add();

                }
                else
                {
                    //this is an existing record
                    //copy the data from the interface to the object
                    Stock.ThisStock.ShoeName = txtShoeName.Text;
                    Stock.ThisStock.MainColour = txtMainColour.Text;
                    Stock.ThisStock.ManufacturerName = txtManufacturerName.Text;
                    Stock.ThisStock.Price = txtPrice.Text;
                    //update the existing record
                    Stock.Update();

                }
                //redircet bact to the main page
                Response.Redirect("StockManagement.aspx");
            }
            else
            {
                //display the error message 
                lblError.Text = ErrorMessage;
            }

        }
        //end
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //redircet back to the main page
            Response.Redirect("StockManagement.aspx");
        }
    }
}