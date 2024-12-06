-- NOTE HERE USING POSTGRE

-- 1
SELECT 
    Topping.Topping_Name,
    Topping.Inventory,
    ROUND(Topping.Inventory / Topping.X_Qty, 2) AS X_Large_Pizzas_That_Can_Be_Made
FROM Topping
ORDER BY Topping.Topping_Name;

-- 2
SELECT 
    DATE(Order_Time) AS Order_Date,
    ROUND(SUM(Pizza.Price), 2) AS Total_Revenue,
    ROUND(SUM(Pizza.Cost), 2) AS Total_Expenses,
    ROUND(SUM(Pizza.Price) - SUM(Pizza.Cost), 2) AS Total_Profit
FROM Pizza_Order
JOIN Pizza ON Pizza_Order.ID = Pizza.Order_ID
GROUP BY Order_Date
ORDER BY Order_Date;

-- 3
SELECT 
    CONCAT(Dine_Out_Customer.Customer_FName, ' ', Dine_Out_Customer.Customer_LName) AS Customer_Name,
    COUNT(Pizza_Order.ID) AS Total_Orders,
    ROUND(AVG(Pizza.Price), 2) AS Avg_Order_Price,
    ROUND(SUM(Pizza.Price), 2) AS Total_Order_Price,
    ROUND(MAX(Pizza.Price), 2) AS Max_Order_Price,
    ROUND(MIN(Pizza.Price), 2) AS Min_Order_Price
FROM Dine_Out_Customer
JOIN Pizza_Order ON Dine_Out_Customer.Customer_ID = Pizza_Order.Customer_ID
JOIN Pizza ON Pizza_Order.ID = Pizza.Order_ID
GROUP BY Dine_Out_Customer.Customer_FName, Dine_Out_Customer.Customer_LName;

-- 4
SELECT 
    ROUND(AVG(Seats.Seat_number),0) AS Avg_Seats_Per_Order,
    ROUND(AVG(Pizza.Price), 2) AS Avg_Order_Price,
    ROUND(SUM(Pizza.Price), 2) AS Total_Order_Price,
    ROUND(MAX(Pizza.Price), 2) AS Max_Order_Price,
    ROUND(MIN(Pizza.Price), 2) AS Min_Order_Price
FROM Dine_In_Customer
JOIN Pizza_Order ON Dine_In_Customer.Customer_ID = Pizza_Order.Customer_ID
JOIN Pizza ON Pizza_Order.ID = Pizza.Order_ID
JOIN Seats ON Dine_In_Customer.Customer_ID = Seats.DineIn_ID
GROUP BY Pizza_Order.ID;

-- 5
SELECT 
    Base_Price.PSize AS Pizza_Size,
    Base_Price.Crust_Type,
    Topping.Topping_Name,
    Has_Topping.Extra
FROM Pizza_Order
JOIN Pizza ON Pizza_Order.ID = Pizza.Order_ID
JOIN Base_Price ON Pizza.Base_Price_ID = Base_Price.ID
JOIN Has_Topping ON Pizza.ID = Has_Topping.Pizza_ID
JOIN Topping ON Has_Topping.Topping_ID = Topping.ID
WHERE Pizza_Order.Order_Time = '2024-03-05 19:11:00'
AND Pizza_Order.Customer_ID = (SELECT Customer_ID FROM Dine_Out_Customer WHERE Customer_FName = 'Andrew' AND Customer_LName = 'Wilkes-Krier')
ORDER BY Pizza_Order.ID, Pizza.ID;

-- 6
SELECT 
    DATE(Pizza_Order.Order_Time) AS Order_Date,
    CASE
        WHEN Dine_In_Customer.Customer_ID IS NOT NULL THEN 'Dine-In'
        WHEN Delivery_Customer.DineOut_ID IS NOT NULL THEN 'Delivery'
        ELSE 'Pick-Up'
    END AS Order_Type,
    COUNT(Pizza_Order.ID) AS Total_Orders,
    COUNT(Pizza.ID) AS Total_Pizzas, -- Count pizzas directly
    ROUND(SUM(Pizza.Price), 2) AS Total_Order_Price
FROM Pizza_Order
LEFT JOIN Dine_In_Customer ON Pizza_Order.Customer_ID = Dine_In_Customer.Customer_ID
LEFT JOIN Delivery_Customer ON Pizza_Order.Customer_ID = Delivery_Customer.DineOut_ID
JOIN Pizza ON Pizza_Order.ID = Pizza.Order_ID
GROUP BY Order_Date, Order_Type
ORDER BY Order_Date, Order_Type;

-- 7
SELECT 
    Discount.Discount_Name,
    COUNT(Applied_to_Order.Order_ID) AS Discount_Count,
    ROUND(SUM(CASE 
        WHEN Applied_to_Order.Discount_ID = Discount.ID AND Discount.Percent_Off IS NOT NULL THEN 
            Discount.Percent_Off * Pizza.Price / 100
        WHEN Applied_to_Order.Discount_ID = Discount.ID AND Discount.Dollar_Off IS NOT NULL THEN 
            Discount.Dollar_Off
        ELSE 0 
    END), 2) AS Total_Money_Saved
FROM Discount
LEFT JOIN Applied_to_Order ON Discount.ID = Applied_to_Order.Discount_ID
LEFT JOIN Pizza_Order ON Applied_to_Order.Order_ID = Pizza_Order.ID
LEFT JOIN Pizza ON Pizza_Order.ID = Pizza.Order_ID
GROUP BY Discount.Discount_Name;

-- 8
SELECT 
    Topping.Topping_Name,
    SUM(CASE 
        WHEN Has_Topping.Extra THEN Pizza.Price
        ELSE 0 
    END) AS Total_Amount_Used
FROM Pizza_Order
JOIN Pizza ON Pizza_Order.ID = Pizza.Order_ID
JOIN Has_Topping ON Pizza.ID = Has_Topping.Pizza_ID
JOIN Topping ON Has_Topping.Topping_ID = Topping.ID
WHERE DATE(Pizza_Order.Order_Time) = '2024-03-03'
GROUP BY Topping.Topping_Name
ORDER BY Topping.Topping_Name;


-- 9
SELECT 
    Base_Price.PSize AS Pizza_Size,
    COUNT(Pizza.ID) AS Total_Pizzas_Ordered,
    ROUND(AVG(Pizza.Price), 2) AS Avg_Pizza_Price,
    ROUND(AVG(Pizza.Cost), 2) AS Avg_Pizza_Cost
FROM Pizza
JOIN Base_Price ON Pizza.Base_Price_ID = Base_Price.ID
GROUP BY Base_Price.PSize;

-- 10
SELECT 
    Base_Price.Crust_Type,
    COUNT(Pizza.ID) AS Total_Pizzas_Ordered,
    ROUND(AVG(Pizza.Price), 2) AS Avg_Pizza_Price,
    ROUND(AVG(Pizza.Cost), 2) AS Avg_Pizza_Cost
FROM Pizza
JOIN Base_Price ON Pizza.Base_Price_ID = Base_Price.ID
GROUP BY Base_Price.Crust_Type;
