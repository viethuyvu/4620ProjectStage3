CREATE TABLE Base_Price (
	ID INT PRIMARY KEY,
	Price DECIMAL(10,2),
	Size VARCHAR(20),
	Crust_Type VARCHAR(20),
	Cost DECIMAL(10,2)
);

CREATE TABLE Customer (
	ID INT PRIMARY KEY
);

CREATE TABLE Pizza_Order(
	ID INT PRIMARY KEY,
	Order_Time DATETIME,
	Order_status VARCHAR(20),
	FOREIGN KEY (Customer_ID) REFERENCES Customer(ID)
);

CREATE TABLE Pizza (
	ID INT PRIMARY KEY,
	Price DECIMAL(10,2),
	Cost DECIMAL(10,2),
	FOREIGN KEY (Order_ID) REFERENCES Pizza_Order(ID),
	FOREIGN KEY (Base_Price_ID) REFERENCES Base_Price (ID)
);

CREATE TABLE Topping (
	ID INT PRIMARY KEY,
  Price DECIMAL(10,2),
  Cost DECIMAL(10,2),
  Topping_Name VARCHAR(50),
  Inventory INT,
  S_Qty DECIMAL(10,2),
  M_Qty DECIMAL(10,2),
  L_Qty DECIMAL(10,2),
  X_Qty DECIMAL(10,2)
);

CREATE TABLE Discount (
  ID INT PRIMARY KEY,
  Dollar_Off DECIMAL(10,2),
  Percent_Off DECIMAL(5,2),
  Discount_Name VARCHAR(50)
);

CREATE TABLE Applied_to_Order (
  Order_ID INT,
  Discount_ID INT,
  PRIMARY KEY (Order_ID, Discount_ID),
  FOREIGN KEY (Order_ID) REFERENCES Pizza_Order(ID),
  FOREIGN KEY (Discount_ID) REFERENCES Discount(ID)
);

CREATE TABLE Applied_to_Pizza (
  Pizza_ID INT,
  Discount_ID INT,
  PRIMARY KEY (Pizza_ID, Discount_ID),
  FOREIGN KEY (Pizza_ID) REFERENCES Pizza(ID),
  FOREIGN KEY (Discount_ID) REFERENCES Discount(ID)
);

CREATE TABLE Dine_In_Customer (
  Table_Num INT,
  Seat_Num INT,
  Customer_ID INT,
  FOREIGN KEY (Customer_ID) REFERENCES Customer(ID)
);

CREATE TABLE Dine_Out_Customer (
  ID INT PRIMARY KEY,
  Customer_Name VARCHAR(50),
  Phone_Num VARCHAR(20),
  Customer_ID INT,
  FOREIGN KEY (Customer_ID) REFERENCES Customer(ID)
);

CREATE TABLE Delivery_Customer (
	Addr_Street VARCHAR(100),
	Addr_City VARCHAR(50),
	Addr_State VARCHAR(2),
	Addr_Zip VARCHAR(10),
	Addr_Apt VARCHAR(10),
	DineOut_ID INT,
	FOREIGN KEY (DineOut_ID) REFERENCES Dine_Out_Customer(ID)
);

CREATE TABLE Has_Topping(
	Extra BOOLEAN,
    Pizza_ID INT,
    Topping_ID INT,
    PRIMARY KEY (Pizza_ID, Topping_ID),
	FOREIGN KEY (Pizza_ID) REFERENCES Pizza(ID),
	FOREIGN KEY (Topping_ID) REFERENCES Topping(ID)
);
    