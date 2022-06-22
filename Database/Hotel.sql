
-use hotel
CREATE TABLE tblServiceCategory(	
	serviceCategoryID int  AUTO_INCREMENT NOT NULL,
	name nvarchar(50) NOT NULL,
	status bit NULL,
    PRIMARY KEY (serviceCategoryID)
    );
    
CREATE TABLE tblService(	
    serviceID int AUTO_INCREMENT NOT NULL,
	serviceName varchar(20) NOT NULL,
    price decimal(5,2),
    quantity int NOT NULL,
    serviceCategoryID int NOT NULL,
	image nvarchar(200) NOT NULL,
    status bit NULL,
    PRIMARY KEY (serviceID),
    FOREIGN KEY (serviceCategoryID) REFERENCES tblServiceCategory(serviceCategoryID)
);
ALTER TABLE tblServiceCategory ADD CONSTRAINT FK_serviceCategoryID FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);
    select * from tblServiceCategory
    
     INSERT INTO tblServiceCategory (name,status) VALUES ('Water',1);
    INSERT INTO tblServiceCategory(name,status) VALUES ('Food',1);
    
     GO
CREATE TABLE tblServiceDetail]
(	[serviceDetailID] [int]IDENTITY(1,1) NOT NULL,
    [serviceID] [int] NOT NULL,
    [bookingDetailID] [int] NOT NULL,
    [quantity] [int] NOT NULL,
    [totalPrice] [money] ,
    [status] [bit] NULL,
    CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED
(
[serviceDetailID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)ON [PRIMARY])
 ON [PRIMARY]
    GO

CREATE TABLE [dbo].[tblRoomStatus]
(	[roomStatusID] [int]IDENTITY(1,1) NOT NULL,
    [nameStatus] varchar(50) NOT NULL,
    [status] [bit] NULL,
    CONSTRAINT [PK_tblRoomStatus] PRIMARY KEY CLUSTERED
(
	[roomStatusID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)ON [PRIMARY])
  ON [PRIMARY]
    GO
CREATE TABLE [dbo].[tblRoom]
(	[roomID] [int]IDENTITY(1,1) NOT NULL,
    [roomCategoryID] [int] NOT NULL,
    [roomStatusID] [int] NOT NULL,
    [nameRoom] varchar(30) NOT NULL,
	[startTime] datetime NULL,
	[finishTime] datetime NULL,
	[image] nvarchar(MAX) NOT NULL,
	[price] money,
    [status] [bit] NULL,
    CONSTRAINT [PK_tblRoom] PRIMARY KEY CLUSTERED
(
	[roomID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY])
ON [PRIMARY]
GO
CREATE TABLE [dbo].[tblRoomCategory]
(	[roomCategoryID] [int]IDENTITY(1,1) NOT NULL,
    [nameType] varchar(10) NOT NULL,
	[price] [money] NOT NULL,
    [status] [bit] NULL,
    CONSTRAINT [PK_tblRoomCategory] PRIMARY KEY CLUSTERED
(
[roomCategoryID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)ON [PRIMARY])
ON [PRIMARY]
    GO

CREATE TABLE [dbo].[tblRoles]
(	[roleID] [int] IDENTITY(1,1) NOT NULL,
    [name] varchar(10) NOT NULL,
    [status] [bit] NULL,
    CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED
(
	[roleID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)ON [PRIMARY])
  ON [PRIMARY]
    GO
CREATE TABLE [dbo].[tblAccount]
(	[accountID] [int]IDENTITY(1,1) NOT NULL,
	[email] nvarchar( max) NOT NULL,
	[phone] varchar(10) NOT NULL,
	[password] nvarchar(100) NOT NULL ,
    [profileID] [int] UNIQUE,
    [createTime] [datetime],
    [roleID] [int] NOT NULL,
    [status] [bit] NULL,
    CONSTRAINT [PK_tblAccount] PRIMARY KEY CLUSTERED
(	[accountID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)ON [PRIMARY]) ON [PRIMARY]
 GO
CREATE TABLE [dbo].[tblProfile]
(	[profileID] [int]IDENTITY( 1, 1) NOT NULL,
	[fullName] nvarchar(100),
	[brithday] [date],
    [note] nvarchar(100),
	[cardNumber] varchar(10) NOT NULL,
    [status] [bit] NULL,
    CONSTRAINT [PK_tblProfile] PRIMARY KEY CLUSTERED
(
[profileID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)ON [PRIMARY])
 ON [PRIMARY]
    GO
CREATE TABLE [dbo].[tblBooking]
(	
    [bookingID] [int] IDENTITY( 1,1)NOT NULL,
    [accountID] [int] NOT NULL,
    [bookingTime] [datetime],
    [checkOutTime] [datetime],
    [checInTime] [datetime],
    [surcharge] [money],
    [prepayment] [money],
    [price] [money],
    [status] [bit] NULL,
    CONSTRAINT [PK_tblBooking] PRIMARY KEY CLUSTERED
(
	[bookingID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)ON [PRIMARY])
  ON [PRIMARY]
    GO
	   
CREATE TABLE [dbo].[tblBookingDetail]
(
    [bookingDetailID] [int] IDENTITY( 1,1)NOT NULL,
    [roomID] [int] NOT NULL,
    [bookingID] [int] NOT NULL,
    [totalService] [money],
    [totalRoom] [money],
    [total] [money],
    [status] [bit] NULL,
    CONSTRAINT [PK_tblBookingDetail] PRIMARY KEY CLUSTERED
(
	[bookingDetailID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)ON [PRIMARY])
  ON [PRIMARY]
     GO
CREATE TABLE [dbo].[tblSlot]
(
    [slotID] [int] IDENTITY( 1,1)NOT NULL,
	[bookingDetailID] [int] NOT NULL,
    [slot] [int] NOT NULL,
    [hour] [datetime],
	[percent] DECIMAL(5,2) NULL,
    [price] [money],
    [status] [bit] NULL,
    CONSTRAINT [PK_tblSlot] PRIMARY KEY CLUSTERED
(
	[slotID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)ON [PRIMARY])
  ON [PRIMARY]
    GO

	ALTER TABLE [dbo].[tblBookingDetail] WITH CHECK ADD CONSTRAINT [FK_bookingID] FOREIGN KEY ([bookingID])
    REFERENCES [dbo].[tblBooking] ([bookingID])/*ok*/

ALTER TABLE [dbo].[tblBookingDetail] WITH CHECK ADD CONSTRAINT [FK_roomID] FOREIGN KEY ([roomID])
    REFERENCES [dbo].[tblRoom] ([roomID]) /*ok*/

ALTER TABLE [dbo].[tblServiceDetail] WITH CHECK ADD CONSTRAINT [FK_bookingDetailID] FOREIGN KEY ([bookingDetailID])
    REFERENCES [dbo].[tblBookingDetail] ([bookingDetailID]) /*ok*/

ALTER TABLE [dbo].[tblBooking] WITH CHECK ADD CONSTRAINT [FK_accountID] FOREIGN KEY ([accountID])
    REFERENCES [dbo].[tblAccount] ([accountID]) /*ok*/


ALTER TABLE [dbo].[tblServiceDetail] WITH CHECK ADD CONSTRAINT [FK_serviceID] FOREIGN KEY ([serviceID])
    REFERENCES [dbo].[tblService] ([serviceID])/*ok*/


ALTER TABLE [dbo].[tblService] WITH CHECK ADD CONSTRAINT [FK_serviceCategoryID] FOREIGN KEY ([serviceCategoryID])
    REFERENCES [dbo].[tblServiceCategory] ([serviceCategoryID])/*ok*/


ALTER TABLE [dbo].[tblRoom] WITH CHECK ADD CONSTRAINT [FK_roomCategoryID] FOREIGN KEY ([roomCategoryID])
    REFERENCES [dbo].[tblRoomCategory] ([roomCategoryID])/*ok*/


ALTER TABLE [dbo].[tblRoom] WITH CHECK ADD CONSTRAINT [FK_roomStatusID] FOREIGN KEY ([roomStatusID])
    REFERENCES [dbo].[tblRoomStatus] ([roomStatusID])/*ok*/

ALTER TABLE [dbo].[tblAccount] WITH CHECK ADD CONSTRAINT [FK_profileID_account] FOREIGN KEY ([profileID])
    REFERENCES [dbo].[tblProfile] ([profileID])/*ok*/

ALTER TABLE [dbo].[tblAccount] WITH CHECK ADD CONSTRAINT [FK_roleID] FOREIGN KEY ([roleID])
    REFERENCES [dbo].[tblRoles] ([roleID]) /*ok*/

	ALTER TABLE [dbo].[tblSlot] WITH CHECK ADD CONSTRAINT [FK_bookingDetailID_slot] FOREIGN KEY ([bookingDetailID])
    REFERENCES [dbo].[tblBookingDetail] ([bookingDetailID]) /*ok*/

/*INSERT DATA*/


/*Roles*/
    INSERT [dbo].[tblRoles] ( [name],[status])
    VALUES (N'Admin',1)
    INSERT [dbo].[tblRoles] ( [name],[status])
    VALUES (N'User',1)

/*Profile*/
    INSERT [dbo].[tblProfile] ([fullName], [cardNumber], [brithday],[status]) VALUES ('admin','0000000000','2022-05-26',1)
    INSERT [dbo].[tblProfile] ([fullName], [cardNumber], [brithday],[status]) VALUES ('Mai Ngọc Hải Hưng','6161666161','2001-05-26',1)

/*Account*/
    INSERT [dbo].[tblAccount] ([email], [phone], [password], [roleID], [ProfileID], [createTime],[status]) VALUES (N'Adminlogin@gmail.com', '0101010101', N'1', 1,1, GETDATE(),0)
    INSERT [dbo].[tblAccount] ([email], [phone], [password], [roleID], [ProfileID], [createTime],[status]) VALUES (N'haihungn@gmail.com', '0901010109', N'1', 2,2, GETDATE(),0)
/*ServiceCategory*/
    INSERT [dbo].[tblServiceCategory] ([name],[status]) VALUES ('Water',1)
    INSERT [dbo].[tblServiceCategory] ([name],[status]) VALUES ('Food',1)
  
/*Service*/
	
    INSERT [dbo].[tblService] ([serviceName],[image],[quantity],[price],[serviceCategoryID],[status]) VALUES ('Wine',N'https://tcsofthotel.com/Upload/images/vang%20%c4%91%e1%bb%8f.jpg',210.000,12,1,1)
    INSERT [dbo].[tblService] ([serviceName],[image],[quantity],[price],[serviceCategoryID],[status]) VALUES ('Trứng ốp la','https://ezcloud.vn/wp-content/uploads/2019/04/tinngan_062127_179518229_0.jpg',100.000,9,2,1)

/*RoomCategory*/
    INSERT [dbo].[tblRoomCategory] ([nameType],[price],[status]) VALUES ('VIP',800.000,1)
    INSERT [dbo].[tblRoomCategory] ([nameType],[price],[status]) VALUES ('Deluxe',500.000,1)
    INSERT [dbo].[tblRoomCategory] ([nameType],[price],[status]) VALUES ('Standard',300.000,1)
/* tblRoomStatus*/
	INSERT [dbo].[tblRoomStatus] ([nameStatus],[status]) VALUES ('Unvaliable',1)
	INSERT [dbo].[tblRoomStatus] ([nameStatus],[status]) VALUES ('Valiable',1)
	INSERT [dbo].[tblRoomStatus] ([nameStatus],[status]) VALUES ('Booking',1)


/*Room*/
/*
RoomNumber: 101
Type: Standard
RoomStatus = () => Valiable
Status: true

*/
    INSERT [dbo].[tblRoom] ([nameRoom],[image],[roomCategoryID],[roomStatusID],[startTime],[finishTime],[price],[status]) VALUES ('101',N'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/29/1c/d4/kha-ch-sa-n-luxury.jpg?w=600&h=300&s=1', 1, 2,'2022-05-28 7:15:09','2022-05-29 7:15:09',800.000,1)

/*
RoomNumber: 102
Type: Deluxe
RoomStatus = () => Valiable
Status: true
*/
    INSERT [dbo].[tblRoom] ([nameRoom],[image],[roomCategoryID],[roomStatusID],[startTime],[finishTime],[price],[status])
	VALUES ('102',N'https://www.arttravel.com.vn/upload/hinhthem/presidentialsuite660x365-muong-thanh-633.png', 1, 2,'2022-06-28 8:15:09','2022-06-29 8:15:09',500.000,1)

/*
RoomNumber: 103
Type: VIP
RoomStatus = () => Valiable
Status: true
*/
    INSERT [dbo].[tblRoom] ([nameRoom],[image],[roomCategoryID],[roomStatusID],[startTime],[finishTime],[price],[status]) 
	VALUES ('103', N'https://luxuryhotel.webhotel.vn/files/images/Rio-hotel/Room/presidential-suite-room/army-presidential-suite-room5.jpg', 1, 2,'2022-06-28 8:15:09','2022-06-29 8:15:09',500.000,1)
/*
Customer name: Mai Ngoc Hai Hung 
ID: 2
Hinh Thuc: Nightly
Phong: 101
Booking Time: GETDATE()
Check in: 27-05-2022 
*/

/*tblBooking*/
	INSERT [dbo].[tblBooking] ( [accountID],[bookingTime],[checInTime], [checkOutTime] , [price],[status])
    VALUES (1,GETDATE(),'2022-05-28 7:15:09','2022-05-29 7:15:09',500.000,1)


/*tblBookingDetail*/
    INSERT [dbo].[tblBookingDetail] ([roomID],[bookingID],[totalService], [totalRoom], [total],[status])
    VALUES (1,1,200.000,500.000,700.000,1)

/*ServiceDetail*/
    INSERT [dbo].[tblServiceDetail] ([serviceID],[quantity],[bookingDetailID],[status]) VALUES (1,5,2,1)

/*Slot*/
    INSERT [dbo].[tblSlot] ([bookingDetailID],[slot],[hour],[percent],[price],[status]) VALUES (1,1,1,'20',60.000,1)
	INSERT [dbo].[tblSlot] ([bookingDetailID],[slot],[hour],[percent],[price],[status]) VALUES (1,1,2,'15',100.000,1)
select *from tblRoles
select *
from tblProfile
select *
from tblAccount
select *
from tblServiceCategory
select *
from tblService
select *
from tblRoomCategory
select *
from tblRoomStatus
select *
from tblRoom
select *
from tblBookingDetail
select *
from tblServiceDetail
select * from tblSlot
