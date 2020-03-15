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
using System.IO;

namespace Hotel_Delux.admin.room
{
    public partial class EditRoom : System.Web.UI.Page
    {
        public SqlConnection conn = new SqlConnection(DbString.connectionString);
        string message;
        static List<RoomImages> imageList;
        static int roomID;
        int effectedRows;
         static string relativePathToUpload = "../../asset/images/rooms/";
         static string relativePath = "/asset/images/rooms/";
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
                else
                {
                    loadData();
                }
               

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
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int value = updateRoom(roomNo.Value, roomPrice.Value, roomType.Value, roomAvailable.Value, uploadFile1, uploadFile2);
            if (value >= 1)
            {
                message = "Successfully Room updated";
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',true)", true);
                Console.WriteLine(message);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',false)", true);
                Console.WriteLine(message);
            }
            //Response.Redirect("Index.aspx");
        }
        public int updateRoom(string roomNo, string roomPrice, string roomType, string roomAvailable, FileUpload fileUpload1, FileUpload fileUpload2)
        {
            try
            {
                conn.Open();
                SqlCommand cmd;
                cmd = new SqlCommand("RoomUpdate", conn);
                string thumbnail = "";

                string imgName = fileUpload1.FileName.ToString();
            //string imgPath = "ImageStorage/" + imgName;
            //fileUpload.SaveAs(Server.MapPath(imgPath));
            //get the size in bytes that

            int imgSize = fileUpload1.PostedFile.ContentLength;

            //validates the posted file before saving

          




            if (fileUpload2.PostedFile != null && fileUpload2.PostedFile.FileName != "")

            {
                if (fileUpload2.PostedFile.ContentLength > 5048576) // 5120 KB means 5MB
                {
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('File is too big',false)", true);
                }
                else

                {
                    imgName = fileUpload2.FileName.ToString();
                    string filePath = Server.MapPath(relativePathToUpload + imgName);
                        //save the file
                        if (!File.Exists(filePath))
                        {
                            fileUpload2.SaveAs(Server.MapPath(relativePathToUpload + imgName));
                        }
                       
                        updateImage(relativePath + imgName, imgName, imageList[1].imgName);
                  

                }

            }



                if (fileUpload1.PostedFile != null && fileUpload1.PostedFile.FileName != "")

                {
                    if (fileUpload1.PostedFile.ContentLength > 5048576) // 5120 KB means 5MB
                    {
                        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('File is too big',false)", true);
                    }
                    else

                    {
                        string filePath = Server.MapPath(relativePathToUpload + imgName);
                        //save the file
                        if (!File.Exists(filePath))
                        {
                            fileUpload1.SaveAs(Server.MapPath(relativePathToUpload + imgName));
                        }

                        thumbnail = relativePath + imgName;
                        updateImage(relativePath + imgName, imgName, imageList[0].imgName);
                        Response.Write("Save Successfully!");

                    }

                }

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@roomID", roomID));
            cmd.Parameters.Add(new SqlParameter("@roomNo", roomNo));
            cmd.Parameters.Add(new SqlParameter("@roomPrice", roomPrice));
            cmd.Parameters.Add(new SqlParameter("@roomType", roomType));
            cmd.Parameters.Add(new SqlParameter("@roomAvailable", roomAvailable));
                cmd.Parameters.Add(new SqlParameter("@thumbnail", thumbnail));

                effectedRows = Convert.ToInt32(cmd.ExecuteNonQuery());
            }
            catch (Exception ex)
            {
                message = ex.Message;
                Console.WriteLine(ex.Message);
            }
            conn.Close();
            return effectedRows;
        }
        public int updateImage(string imgPath,string imgName,string imgNamePrevious)
        {
            SqlCommand cmd;
            cmd = new SqlCommand("RoomImagesUpdate", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@imgPath", imgPath));
            cmd.Parameters.Add(new SqlParameter("@imgName", imgName));
            cmd.Parameters.Add(new SqlParameter("@imgNamePrevious", imgNamePrevious));
            cmd.Parameters.Add(new SqlParameter("@roomID", roomID));
            return Convert.ToInt32(cmd.ExecuteNonQuery());
        }

        public void loadData()
        {
            imageList = new List<RoomImages>();
            imageList.DefaultIfEmpty();
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
                    roomAvailable.Value = dataReader["RoomAvailability"].ToString();
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
                    roomImages.imgID = Convert.ToInt32(dataReader["imgID"].ToString());
                    roomImages.imgName = dataReader["imgName"].ToString();
                    roomImages.imgPath = dataReader["imgPath"].ToString();
                    roomImages.roomID = Convert.ToInt32(dataReader["roomID"].ToString());
                    imageList.Add(roomImages);
                }
                img1Link.HRef = imageList[0].imgPath;
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