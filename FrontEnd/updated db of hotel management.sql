USE [master]
GO
/****** Object:  Database [Hotel-management]    Script Date: 2/20/2020 4:33:11 PM ******/
CREATE DATABASE [Hotel-management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hotel-management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Hotel-management.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Hotel-management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Hotel-management_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Hotel-management] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hotel-management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hotel-management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hotel-management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hotel-management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hotel-management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hotel-management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hotel-management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hotel-management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hotel-management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hotel-management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hotel-management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hotel-management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hotel-management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hotel-management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hotel-management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hotel-management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hotel-management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hotel-management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hotel-management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hotel-management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hotel-management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hotel-management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hotel-management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hotel-management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hotel-management] SET  MULTI_USER 
GO
ALTER DATABASE [Hotel-management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hotel-management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hotel-management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hotel-management] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Hotel-management] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Hotel-management]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[AdminUsername] [varchar](50) NULL,
	[AdminPassword] [varchar](50) NULL,
	[AdminName] [varchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BillPayment]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillPayment](
	[PaymentID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[BookingID] [numeric](18, 0) NULL,
	[OtherServices] [varchar](50) NULL,
	[RoomBill] [nvarchar](50) NULL,
	[TotalBill] [nvarchar](50) NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CustomerID] [numeric](18, 0) NOT NULL,
	[StaffID] [numeric](18, 0) NULL,
	[BookingDate] [nvarchar](50) NULL,
	[InDate] [nvarchar](50) NULL,
	[OutDate] [nvarchar](50) NULL,
	[NumberOfPerson] [numeric](18, 0) NULL,
	[RoomID] [numeric](18, 0) NULL,
	[CancelStatus] [varchar](15) NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) NULL,
	[CustomerAddress] [varchar](250) NULL,
	[CustomerEmail] [varchar](50) NULL,
	[CustomerState] [varchar](50) NULL,
	[CustomerMobile] [varchar](11) NULL,
	[CustomerUsername] [varchar](50) NULL,
	[CustomerPassword] [varchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[RoomNo] [varchar](3) NULL,
	[RoomType] [varchar](50) NULL,
	[RoomAvailability] [varchar](3) NULL,
	[RoomPrice] [nvarchar](50) NULL,
	[Thumbnail] [nvarchar](max) NULL,
	[Description] [varchar](250) NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoomImages]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoomImages](
	[imgID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[imgName] [varchar](250) NULL,
	[imgPath] [nvarchar](max) NULL,
	[roomID] [int] NULL,
 CONSTRAINT [PK_RoomImages] PRIMARY KEY CLUSTERED 
(
	[imgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[StaffUsername] [varchar](50) NULL,
	[StaffName] [varchar](50) NULL,
	[StaffPassword] [varchar](50) NULL,
	[StaffAddress] [varchar](50) NULL,
	[StaffMobile] [numeric](18, 0) NULL,
	[StaffEmail] [varchar](50) NULL,
	[StaffState] [varchar](50) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[AdminLogin]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AdminLogin] 
	-- Add the parameters for the stored procedure here
	@username varchar(50),
	@password varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Admin where AdminUsername=@username and AdminPassword=@password
	
END

GO
/****** Object:  StoredProcedure [dbo].[AdminPasswordChange]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AdminPasswordChange] 
	-- Add the parameters for the stored procedure here
	@username varchar(50),
	@password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Admin 
	Set AdminPassword=@password
	where AdminUsername=@username
	 
END

GO
/****** Object:  StoredProcedure [dbo].[BookingRoomUpdate]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BookingRoomUpdate] 
	-- Add the parameters for the stored procedure here
	@roomID numeric(18,0), @roomAvailability varchar(3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	Update Room
	set RoomAvailability=@roomAvailability
	where RoomID=@roomID
END

GO
/****** Object:  StoredProcedure [dbo].[BookingUpdate]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[BookingUpdate] 
	-- Add the parameters for the stored procedure here
	@bookingID numeric(18,0),@cancelStatus varchar(15), @outDate nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	Update Booking
	set CancelStatus=@cancelStatus, OutDate=@outDate
	where BookingID=@bookingID
END

GO
/****** Object:  StoredProcedure [dbo].[CancelBooking]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CancelBooking] 
	-- Add the parameters for the stored procedure here
	@roomID numeric(18,0), @customerID numeric(18,0), @cancelStatus varchar(3),@previousStatus varchar(3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	

	Update Booking
	set CancelStatus=@cancelStatus
	where BookingID=(Select BookingID from Booking
	where RoomID=@roomID and CustomerID=@customerID and CancelStatus=@previousStatus)
END

GO
/****** Object:  StoredProcedure [dbo].[CheckBooking]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CheckBooking] 
	-- Add the parameters for the stored procedure here
	@roomID numeric(18,0), @customerID numeric(18,0),@cancelStatus varchar(3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from Booking
	where RoomID=@roomID and CustomerID=@customerID and CancelStatus=@cancelStatus
END

GO
/****** Object:  StoredProcedure [dbo].[CustomerAdd]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CustomerAdd] 
	-- Add the parameters for the stored procedure here
	@username varchar(50), @password varchar(50), @name varchar(50),
	@address varchar(50), @mobile numeric(18,0), @email varchar(50), @state varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	Insert into Customer values (@name,@address,@email,@state,@mobile,@username,@password)
END

GO
/****** Object:  StoredProcedure [dbo].[CustomerBooking]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CustomerBooking] 
	-- Add the parameters for the stored procedure here
	@roomID numeric(18,0), @customerID numeric(18,0), @bookingDate nvarchar(50),
	@inDate nvarchar(50), @numberOfPerson numeric(18,0), @cancelStatus varchar(3), 
	@staffID numeric(18,0)=NULL, @outDate nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	
	Insert into Booking(RoomID,CustomerID,InDate,OutDate,BookingDate,NumberOfPerson,CancelStatus,StaffID ) 
	values (@roomID,@customerID,@inDate,@outDate,@bookingDate,@numberOfPerson, @cancelStatus, @staffID)
END

GO
/****** Object:  StoredProcedure [dbo].[CustomerDelete]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CustomerDelete] 
	-- Add the parameters for the stored procedure here
	@username varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	DELETE from Customer where CustomerUsername=@username
END

GO
/****** Object:  StoredProcedure [dbo].[CustomerList]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CustomerList] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	SELECT CustomerUsername, CustomerName, CustomerEmail, CustomerAddress, CustomerMobile, CustomerState from Customer
END

GO
/****** Object:  StoredProcedure [dbo].[CustomerLogin]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CustomerLogin]
	-- Add the parameters for the stored procedure here
	@username varchar(50),
	@password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Customer where CustomerUsername=@username and CustomerPassword=@password
END

GO
/****** Object:  StoredProcedure [dbo].[CustomerSearch]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CustomerSearch] 
	-- Add the parameters for the stored procedure here
	@username varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	SELECT * from Customer where CustomerUsername=@username
END

GO
/****** Object:  StoredProcedure [dbo].[CustomerUpdate]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CustomerUpdate] 
	-- Add the parameters for the stored procedure here
	@username varchar(50), @password varchar(50), @name varchar(50),
	@address varchar(50), @mobile numeric(18,0), @email varchar(50), @state varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	Update Customer
	Set CustomerName=@name, CustomerPassword=@password,
	CustomerAddress=@address, CustomerMobile=@mobile, CustomerEmail=@email, CustomerState=@state
	where CustomerUsername=@username
END

GO
/****** Object:  StoredProcedure [dbo].[PayBill]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PayBill] 
	-- Add the parameters for the stored procedure here
	@bookingID numeric(18,0),@otherServices varchar(50),
	@roomBill nvarchar(50),@totalBill nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	insert into BillPayment(BookingID, OtherServices,RoomBill,TotalBill) values(@bookingID,@otherServices,@roomBill,@totalBill)
END

GO
/****** Object:  StoredProcedure [dbo].[RoomAdd]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RoomAdd] 
	-- Add the parameters for the stored procedure here
	@roomNo varchar(3), @roomType varchar(50), @roomAvailable varchar(3),
	@roomPrice nvarchar(50), @thumbnail nvarchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into Room(RoomNo,RoomType,RoomAvailability,RoomPrice,Thumbnail) values (@roomNo,@roomType,@roomAvailable,@roomPrice,@thumbnail)
	SELECT SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[RoomDelete]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RoomDelete] 
	-- Add the parameters for the stored procedure here
	@roomNo varchar(3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	DELETE from Room where RoomNo=@roomNo
END

GO
/****** Object:  StoredProcedure [dbo].[RoomImagesAdd]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RoomImagesAdd] 
	-- Add the parameters for the stored procedure here
	@roomID numeric(18,0),@imgName varchar(250), @imgPath nvarchar(MAX),
	@imgName1 varchar(250), @imgPath1 nvarchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	Insert into RoomImages(imgName,imgPath,roomID) values (@imgName,@imgPath,@roomID),
	(@imgName1,@imgPath1,@roomID)
END

GO
/****** Object:  StoredProcedure [dbo].[RoomImageSearch]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RoomImageSearch] 
	-- Add the parameters for the stored procedure here
	@roomID numeric(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT imgID,imgName,imgPath,roomID from RoomImages where roomID=@roomID
END

GO
/****** Object:  StoredProcedure [dbo].[RoomImagesUpdate]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RoomImagesUpdate] 
	-- Add the parameters for the stored procedure here
	@roomID numeric(18,0), @imgName varchar(250), 
	@imgNamePrevious varchar(250), @imgPath nvarchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	Update RoomImages
	Set imgName=@imgName, imgPath=@imgPath
	where imgName=@imgNamePrevious
END

GO
/****** Object:  StoredProcedure [dbo].[RoomList]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RoomList] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT RoomNo,RoomType,RoomAvailability,RoomPrice,Thumbnail from Room
END

GO
/****** Object:  StoredProcedure [dbo].[RoomSearch]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RoomSearch] 
	-- Add the parameters for the stored procedure here
	@roomNo varchar(3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	SELECT * from Room where RoomNo=@roomNo
END

GO
/****** Object:  StoredProcedure [dbo].[RoomSearchBooking]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RoomSearchBooking] 
	-- Add the parameters for the stored procedure here
	@roomNo varchar(3), @roomAvailability varchar(3)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Room where RoomNo=@roomNo and RoomAvailability=@roomAvailability
END

GO
/****** Object:  StoredProcedure [dbo].[RoomSearchID]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RoomSearchID] 
	-- Add the parameters for the stored procedure here
	@roomID numeric(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT RoomNo,RoomType,RoomAvailability,RoomPrice from Room where
	RoomID=@roomID
END

GO
/****** Object:  StoredProcedure [dbo].[RoomUpdate]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RoomUpdate] 
	-- Add the parameters for the stored procedure here
	@roomNo varchar(3), @roomType varchar(50), @roomAvailable varchar(3),
	@roomPrice nvarchar(50), @roomID numeric(18,0),@thumbnail nvarchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	
	IF NULLIF(@thumbnail, '') IS NULL
      BEGIN
           Update Room
	Set RoomNo=@roomNo, RoomType=@roomType, RoomAvailability=@roomAvailable,RoomPrice=@roomPrice
	where RoomID=@roomID
      END
      ELSE
      BEGIN
          Update Room
	Set RoomNo=@roomNo, RoomType=@roomType, RoomAvailability=@roomAvailable, RoomPrice=@roomPrice, Thumbnail=@thumbnail
	where RoomID=@roomID
      END
	
END
GO
/****** Object:  StoredProcedure [dbo].[SearchStaff]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SearchStaff] 
	-- Add the parameters for the stored procedure here
	@username varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Staff where StaffUsername=@username
END

GO
/****** Object:  StoredProcedure [dbo].[StaffAdd]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[StaffAdd] 
	-- Add the parameters for the stored procedure here
	@username varchar(50), @password varchar(50), @name varchar(50),
	@address varchar(50), @mobile numeric(18,0), @email varchar(50), @state varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	Insert into Staff values (@username,@name,@password,@address,@mobile,@email,@state)
END

GO
/****** Object:  StoredProcedure [dbo].[StaffDelete]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[StaffDelete] 
	-- Add the parameters for the stored procedure here
	@username varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	DELETE from Staff where StaffUsername=@username
END

GO
/****** Object:  StoredProcedure [dbo].[StaffList]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StaffList]
	
AS
	SELECT StaffUsername, StaffName, StaffEmail, StaffAddress, StaffMobile, StaffState from Staff
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[StaffLogin]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[StaffLogin] 
	-- Add the parameters for the stored procedure here
	@username varchar(50),
	@password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Staff where StaffUsername=@username and StaffPassword=@password
END

GO
/****** Object:  StoredProcedure [dbo].[StaffUpdate]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[StaffUpdate] 
	-- Add the parameters for the stored procedure here
	@username varchar(50), @password varchar(50), @name varchar(50),
	@address varchar(50), @mobile numeric(18,0), @email varchar(50), @state varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	Update Staff
	Set StaffName=@name, StaffPassword=@password,
	StaffAddress=@address, StaffMobile=@mobile, StaffEmail=@email, StaffState=@state
	where StaffUsername=@username
END

GO
/****** Object:  StoredProcedure [dbo].[StaffUsername]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[StaffUsername] 
	-- Add the parameters for the stored procedure here
	@username varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	SELECT Count(*) from Staff where StaffUsername=@username
END

GO
/****** Object:  StoredProcedure [dbo].[ViewCustomerBooking]    Script Date: 2/20/2020 4:33:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ViewCustomerBooking] 
	-- Add the parameters for the stored procedure here
	@customerID numeric(18,0)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT OFF;

    -- Insert statements for procedure here
	SELECT BookingID,CustomerID,RoomID,BookingDate,InDate,OutDate,NumberOfPerson,CancelStatus
	from Booking
	where CustomerID=@customerID
END

GO
USE [master]
GO
ALTER DATABASE [Hotel-management] SET  READ_WRITE 
GO
