create database HotelManagement
use HotelManagement

-- USE hotelDatabase

CREATE TABLE tblServiceCategory(	
	serviceCategoryID INT  AUTO_INCREMENT NOT NULL,
	name VARCHAR(50) NOT NULL,
	status BIT NULL,
    PRIMARY KEY (serviceCategoryID)
);
    
CREATE TABLE tblService(	
    serviceID INT AUTO_INCREMENT NOT NULL,
	serviceName VARCHAR(20) NOT NULL,
    price DECIMAL(5,2) NOT NULL,
    quantity INT NOT NULL,
    serviceCategoryID INT NOT NULL,
	image VARCHAR(255) NOT NULL,
    status BIT NULL,
    PRIMARY KEY (serviceID)
);

     
CREATE TABLE tblServiceDetail
(	serviceDetailID INT AUTO_INCREMENT NOT NULL,
    serviceID INT NOT NULL,
    bookingDetailID INT  NOT NULL,
    quantity INT NOT NULL,
    totalPrice DECIMAL(5,2),
    status BIT NULL,
    PRIMARY KEY (serviceDetailID)
);

CREATE TABLE tblRoomStatus
(	roomStatusID INT AUTO_INCREMENT NOT NULL,
    nameStatus VARCHAR(255) NOT NULL,
    status BIT NULL,
   PRIMARY KEY (roomStatusID)
);

CREATE TABLE tblRoom
(	roomID  INT AUTO_INCREMENT NOT NULL,
    roomCategoryID INT NOT NULL,
    roomStatusID INT NOT NULL,
    nameRoom VARCHAR(255) NOT NULL,
	startTime DATETIME,
	finishTime DATETIME,
	image VARCHAR(255) NOT NULL,
	price DECIMAL(5,2),
    status BIT NULL,
     PRIMARY KEY (roomID)
);

CREATE TABLE tblRoomCategory
(	roomCategoryID INT  AUTO_INCREMENT NOT NULL,
    nameType VARCHAR(255) NOT NULL,
	price DECIMAL(5,2) NOT NULL,
    status  BIT NULL,
    PRIMARY KEY (roomCategoryID)
);

CREATE TABLE tblRoles
(	roleID INT  AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    status BIT NULL,
    PRIMARY KEY (roleID)
) ;

CREATE TABLE tblAccount
(	accountID INT AUTO_INCREMENT NOT NULL,
	email VARCHAR(255) NOT NULL,
	phone VARCHAR(10) NOT NULL,
	password VARCHAR(100) NOT NULL ,
    profileID INT UNIQUE,
    createTime DATETIME,
    roleID INT NOT NULL,
    status BIT NULL,
     PRIMARY KEY (accountID)
) ;

CREATE TABLE tblProfile
(	profileID INT AUTO_INCREMENT NOT NULL,
	fullName VARCHAR(255),
	brithday DATE,
    note TEXT,
	cardNumber VARCHAR(10) NOT NULL,
    status BIT NULL,
     PRIMARY KEY (profileID)
);

CREATE TABLE tblBooking
(	
    bookingID INT AUTO_INCREMENT NOT NULL,
    accountID INT NOT NULL,
    bookingTime DATETIME,
    checkOutTime DATETIME,
    checInTime DATETIME,
    surcharge DECIMAL(5,2),
    prepayment DECIMAL(5,2),
    price DECIMAL(5,2),
    status BIT NULL,
	 PRIMARY KEY (bookingID)
);
	   
CREATE TABLE tblBookingDetail
(
    bookingDetailID INT AUTO_INCREMENT NOT NULL,
    roomID INT NOT NULL,
    bookingID INT NOT NULL,
    totalService DECIMAL(5,2),
    totalRoom DECIMAL(5,2),
    total DECIMAL(5,2),
    status bit NULL,
   PRIMARY KEY (bookingDetailID)
);

CREATE TABLE tblSlot
(
    slotID INT AUTO_INCREMENT NOT NULL,
	bookingDetailID INT NOT NULL,
    slot INT NOT NULL,
    hour VARCHAR(2),
	percent DECIMAL(5,2),
    price DECIMAL(5,2),
    status BIT NULL,
    PRIMARY KEY (slotID)
); 

ALTER TABLE tblService ADD CONSTRAINT FK_serviceCategoryID
		FOREIGN KEY (serviceCategoryID) REFERENCES tblServiceCategory(serviceCategoryID);/*OK*/

ALTER TABLE tblServiceDetail ADD CONSTRAINT FK_serviceID
		FOREIGN KEY (serviceID) REFERENCES tblService(serviceID);/*OK*/
        
ALTER TABLE tblAccount ADD CONSTRAINT FK_profileID
		FOREIGN KEY (profileID) REFERENCES tblProfile(profileID);/*ok*/
        
ALTER TABLE tblAccount ADD CONSTRAINT FK_roleID
		FOREIGN KEY (roleID) REFERENCES tblRoles(roleID);/*ok*/
        
ALTER TABLE tblBooking ADD CONSTRAINT FK_accountID
		FOREIGN KEY (accountID) REFERENCES tblAccount(accountID);/*OK*/
	
ALTER TABLE tblBookingDetail ADD CONSTRAINT FK_bookingID
		FOREIGN KEY (bookingID) REFERENCES tblBooking(bookingID);/*OK*/
        
ALTER TABLE  tblBookingDetail ADD CONSTRAINT FK_roomID
		FOREIGN KEY (roomID) REFERENCES tblRoom(roomID);/*OK*/


ALTER TABLE  tblRoom ADD CONSTRAINT FK_roomCategoryID
		FOREIGN KEY (roomCategoryID) REFERENCES tblRoomCategory(roomCategoryID);/*OK*/
        
ALTER TABLE  tblRoom ADD CONSTRAINT FK_roomStatusID
		FOREIGN KEY (roomStatusID) REFERENCES tblRoomStatus(roomStatusID);/*OK*/

ALTER TABLE tblSlot  ADD CONSTRAINT FK_bookingDetailID
		FOREIGN KEY (bookingDetailID) REFERENCES tblBookingDetail(bookingDetailID);/*OK*/

ALTER TABLE  tblServiceDetail ADD CONSTRAINT FK_bookingDetailID_service
		FOREIGN KEY (bookingDetailID) REFERENCES tblBookingDetail(bookingDetailID);/*OK*/
/*INSERT DATA*/

	INSERT INTO tblServiceCategory (name,status) VALUES ('Water',1);
    INSERT INTO tblServiceCategory (name,status) VALUES ('Food',1);

/*Roles*/
    INSERT INTO tblRoles (name,status)
    VALUES (N'Admin',1);
    INSERT INTO tblRoles (name,status)
    VALUES (N'User',1);

/*Profile*/
    INSERT INTO tblProfile (fullName, cardNumber, brithday,status) VALUES ('admin','0000000000','2022-05-26',1);
    INSERT INTO tblProfile (fullName, cardNumber, brithday,status)  VALUES ('Mai Ngọc Hải Hưng','6161666161','2001-05-26',1);

/*Account*/
    INSERT INTO tblAccount (email, phone, password, roleID, ProfileID, createTime,status) VALUES ('Adminlogin@gmail.com', '0101010101', N'1', 1,1, CURRENT_DATE(),1);
    INSERT INTO tblAccount (email, phone, password, roleID, ProfileID, createTime,status) VALUES ('haihungn@gmail.com', '0901010109', N'1', 2,2, CURRENT_DATE(),1);
/*ServiceCategory*/
    INSERT INTO tblServiceCategory (name,status) VALUES ('Water',1);
    INSERT INTO tblServiceCategory (name,status) VALUES ('Food',1);
  
/*Service*/
	
    INSERT INTO tblService (serviceName,image,quantity,price,serviceCategoryID,status) VALUES ('Wine',N'https://tcsofthotel.com/Upload/images/vang%20%c4%91%e1%bb%8f.jpg',12,210.000,1,1);
    INSERT INTO tblService (serviceName,image,quantity,price,serviceCategoryID,status) VALUES ('Trứng ốp la',N'https://ezcloud.vn/wp-content/uploads/2019/04/tinngan_062127_179518229_0.jpg',9,100.000,2,1);

/*RoomCategory*/
    INSERT INTO tblRoomCategory (nameType,price,status) VALUES ('VIP',800.000,1);
    INSERT INTO tblRoomCategory (nameType,price,status) VALUES ('Deluxe',500.000,1);
    INSERT INTO tblRoomCategory (nameType,price,status) VALUES ('Standard',300.000,1);
/* tblRoomStatus*/
	INSERT INTO tblRoomStatus (nameStatus,status) VALUES ('Unvaliable',1);
	INSERT INTO tblRoomStatus (nameStatus,status) VALUES ('Valiable',1);
	INSERT INTO tblRoomStatus (nameStatus,status) VALUES ('Booking',1);


/*Room*/
/*
RoomNumber: 101
Type: Standard
RoomStatus = () => Valiable
Status: true

*/
    INSERT INTO tblRoom (nameRoom,image,roomCategoryID,roomStatusID,startTime,finishTime,price,status) 
		VALUES ('101',N'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/29/1c/d4/kha-ch-sa-n-luxury.jpg?w=600&h=300&s=1', 1, 2,'2022-05-28 7:15:09','2022-05-29 7:15:09',800.000,1);

/*
RoomNumber: 102
Type: Deluxe
RoomStatus = () => Valiable
Status: true
*/
     INSERT INTO tblRoom (nameRoom,image,roomCategoryID,roomStatusID,startTime,finishTime,price,status)
	VALUES ('102',N'https://www.arttravel.com.vn/upload/hinhthem/presidentialsuite660x365-muong-thanh-633.png', 1, 2,'2022-06-28 8:15:09','2022-06-29 8:15:09',500.000,1);

/*
RoomNumber: 103
Type: VIP
RoomStatus = () => Valiable
Status: true
*/
     INSERT INTO tblRoom (nameRoom,image,roomCategoryID,roomStatusID,startTime,finishTime,price,status) 
	VALUES ('103', N'https://luxuryhotel.webhotel.vn/files/images/Rio-hotel/Room/presidential-suite-room/army-presidential-suite-room5.jpg', 1, 2,'2022-06-28 8:15:09','2022-06-29 8:15:09',500.000,1);
/*
Customer name: Mai Ngoc Hai Hung 
ID: 2
Hinh Thuc: Nightly
Phong: 101
Booking Time: GETDATE()
Check in: 27-05-2022 
*/

/*tblBooking*/
	INSERT INTO tblBooking ( accountID,bookingTime,checInTime, checkOutTime , price,status)
    VALUES (2,CURRENT_DATE(),'2022-05-28 7:15:09','2022-05-29 7:15:09',500.000,1);


/*tblBookingDetail*/
    INSERT INTO tblBookingDetail (roomID,bookingID,totalService, totalRoom, total,status)
    VALUES (1,1,200.000,500.000,700.000,1);

/*ServiceDetail*/
    INSERT INTO tblServiceDetail (serviceID,quantity,bookingDetailID,status) VALUES (1,5,1,1);

/*Slot*/
    INSERT INTO tblSlot (bookingDetailID,slot,hour,percent,price,status) VALUES (1,1,1,'20',60.000,1);
	INSERT INTO tblSlot (bookingDetailID,slot,hour,percent,price,status) VALUES (1,1,'2','15',100.000,1);
select *from tblRoles;
select *
from tblProfile;
select *
from tblAccount;
select *
from tblServiceCategory;
select *
from tblService;
select *
from tblRoomCategory;
select *
from tblRoomStatus;
select *
from tblRoom;
select *
from tblBookingDetail;
select *
from tblServiceDetail;
select * from tblSlot;

select *
from tblBooking;
