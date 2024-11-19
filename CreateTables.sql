CREATE TABLE Base_Price (
  ID INT PRIMARY KEY,
  Price_Custom DECIMAL(10,2),
  Size VARCHAR(20),
  Crust_Type VARCHAR(20),
  Price_Owner VARCHAR(50)
);

CREATE TABLE Pizza (
  ID INT PRIMARY KEY,
  Price_Custom DECIMAL(10,2),
  Price_Owner VARCHAR(50)
);

CREATE TABLE Topping (
  ID INT PRIMARY KEY,
  Price_Custom DECIMAL(10,2),
  Price_Owner VARCHAR(50),
  Name VARCHAR(50),
  Inventory INT,
  S_Qty INT,
  M_Qty INT,
  L_Qty INT
);

CREATE TABLE Order_ (
  ID INT PRIMARY KEY,
  Base_Price_ID INT,
  Pizza_ID INT,
  Extra INT,
  Topping_ID INT,
  Order_Time DATETIME,
  Status VARCHAR(20),
  Customer_ID INT,
  FOREIGN KEY (Base_Price_ID) REFERENCES Base_Price(ID),
  FOREIGN KEY (Pizza_ID) REFERENCES Pizza(ID),
  FOREIGN KEY (Topping_ID) REFERENCES Topping(ID)
);

CREATE TABLE Discount (
  ID INT PRIMARY KEY,
  Discount_Amount DECIMAL(10,2),
  Discount_Percent DECIMAL(5,2),
  Name VARCHAR(50)
);

CREATE TABLE Applied_to_Order (
  Order_ID INT,
  Discount_ID INT,
  PRIMARY KEY (Order_ID, Discount_ID),
  FOREIGN KEY (Order_ID) REFERENCES Order_(ID),
  FOREIGN KEY (Discount_ID) REFERENCES Discount(ID)
);

CREATE TABLE Applied_to_Pizza (
  Pizza_ID INT,
  Discount_ID INT,
  PRIMARY KEY (Pizza_ID, Discount_ID),
  FOREIGN KEY (Pizza_ID) REFERENCES Pizza(ID),
  FOREIGN KEY (Discount_ID) REFERENCES Discount(ID)
);

CREATE TABLE Customer (
  ID INT PRIMARY KEY
);

CREATE TABLE Dine_In_Customer (
  ID INT PRIMARY KEY,
  Table_Num INT,
  Seat_Num INT,
  Customer_ID INT,
  FOREIGN KEY (Customer_ID) REFERENCES Customer(ID)
);

CREATE TABLE Dine_Out_Customer (
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Phone_Num VARCHAR(20),
  Customer_ID INT,
  FOREIGN KEY (Customer_ID) REFERENCES Customer(ID)
);

CREATE TABLE Delivery_Customer (
  ID INT PRIMARY KEY,
  Addr_Street VARCHAR(100),
  Addr_City VARCHAR(50),
  Addr_State VARCHAR(2),
  Addr_Zip VARCHAR(10),
  Addr_Apt VARCHAR(10),
  Customer_ID INT,
  FOREIGN KEY (Customer_ID) REFERENCES Customer(ID)
);

CREATE TABLE Pick_Up_Customer (
  ID INT PRIMARY KEY,
  Customer_ID INT,
  FOREIGN KEY (Customer_ID) REFERENCES Customer(ID)
);