CREATE TABLE Base_Price (
	ID INT PRIMARY KEY ,
	PSize VARCHAR(20) NOT NULL,
	Crust_Type VARCHAR(20) NOT NULL,
	Price DECIMAL(10,2) NOT NULL,
	Cost DECIMAL(10,2) NOT NULL
);

CREATE TABLE Customer (
	ID INT PRIMARY KEY
);

CREATE TABLE Pizza_Order(
	ID INT PRIMARY KEY,
	Order_Time DATETIME NOT NULL,
	Order_status VARCHAR(20) NOT NULL,
	FOREIGN KEY (Customer_ID) REFERENCES Customer(ID)
);

CREATE TABLE Pizza (
	ID INT PRIMARY KEY,
	Price DECIMAL(10,2) NOT NULL,
	Cost DECIMAL(10,2) NOT NULL,
	FOREIGN KEY (Order_ID) REFERENCES Pizza_Order(ID),
	FOREIGN KEY (Base_Price_ID) REFERENCES Base_Price (ID)
);

CREATE TABLE Topping (
	ID INT PRIMARY KEY,
	Topping_Name VARCHAR(50) NOT NULL,
	Price DECIMAL(10,2) NOT NULL,
	Cost DECIMAL(10,2) NOT NULL,
	Inventory INT NOT NULL,
	S_Qty DECIMAL(10,2) NOT NULL,
	M_Qty DECIMAL(10,2) NOT NULL,
	L_Qty DECIMAL(10,2) NOT NULL,
	X_Qty DECIMAL(10,2) NOT NULL
);

CREATE TABLE Discount (
	ID INT PRIMARY KEY,
	Discount_Name VARCHAR(50) NOT NULL
	Percent_Off DECIMAL(5,2),
	Dollar_Off DECIMAL(10,2),
);

CREATE TABLE Applied_to_Order (
	Order_ID INT NOT NULL,
	Discount_ID INT NOT NULL,
	PRIMARY KEY (Order_ID, Discount_ID),
	FOREIGN KEY (Order_ID) REFERENCES Pizza_Order(ID),
	FOREIGN KEY (Discount_ID) REFERENCES Discount(ID)
);

CREATE TABLE Applied_to_Pizza (
	Pizza_ID INT NOT NULL,
	Discount_ID INT NOT NULL,
	PRIMARY KEY (Pizza_ID, Discount_ID),
	FOREIGN KEY (Pizza_ID) REFERENCES Pizza(ID),
	FOREIGN KEY (Discount_ID) REFERENCES Discount(ID)
);

CREATE TABLE Dine_In_Customer (
	Table_Num INT NOT NULL,
	Seat_Num INT NOT NULL,
	Customer_ID INT NOT NULL,
	FOREIGN KEY (Customer_ID) REFERENCES Customer(ID)
);

CREATE TABLE Dine_Out_Customer (
	ID INT PRIMARY KEY,
	Customer_Name VARCHAR(50) NOT NULL,
	Phone_Num VARCHAR(20) NOT NULL,
	Customer_ID INT NOT NULL,
	FOREIGN KEY (Customer_ID) REFERENCES Customer(ID)
);

CREATE TABLE Delivery_Customer (
	Addr_Street VARCHAR(100) NOT NULL,
	Addr_City VARCHAR(50) NOT NULL,
	Addr_State VARCHAR(2) NOT NULL,
	Addr_Zip VARCHAR(10) NOT NULL,
	Addr_Apt VARCHAR(10) NOT NULL,
	DineOut_ID INT NOT NULL,
	FOREIGN KEY (DineOut_ID) REFERENCES Dine_Out_Customer(ID)
);

CREATE TABLE Has_Topping(
	Extra BOOLEAN NOT NULL,
    Pizza_ID INT NOT NULL,
    Topping_ID INT NOT NULL,
    PRIMARY KEY (Pizza_ID, Topping_ID),
	FOREIGN KEY (Pizza_ID) REFERENCES Pizza(ID),
	FOREIGN KEY (Topping_ID) REFERENCES Topping(ID)
);
    