using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Hotel_Delux.Model_classes;
using System.Collections;
using System.Data;
using System.Data.SqlClient;

namespace Hotel_Delux.admin.room
{
    public partial class ViewRoom : System.Web.UI.Page
    {
        
        SqlConnection conn = new SqlConnection(DbString.connectionString);
        string message = "";
        ArrayList roomImagesList = new ArrayList();
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["username"] == null || Session["roleType"] == null || checkRoletype(Session["roleType"].ToString(), "admin"))
            {
                Response.Redirect("/admin/Index.aspx", false);
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null || Session["roleType"] == null || checkRoletype(Session["roleType"].ToString(), "admin"))
                {
                    Response.Redirect("/admin/Index.aspx", false);
                }
                loadData();
            }
            
        }
        public bool checkRoletype(string session, string compareString)
        {
            if (string.Compare(session, compareString) != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        protected void logout_ServerClick(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("/admin/Index.aspx");
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
        public void loadData()
        {
            List<RoomImages> imageList = new List<RoomImages>();
            int roomID = 0;
            SqlCommand cmd = new SqlCommand("RoomSearch", conn);
            //Instruct the command object to execute it
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@roomNo", Session["roomNo"].ToString()));
            SqlDataReader dataReader = null;
            try
            {
                conn.Open();
                dataReader = cmd.ExecuteReader();
                while (dataReader.Read())
                {
                    roomID = Convert.ToInt32(dataReader["RoomID"].ToString());
                    roomNo.Value = dataReader["RoomNo"].ToString();
                    roomType.Value = dataReader["RoomType"].ToString();
                    roomAvailable.Value = dataReader["RoomAvailability"].ToString(); ;
                    //dataReader["RoomAvailability"].ToString();
                    roomPrice.Value = dataReader["RoomPrice"].ToString();
                }
                dataReader.Close();
                cmd = new SqlCommand("RoomImageSearch", conn);
                //Instruct the command object to execute it
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@roomID", roomID));
                dataReader = cmd.ExecuteReader();
                while (dataReader.Read())
                {
                    RoomImages roomImages = new RoomImages();
                    roomImages.imgID= Convert.ToInt32(dataReader["imgID"].ToString());
                    roomImages.imgName = dataReader["imgName"].ToString();
                    roomImages.imgPath = dataReader["imgPath"].ToString();
                    roomImages.roomID = Convert.ToInt32(dataReader["roomID"].ToString());
                    imageList.Add(roomImages);
                }
                img1Link.HRef= imageList[0].imgPath;
                img2Link.HRef = imageList[1].imgPath;
                img1.Src = imageList[0].imgPath;
                img2.Src = imageList[1].imgPath;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            dataReader.Close();
            conn.Close();
        }
    }
}