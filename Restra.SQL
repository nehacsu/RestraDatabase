DROP TABLE Vendor_t 		        CASCADE CONSTRAINTS ;
DROP TABLE Store_t 	                CASCADE CONSTRAINTS ;
DROP TABLE Purchase_Order_t 		CASCADE CONSTRAINTS ;
DROP TABLE Employee_t 	            CASCADE CONSTRAINTS ;
DROP TABLE Customer_Order_t 	    CASCADE CONSTRAINTS ;
DROP TABLE Menu_t		            CASCADE CONSTRAINTS ;
DROP TABLE Item_order_t 	        CASCADE CONSTRAINTS ;

 
CREATE TABLE Vendor_t
	     (Vendor_Id          NUMBER         NOT NULL  ,
          Vendor_Name        VARCHAR(50)              ,
		  Address            VARCHAR(150)             ,
		  City               VARCHAR(50)              ,
		  Vendor_State       VARCHAR(10)              ,
		  Zip                VARCHAR(10)              ,
		  Phone_Number		 NUMBER                   ,
CONSTRAINT Vendor_t_PK PRIMARY KEY (Vendor_Id));


CREATE TABLE Store_t
	      (Store_Id         NUMBER         NOT NULL  ,
           Address          VARCHAR(150)             ,
		   City             VARCHAR(50)              ,
		   Store_State      VARCHAR(10)              ,
		   Zip              VARCHAR(10)              ,
		   Phone_Number     NUMBER                   ,
CONSTRAINT Store_Id_PK PRIMARY KEY (Store_Id));


CREATE TABLE Purchase_Order_t
	      (Order_Id          NUMBER         NOT NULL  ,
           Vendor_Id         NUMBER         NOT NULL  ,
		   Store_Id          NUMBER                   ,
		   Purchase_Time     TIMESTAMP                ,	
		   Purchase_Cost     NUMBER                   ,
		   Payment_Method    VARCHAR(10)              ,
CONSTRAINT Purchase_Order_t_PK  PRIMARY KEY (Order_Id),
CONSTRAINT Payment_Method_V     CHECK (Payment_Method   IN('Cash','Card','Online')),		   
CONSTRAINT Purchase_Order_t_FK1 FOREIGN KEY (Vendor_Id) REFERENCES Vendor_t(Vendor_Id),
CONSTRAINT Purchase_Order_t_FK2 FOREIGN KEY (Store_Id)  REFERENCES Store_t(Store_Id));


CREATE TABLE Employee_t
	     (Employee_Id        NUMBER         NOT NULL  ,
		  Store_Id           NUMBER         NOT NULL  ,
          Employee_Name      VARCHAR(50)              ,
		  Address            VARCHAR(150)             ,
		  City               VARCHAR(50)              ,
		  Employee_State     VARCHAR(10)              ,
		  Zip                VARCHAR(10)              ,
		  Phone_Number		 NUMBER                   ,
          Designation        VARCHAR(50)              ,
CONSTRAINT Employee_t_PK  PRIMARY KEY (Employee_Id)   ,
CONSTRAINT Employee_t_FK1 FOREIGN KEY (Store_Id) REFERENCES Store_t(Store_Id));


CREATE TABLE Customer_Order_t
	      (Order_Id          NUMBER         NOT NULL  ,
           Employee_Id       NUMBER         NOT NULL  ,
		   Order_Time        TIMESTAMP                ,
		   Bill_Amount       NUMBER                   ,
		   Payment_Method    VARCHAR(10)    		  ,
		   Order_Status      VARCHAR(50)              ,
		   Store_Id          NUMBER                   ,
		   Tip_Amount        NUMBER                   ,
CONSTRAINT Customer_Ordert_t_PK PRIMARY KEY (Order_Id),
CONSTRAINT Customer_Order_V     CHECK (Payment_Method    IN('Cash','Card','Online')),		   
CONSTRAINT Customer_Order_t_FK1 FOREIGN KEY(Employee_Id) REFERENCES Employee_t(Employee_Id),
CONSTRAINT Customer_Order_t_FK2 FOREIGN KEY(Store_Id)    REFERENCES Store_t(Store_Id));


CREATE TABLE Menu_t
           (Item_Id         NUMBER         NOT NULL  ,
		   Item_Name        VARCHAR(50)              ,
		   Rate_Per_Plate   NUMBER                   ,
		   Menu_type        VARCHAR(10)              ,
		   Description      VARCHAR(150)             ,
CONSTRAINT Menu_t_PK   PRIMARY KEY (Item_Id)         ,
CONSTRAINT Menu_type_V CHECK (Menu_type IN('Veg','Nonveg')));	


CREATE TABLE Item_order_t
           (Item_Id         NUMBER         NOT NULL  ,
           Order_Id         NUMBER         NOT NULL  ,
CONSTRAINT Item_Order_t_PK1 PRIMARY KEY (Item_Id,Order_Id),
CONSTRAINT Item_Order_t_FK1 FOREIGN KEY(Item_Id)   REFERENCES Menu_t(Item_Id) ,
CONSTRAINT Item_Order_t_FK2 FOREIGN KEY (Order_Id) REFERENCES Customer_Order_t(Order_Id));


delete from Vendor_t ;
delete from Store_t;
delete from Purchase_Order_t;
delete from Employee_t;
delete from Customer_Order_t;
delete from Menu_t;
delete from Item_order_t;


INSERT INTO Vendor_t  (Vendor_Id, Vendor_Name, Address, City, Vendor_State ,Zip,Phone_Number)
VALUES  (1, 'Contemporary Casuals', '1355 S Hines Blvd', 'Gainesville','FL','32601-2871',1234567891);
INSERT INTO Vendor_t  (Vendor_Id, Vendor_Name, Address, City,Vendor_State ,Zip,Phone_Number)
VALUES  (2, 'Value Furniture', '15145 S.W. 17th St.','Plano', 'TX', '75094-7743',5658791456);
INSERT INTO Vendor_t  (Vendor_Id, Vendor_Name, Address, City,Vendor_State ,Zip,Phone_Number)
VALUES  (3, 'Home Furnishings', '1900 Allard Ave.', 'Albany', 'NY', '12209-1125',4789652314);
INSERT INTO Vendor_t  (Vendor_Id, Vendor_Name, Address, City,Vendor_State ,Zip,Phone_Number)
VALUES  (4 , 'Eastern Furniture', '1925 Beltline Rd.', 'Carteret', 'NJ', '07008-3188',8596321457);


INSERT INTO Store_t(Store_Id, Address,City,Store_State,Zip,Phone_Number)
VALUES  (101, 'SouthEast Blvd','California','CA','12344', 585815269);
INSERT INTO Store_t(Store_Id, Address,City,Store_State,Zip,Phone_Number)
VALUES  (102, 'Vairo Blvd','California','CA','12344', 589815269);
INSERT INTO Store_t  (Store_Id, Address,City,Store_State,Zip,Phone_Number)
VALUES  (103, 'Avalon City','State College','PA','156789',5008954678);


INSERT INTO Purchase_Order_t  (Order_Id , Vendor_Id, Store_Id, Purchase_Time, Purchase_Cost,Payment_Method)
VALUES (1001, 1, 101,'01-JAN-2012 09:24:00 PM',500,'Cash');
INSERT INTO Purchase_Order_t  (Order_Id , Vendor_Id, Store_Id, Purchase_Time, Purchase_Cost,Payment_Method)
VALUES (1002, 1,102,'01-FEB-2012 09:40:00 PM', 1500,'Card');
INSERT INTO Purchase_Order_t  (Order_Id , Vendor_Id, Store_Id, Purchase_Time, Purchase_Cost,Payment_Method)
VALUES (1003, 2,103,'01-JAN-2012 09:24:00 PM', 11500,'Cash');
INSERT INTO Purchase_Order_t  (Order_Id , Vendor_Id, Store_Id, Purchase_Time, Purchase_Cost,Payment_Method)
VALUES (1004, 3,103,'01-JAN-2012 09:24:00 PM', 2000,'Online');


INSERT INTO Employee_t  (Employee_Id,Store_Id, Employee_Name,Address,City,Employee_State,Zip,Phone_Number,Designation)
VALUES  (12344345,101,'Jim Jason', '2134 Hilltop Rd', 'Union City','CA', '94587',45456768,'Waiter');
INSERT INTO Employee_t  (Employee_Id,Store_Id, Employee_Name,Address,City,Employee_State,Zip,Phone_Number,Designation)
VALUES  (12344334,102,'Bucky Robert', '214 Hilltop Rd', 'Fremont City','CA', '94580',45456760,'Manager');


INSERT INTO Customer_Order_t(Order_Id, Employee_Id,Order_Time,Bill_Amount,Payment_Method,Order_Status,Store_Id, Tip_Amount)
VALUES  (100, 12344345, '01-JAN-2012 09:24:00 PM',500, 'Card','Complete',101,10);
INSERT INTO Customer_Order_t  (Order_Id, Employee_Id,Order_Time,Bill_Amount,Payment_Method,Order_Status,Store_Id, Tip_Amount)
VALUES  (200, 12344345, '02-JAN-2012 10:24:00 PM',100, 'Card','Complete',102,10);
INSERT INTO Customer_Order_t  (Order_Id, Employee_Id,Order_Time,Bill_Amount,Payment_Method,Order_Status,Store_Id, Tip_Amount)
VALUES  (300, 12344334, '03-JAN-2012 11:24:00 AM',100, 'Cash','In_Process',102,10);


INSERT INTO Menu_t(Item_Id, Item_Name,Rate_Per_Plate,Menu_type,Description)
VALUES  (115,'American fried rice',20,'Veg','includes rice and vegetables');
INSERT INTO Menu_t(Item_Id, Item_Name,Rate_Per_Plate,Menu_type,Description)
VALUES  (116,'Chicken bog',30,'Nonveg','includes chicken and vegetables');
INSERT INTO Menu_t(Item_Id, Item_Name,Rate_Per_Plate,Menu_type,Description)
VALUES  (117,'Cheese fries',20,'Veg','includes cheese and potato');


INSERT INTO Item_order_t(Item_Id, Order_Id)
VALUES  (115,100);
INSERT INTO Item_order_t(Item_Id, Order_Id)
VALUES  (116,200);
INSERT INTO Item_order_t(Item_Id, Order_Id)
VALUES  (117,100);





