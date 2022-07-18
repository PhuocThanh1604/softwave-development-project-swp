create database HotelDatabase
use HotelDatabase

-- USE hotelDatabase
CREATE TABLE BookingStatus (
	bookingStatusID INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    Status BIT NULL,
    PRIMARY KEY (bookingStatusID)
)
CREATE TABLE RoomStatus
(	roomStatusID INT AUTO_INCREMENT NOT NULL,
    nameStatus VARCHAR(255) NOT NULL,
    status BIT NULL,
   PRIMARY KEY (roomStatusID)
);

CREATE TABLE Room
(	roomID  INT AUTO_INCREMENT NOT NULL,
    roomCategoryID INT NOT NULL,
    roomStatusID INT NOT NULL,
    nameRoom VARCHAR(255) NOT NULL,
	startTime DATETIME,
	finishTime DATETIME,
	price DECIMAL(5,2),
    status BIT NULL,
     PRIMARY KEY (roomID)
);

CREATE TABLE RoomCategory
(	roomCategoryID INT  AUTO_INCREMENT NOT NULL,
    nameType VARCHAR(255) NOT NULL,
    description VARCHAR(255) NULL,
    image VARCHAR(255) NULL,
    people INT NOT NULL,
    quantity INT NOT NULL,
    slug VARCHAR(50)NOT NULL,
	price DECIMAL(5,2) NOT NULL,
    status  BIT NULL,
    PRIMARY KEY (roomCategoryID)
);

CREATE TABLE Role
(	roleID INT  AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    status BIT NULL,
    PRIMARY KEY (roleID)
) ;

CREATE TABLE Account
(	accountID INT AUTO_INCREMENT NOT NULL,
	email VARCHAR(255) NOT NULL,
	phone VARCHAR(10) NOT NULL,
	password VARCHAR(100) NOT NULL ,
    profileID INT UNIQUE,
    roleID INT NOT NULL,
    status BIT NULL,
     PRIMARY KEY (accountID)
) ;

CREATE TABLE Profile
(	profileID INT AUTO_INCREMENT NOT NULL,
	fullName VARCHAR(255),
	dob DATE,
    image VARCHAR(255) NULL,
	cardNumber VARCHAR(10) NOT NULL,
    status BIT NULL,
	PRIMARY KEY (profileID)
);

CREATE TABLE Booking
(	
    bookingID INT AUTO_INCREMENT NOT NULL,
    accountID INT NOT NULL,
    bookingStatusID INT NOT NULL,
    bookingTime DATETIME,
   note VARCHAR(255) NULL,
   people INT NOT NULL,
    quantity INT NOT NULL,
    surcharge DECIMAL(5,2),
    prepayment DECIMAL(5,2),
    price DECIMAL(5,2),
    status BIT NULL,
	PRIMARY KEY (bookingID)
);
	   
CREATE TABLE BookingDetail
(
    bookingDetailID INT AUTO_INCREMENT NOT NULL,
    roomID INT NOT NULL,
    bookingID INT NOT NULL,
    roomCategoryID INT NOT NULL,
   checkInTime DATETIME,
    checkOutTime DATETIME,
    totalRoom DECIMAL(5,2),
    total DECIMAL(5,2),
    status bit NULL,
    PRIMARY KEY (bookingDetailID)
);

        
ALTER TABLE Account ADD CONSTRAINT FK_profileID
		FOREIGN KEY (profileID) REFERENCES Profile(profileID); /*oK*/
        
ALTER TABLE Account ADD CONSTRAINT FK_roleID
		FOREIGN KEY (roleID) REFERENCES Role(roleID); /*oK*/
        
ALTER TABLE Booking ADD CONSTRAINT FK_accountID
		FOREIGN KEY (accountID) REFERENCES Account(accountID);/*oK*/
	
ALTER TABLE BookingDetail ADD CONSTRAINT FK_bookingID
		FOREIGN KEY (bookingID) REFERENCES Booking(bookingID);/*oK*/
        
ALTER TABLE  BookingDetail ADD CONSTRAINT FK_roomID
		FOREIGN KEY (roomID) REFERENCES room(roomID);/*oK*/

ALTER TABLE  Room ADD CONSTRAINT FK_roomCategoryID
		FOREIGN KEY (roomCategoryID) REFERENCES RoomCategory(roomCategoryID);/*oK*/
        
ALTER TABLE  Room ADD CONSTRAINT FK_roomStatusID
		FOREIGN KEY (roomStatusID) REFERENCES RoomStatus(roomStatusID);/*oK*/
        
ALTER TABLE Booking  ADD CONSTRAINT FK_bookingStatusID
		FOREIGN KEY (bookingStatusID) REFERENCES BookingStatus(bookingStatusID);/*oK*/

/*INSERT DATA*/
/*Role*/
    INSERT INTO Role (name,status)
    VALUES (N'Admin',1);
    INSERT INTO Role (name,status)
    VALUES (N'User',1);

/*Profile*/
    INSERT INTO Profile (fullName, cardNumber, dob,status) VALUES ('admin','0000000000','2022-05-26',1);
    INSERT INTO Profile (fullName, cardNumber, dob,status)  VALUES ('Mai Ngọc Hải Hưng','6161666161','2001-05-26',1);

/*Account*/
/*
Status:1 -> trạng thái đang hoạt động
*/
    INSERT INTO Account (email, phone, password, roleID, ProfileID,status) VALUES ('Adminlogin@gmail.com', '0101010101', N'1', 1,1,1);
    INSERT INTO Account (email, phone, password, roleID, ProfileID,status) VALUES ('haihungn@gmail.com', '0901010109', N'1', 2,2,1);
    
/*RoomCategory*/
    INSERT INTO RoomCategory (nameType, description,image,people,quantity,slug,price,status)
    VALUES ('Deluxy',N'Có ghế tình yêu',N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm-pWKYJ3JoQ3SNbWVCk8dAAnzwgauW4YCeAU-YL1j_o_Ig7el1gNaMUS_LvciRb8icTk&usqp=CAU',4,10,'deluxy',800.000,1);
    INSERT INTO RoomCategory (nameType, description,image,people,quantity,slug,price,status) 
    VALUES ('Vip',N'Massage',N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm-pWKYJ3JoQ3SNbWVCk8dAAnzwgauW4YCeAU-YL1j_o_Ig7el1gNaMUS_LvciRb8icTk&usqp=CAU',2,5,'vip',500.000,1);
    INSERT INTO RoomCategory (nameType,image,people,quantity,slug,price,status)
    VALUES ('Standard',N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm-pWKYJ3JoQ3SNbWVCk8dAAnzwgauW4YCeAU-YL1j_o_Ig7el1gNaMUS_LvciRb8icTk&usqp=CAU',2,3,'standard',300.000,1);
/* tblRoomStatus*/
	INSERT INTO RoomStatus (nameStatus,status) VALUES ('Unvaliable',1);
	INSERT INTO RoomStatus (nameStatus,status) VALUES ('Valiable',1);
	INSERT INTO RoomStatus (nameStatus,status) VALUES ('Booking',1);


/*Room*/
/*
RoomNumber: 101
Type: Standard
RoomStatus = () => Valiable
Status: true

*/
    INSERT INTO Room (nameRoom,roomCategoryID,roomStatusID,startTime,finishTime,price,status) 
		VALUES ('101', 1, 2,'2022-05-28 7:15:09','2022-05-29 7:15:09',800.000,1);

/*
RoomNumber: 102
Type: Deluxe
RoomStatus = () => Valiable
Status: true
*/
     INSERT INTO Room (nameRoom,roomCategoryID,roomStatusID,startTime,finishTime,price,status)
	VALUES ('102', 1, 2,'2022-06-28 8:15:09','2022-06-29 8:15:09',500.000,1);

/*
RoomNumber: 103
Type: VIP
RoomStatus = () => Valiable
Status: true
*/
     INSERT INTO Room (nameRoom,roomCategoryID,roomStatusID,startTime,finishTime,price,status) 
	VALUES ('103', 1, 2,'2022-06-28 8:15:09','2022-06-29 8:15:09',500.000,1);
/*
Customer name: Mai Ngoc Hai Hung 
ID: 2
Hinh Thuc: Nightly
Phong: 101
Booking Time: GETDATE()
Check in: 27-05-2022 
*/
/*BookingStatus*/
    INSERT INTO BookingStatus (name,status)
    VALUES (N'Wating',1);
/*Booking*/
	INSERT INTO Booking ( accountID,bookingTime,people,prepayment ,quantity, price,status, bookingStatusID)
    VALUES (2,CURRENT_DATE(),2,200.000,500.000,1,1,1);

/*tblBookingDetail*/
    INSERT INTO BookingDetail (roomID,bookingID,checkInTime,checkOutTime,roomCategoryID,totalRoom, total,status)
    VALUES (1,1,'2022-06-28 8:15:09','2022-06-29 8:15:09',3,500.000,500.000,1);


select *from Role;
select *
from Profile;
select *
from Account;
select *
from RoomStatus;
select *
from Room;
select *
from BookingDetail;
select * from bookingStatus;
select *
from Booking;
select * from roomCategory

