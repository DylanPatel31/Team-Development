using Hotel_Delux.Model_classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Delux.admin.room
{
    public partial class AddRoom : System.Web.UI.Page
    {
        string message = "";
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
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int value = addRoom(roomNo.Value, roomPrice.Value, roomType.Value, Convert.ToInt32(roomAvailable.Value), uploadFile1, uploadFile2);
            if (value >= 1)
            {
                message = "Successfully Room added";
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',true)", true);
                Console.WriteLine(message);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('" + message + "',false)", true);
                Console.WriteLine(message);
            }
        }
        public int addRoom(string roomNo, string roomPrice, string roomType, int roomAvailable, FileUpload fileUpload, FileUpload fileUpload1)
        {
            string imgName, imgName1,imgPath,imgPath1;
            imgName = fileUpload.FileName.ToString();
            imgName1 = fileUpload1.FileName.ToString();
            string relativePathToUpload = "../../asset/images/rooms/";
            string relativePath = "/asset/images/rooms/";
            string absolute = Server.MapPath(relativePath);
            string exactPath = Path.GetFullPath(relativePath);
            imgPath = relativePath + imgName;
            imgPath1 = relativePath + imgName1;
            string imgPathForUpload = relativePathToUpload + imgName;
            string imgPathForUpload1 = relativePathToUpload + imgName1;
            if (fileUpload.PostedFile.ContentLength > 5048576) // 5120 KB means 5MB
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('File is too big',false)", true);
                fileUpload.Focus();
            }
            else
            {
                if (!File.Exists(Server.MapPath(imgPathForUpload)))
                {
                    fileUpload.SaveAs(Server.MapPath(relativePathToUpload + imgName));
                }
            }
            if (fileUpload1.PostedFile.ContentLength > 5048576) // 5120 KB means 5MB
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "popUp('File is too big',false)", true);
                fileUpload1.Focus();
            }
            else{
                if (!File.Exists(Server.MapPath(imgPathForUpload1)))
                {
                    fileUpload1.SaveAs(Server.MapPath(relativePathToUpload + imgName1));
                }      
            }
            
            int effectedRows = 0;
            int roomID = 0;
            SqlConnection conn = new SqlConnection(DbString.connectionString);
            SqlCommand cmd;
            cmd = new SqlCommand("RoomSearch", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@roomNo", roomNo));
            try
            {
                conn.Open();
                int numberOfRows = Convert.ToInt32(cmd.ExecuteScalar());
                if (numberOfRows >= 1)
                {
                    message = "Room Number already exists.";
                    effectedRows = 0;
                }
                else
                {
                    cmd = new SqlCommand("RoomAdd", conn);
                    //Instruct the command object to execute it
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@roomNo", roomNo));
                    cmd.Parameters.Add(new SqlParameter("@roomPrice", roomPrice));
                    cmd.Parameters.Add(new SqlParameter("@roomType", roomType));
                    cmd.Parameters.Add(new SqlParameter("@roomAvailable", roomAvailable));
                    roomID = Convert.ToInt32(cmd.ExecuteScalar());

                    cmd = new SqlCommand("RoomImagesAdd", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@roomID", roomID));
                    cmd.Parameters.Add(new SqlParameter("@imgName", imgName));
                    cmd.Parameters.Add(new SqlParameter("@imgPath", imgPath));
                    cmd.Parameters.Add(new SqlParameter("@imgName1", imgName1));
                    cmd.Parameters.Add(new SqlParameter("@imgPath1", imgPath1));
                    effectedRows= Convert.ToInt32(cmd.ExecuteNonQuery());
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                message = ex.Message;
                Console.WriteLine(ex.Message);
            }

            return effectedRows;
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            roomNo.Value = "";
            roomPrice.Value = "";
            roomType.Value = "";
        }
        protected void logout_ServerClick(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("/admin/Index.aspx");
        }   
    }
}