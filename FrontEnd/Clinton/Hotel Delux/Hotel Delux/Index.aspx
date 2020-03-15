<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Hotel_Delux.Index1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link href="/asset/css/bootstrap.min.css" rel="stylesheet" />
    <script src="/asset/js/jquery-3.4.1.min.js"></script>
    <script src="/asset/js/bootstrap.min.js"></script>
    <link href="/asset/css/stylesheet.css" rel="stylesheet" />
    <script src="/asset/js/main.js"></script>
    <title>Index</title>
</head>
<body class="indexPageBody">
    <form id="form1" runat="server">
        <div class="container-fluid indexPage">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="form-div">
                    <h2 class="page-title-form">Welcome to Hotel Deluxe</h2>
                    <div class="form-group text-center">
                        <asp:Button ID="btnLogin" CssClass="btn btn-lg btn-info" OnClick="btnLogin_Click" runat="server" Text="Login" />
                    </div>                            
              </div>
            </div>
            </div>

    </div>
        <div class="container">
                        <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="main-div">
                    <h2>
                        Welcome To Our Hotel
                    </h2>
                        <p align="center">
                            <span>Our hotel established a new trend on the UK market, that are known as city lifestyle (design and boutique) hotels. Our four-star hotel with its 15 rooms offering comfort and relaxation reflects the very popular, modern yet elegant style of international boutique hotels.<o:p></o:p></span></p>
                        <p align="center">
                            <span>Each of our rooms with their simple, fresh and warm style, and welcoming colours meet current city design and comfort standards. With the exception of our 15 rooms , every room has a queen-size double bed. The deluxe interiors of our rooms are completed by LCD television, high-speed internet connection, mini bar and a modern bathroom.<o:p></o:p></span></p>
                    <p>
                        &nbsp;</p>
                        </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-lg-4 col-sm-12">
                    <div class="indexRoomDesign">
                        <a id="img1Link" name="img1Link">
                            <div class="offer">From <span class="pound-currency">£185</span></div>
                            <img id="img1" src="/asset/images/rooms/kingsize-bed1.jpg" class="imgRooms" />
                            <div class="package">Luxury Bed En Suite</div>
                            <div class="description"><span>Our room provides views over landscaped gardens. It has a seating area, ample storage, digital safe, minibar and luxurious duck down bedding</span></div>
                            <div class="form-group text-center">
                                <asp:Button ID="btnRoom" CssClass="btn btn-md btn-info" OnClick="btnRoom_Click" runat="server" Text="More Info" />
                            </div> 
                        </a>
                        </div>
                    </div>
                <div class="col-md-4 col-lg-4 col-sm-12">
                    <div class="indexRoomDesign">
                        <a id="img1Link1" name="img1Link">
                            <div class="offer">From <span class="pound-currency">£125</span></div>
                            <img id="img1" src="/asset/images/rooms/RB_2053.jpg" class="imgRooms" />
                            <div class="package">King Size Sleigh Bed</div>
                            <div class="description">
                                <p align="center">
                                    <span>Our Deluxe king size room has a seating area, ample storage, digital safe, minibar and luxurious duck down bedding. This room can also be configured with an extra roll-away bed for families of 3.<o:p></o:p></span></p>
                        </div>
                            <div class="form-group text-center">
                                <asp:Button ID="Button1" CssClass="btn btn-md btn-info" OnClick="btnRoom_Click" runat="server" Text="More Info" />
                            </div> 
                        </a>
                        </div>
                    </div>
                <div class="col-md-4 col-lg-4 col-sm-12">
                    <div class="indexRoomDesign">
                        <a id="img1Link2" name="img1Link">
                            <div class="offer">From <span class="pound-currency">£100</span></div>
                            <img id="img1" src="/asset/images/rooms/SYD_795_original.jpg" class="imgRooms" />
                            <div class="package">Deluxe Twin/Large Room</div>
                            <div class="description"><span>Our Deluxe Twin/Large Double also provides views over landscaped gardens. It has a seating area, digital safe, minibar and luxurious duck down bedding. This room can be configured with either 2 single beds or zip and linked to provide a large double bed.</span></div>
                            <div class="form-group text-center">
                                <asp:Button ID="Button2" CssClass="btn btn-md btn-info" OnClick="btnRoom_Click" runat="server" Text="More Info" />
                            </div> 
                        </a>
                        </div>
                    </div>
                </div>
        </div>
    </form>
</body>
</html>
