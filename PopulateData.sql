INSERT INTO Topping VALUES ('1','Pepperoni','1.25','0.2','100','2','2.75','3.5','4.5');
INSERT INTO Topping VALUES ('2','Sausage','1.25','0.15','100','2.5','3','3.5','4.25');
INSERT INTO Topping VALUES ('3','Ham','1.5','0.15','78','2','2.5','3.25','4');
INSERT INTO Topping VALUES ('4','Chicken','1.75','0.25','56','1.5','2','2.25','3');
INSERT INTO Topping VALUES ('5','Green Pepper','0.5','0.02','79','1','1.5','2','2.5');
INSERT INTO Topping VALUES ('6','Onion','0.5','0.02','85','1','1.5','2','2.75');
INSERT INTO Topping VALUES ('7','Roma tomato','0.75','0.03','86','2','3','3.5','4.5');
INSERT INTO Topping VALUES ('8','Mushrooms','0.75','0.1','52','1.5','2','2.5','3');
INSERT INTO Topping VALUES ('9','Black Olives','0.6','0.1','39','0.75','1','1.5','2');
INSERT INTO Topping VALUES ('10','Pineapple','1','0.25','15','1','1.25','1.75','2');
INSERT INTO Topping VALUES ('11','Jalapenos','0.5','0.05','64','0.5','0.75','1.25','1.75');
INSERT INTO Topping VALUES ('12','Banana Peppers','0.5','0.05','36','0.6','1','1.3','1.75');
INSERT INTO Topping VALUES ('13','Regular Cheese','1.5','0.12','250','2','3.5','5','7');
INSERT INTO Topping VALUES ('14','Four Cheese Blend','2','0.15','150','2','3.5','5','7');
INSERT INTO Topping VALUES ('15','Feta Cheese','2','0.18','75','1.75','3','4','5.5');
INSERT INTO Topping VALUES ('16','Goat Cheese','2','0.2','54','1.6','2.75','4','5.5');
INSERT INTO Topping VALUES ('17','Bacon','1.5','0.25','89','1','1.5','2','3');

INSERT INTO Discount VALUES('1','Employee','15', NULL);
INSERT INTO Discount VALUES('2','Lunch Special Medium',NULL, '1');
INSERT INTO Discount VALUES('3','Lunch Special Large',NULL, '2');
INSERT INTO Discount VALUES('4','Specialty Pizza',NULL, '1.5');
INSERT INTO Discount VALUES('5','Gameday special','20', NULL);

INSERT INTO Base_Price VALUES ('1','Small','Thin','3','0.5');
INSERT INTO Base_Price VALUES ('2','Small','Original','3','0.75');
INSERT INTO Base_Price VALUES ('3','Small','Pan','3.5','1');
INSERT INTO Base_Price VALUES ('4','Small','Gluten-Free','4','2');
INSERT INTO Base_Price VALUES ('5','Medium','Thin','5','1');
INSERT INTO Base_Price VALUES ('6','Medium','Original','5','1.5');
INSERT INTO Base_Price VALUES ('7','Medium','Pan','6','2.25');
INSERT INTO Base_Price VALUES ('8','Medium','Gluten-Free','6.25','3');
INSERT INTO Base_Price VALUES ('9','Large','Thin','8','1.25');
INSERT INTO Base_Price VALUES ('10','Large','Original','8','2');
INSERT INTO Base_Price VALUES ('11','Large','Pan','9','3');
INSERT INTO Base_Price VALUES ('12','Large','Gluten-Free','9.5','4');
INSERT INTO Base_Price VALUES ('13','X-Large','Thin','10','2');
INSERT INTO Base_Price VALUES ('14','X-Large','Original','10','3');
INSERT INTO Base_Price VALUES ('15','X-Large','Pan','11.5','4.5');
INSERT INTO Base_Price VALUES ('16','X-Large','Gluten-Free','12.5','6');

-- This is the order 1, customer 1
INSERT INTO Customer VALUES ('1');
INSERT INTO Pizza_Order VALUES ('1','2024-03-05 12:03:00', 'Completed','1');
INSERT INTO Dine_In_Customer VALUES ('1','14');
INSERT INTO Seats VALUES ('1','1');
INSERT INTO Seats VALUES ('1','2');
INSERT INTO Seats VALUES ('1','3');
INSERT INTO Pizza VALUES ('1','13.50','3.68','1','9'); -- Large Thin
INSERT INTO Has_Topping VALUES (TRUE,'1','13'); -- Regular Cheese
INSERT INTO Has_Topping VALUES (FALSE,'1','1'); -- Pepperoni
INSERT INTO Has_Topping VALUES (FALSE,'1','2'); -- Sausage
INSERT INTO Applied_to_Order VALUES ('1','3'); -- Lunch Special Large Discount
-- pizzacount = 1

-- This is the order 2, customer 2
INSERT INTO Customer VALUES ('2');
INSERT INTO Pizza_Order VALUES ('2','2024-03-03 12:05:00', 'Completed','2');
INSERT INTO Dine_In_Customer VALUES ('2','4');
INSERT INTO Seats VALUES ('2','1');
INSERT INTO Pizza VALUES ('2','10.60','3.23','2','7'); -- Medium pan
INSERT INTO Has_Topping VALUES (FALSE,'2','15'); -- feta cheese 
INSERT INTO Has_Topping VALUES (FALSE,'2','9'); -- black olives 
INSERT INTO Has_Topping VALUES (FALSE,'2','7'); -- roma tomatoes 
INSERT INTO Has_Topping VALUES (FALSE,'2','8');-- mushrooms
INSERT INTO Has_Topping VALUES (FALSE,'2','12'); -- banana peppers
INSERT INTO Applied_to_Order VALUES ('2','2'); -- lunch special medium discount
INSERT INTO Applied_to_Pizza VALUES ('2','4'); -- specialty pizza discount
-- pizzacount = 2

-- This is order 3, customer 3
INSERT INTO Customer VALUES ('3');
INSERT INTO Pizza_Order VALUES ('3','2024-03-03 12:05:00', 'Completed','3');
INSERT INTO Dine_In_Customer VALUES ('3','4');
INSERT INTO Seats VALUES ('3','2');
INSERT INTO Pizza VALUES ('3','6.75','1.40','3','2'); -- small original
INSERT INTO Has_Topping VALUES (FALSE,'3','13'); -- regular cheese
INSERT INTO Has_Topping VALUES (FALSE,'3','4'); -- chicken
INSERT INTO Has_Topping VALUES (FALSE,'3','12'); -- banana peppers
-- pizzacount = 3

-- This is order 4, customer 4
INSERT INTO Customer VALUES ('4');
INSERT INTO Pizza_Order VALUES ('4','2024-03-03 21:30:00', 'Completed','4');
INSERT INTO Dine_Out_Customer VALUES ('4','Andrew', 'Wilkes-Krier','740-254-5861');
INSERT INTO Pizza VALUES ('4','10.75','3.30','4','10'); --Large original
INSERT INTO Has_Topping VALUES (FALSE,'4','13'); --cheese 
INSERT INTO Has_Topping VALUES (FALSE,'4','1'); --pepperoni

INSERT INTO Pizza VALUES ('5','10.75','3.30','4','10');
INSERT INTO Has_Topping VALUES (FALSE,'5','13');
INSERT INTO Has_Topping VALUES (FALSE,'5','1');

INSERT INTO Pizza VALUES ('6','10.75','3.30','4','10');
INSERT INTO Has_Topping VALUES (FALSE,'6','13');
INSERT INTO Has_Topping VALUES (FALSE,'6','1');

INSERT INTO Pizza VALUES ('7','10.75','3.30','4','10');
INSERT INTO Has_Topping VALUES (FALSE,'7','13');
INSERT INTO Has_Topping VALUES (FALSE,'7','1');

INSERT INTO Pizza VALUES ('8','10.75','3.30','4','10');
INSERT INTO Has_Topping VALUES (FALSE,'8','13');
INSERT INTO Has_Topping VALUES (FALSE,'8','1');

INSERT INTO Pizza VALUES ('9','10.75','3.30','4','10');
INSERT INTO Has_Topping VALUES (FALSE,'9','13');
INSERT INTO Has_Topping VALUES (FALSE,'9','1');
-- pizzacount = 9

-- This is order 5, customer 4
INSERT INTO Delivery_Customer VALUES ('4','115 Party Blvd', NULL, 'Athens', 'OH', '45701');
INSERT INTO Pizza_Order VALUES ('5','2024-03-05 19:11:00', 'Completed','4');

INSERT INTO Pizza VALUES ('10','17','5.59','5','14'); -- XL original
INSERT INTO Has_Topping VALUES (FALSE,'10','2'); -- sausage
INSERT INTO Has_Topping VALUES (FALSE,'10','1'); -- Pepperoni 
-- 4 type of cheese
INSERT INTO Has_Topping VALUES (FALSE,'10','13');
INSERT INTO Has_Topping VALUES (FALSE,'10','14');
INSERT INTO Has_Topping VALUES (FALSE,'10','15');
INSERT INTO Has_Topping VALUES (FALSE,'10','16');

INSERT INTO Pizza VALUES ('11','14.50','5.59','5','14'); -- XL original
INSERT INTO Has_Topping VALUES (TRUE,'11','3'); --  ham
INSERT INTO Has_Topping VALUES (TRUE,'11','10'); -- Pineapple
-- 4 type of cheese
INSERT INTO Has_Topping VALUES (FALSE,'11','13');
INSERT INTO Has_Topping VALUES (FALSE,'11','14');
INSERT INTO Has_Topping VALUES (FALSE,'11','15');
INSERT INTO Has_Topping VALUES (FALSE,'11','16');

INSERT INTO Applied_to_Pizza VALUES ('11','4'); -- specialty pizza discount

INSERT INTO Pizza VALUES ('12','14.00','5.68','5','14'); -- XL original
INSERT INTO Has_Topping VALUES (FALSE,'12','17'); -- Bacon
INSERT INTO Has_Topping VALUES (FALSE,'12','11'); -- Jalapeno 
-- 4 type of cheese
INSERT INTO Has_Topping VALUES (FALSE,'12','13');
INSERT INTO Has_Topping VALUES (FALSE,'12','14');
INSERT INTO Has_Topping VALUES (FALSE,'12','15');
INSERT INTO Has_Topping VALUES (FALSE,'12','16');

INSERT INTO Applied_to_Order VALUES ('5','5');
-- pizzacount = 12

-- This is order 6, customer 5
INSERT INTO Customer VALUES ('5');
INSERT INTO Pizza_Order VALUES ('6','2024-03-02 17:30:00', 'Completed','5');
INSERT INTO Dine_Out_Customer VALUES ('5','Matt', 'Engers','740-474-9953');

INSERT INTO Pizza VALUES ('13','16.85','7.85','6','16'); --XL Gluten Free
INSERT INTO Has_Topping VALUES (FALSE,'13','5'); --green peper 
INSERT INTO Has_Topping VALUES (FALSE,'13','6'); --onion
INSERT INTO Has_Topping VALUES (FALSE,'13','7'); -- roma tomatoes
INSERT INTO Has_Topping VALUES (FALSE,'13','8'); -- mushroom
INSERT INTO Has_Topping VALUES (FALSE,'13','9'); -- black olives
INSERT INTO Has_Topping VALUES (FALSE,'13','16'); -- goat Cheese
INSERT INTO Applied_to_Pizza VALUES ('11','4'); -- specialty pizza discount
-- pizzacount = 13

-- This is order 7, customer 6
INSERT INTO Customer VALUES ('6');
INSERT INTO Dine_Out_Customer VALUES ('6','Frank', 'Turner','740-232-8944');
INSERT INTO Delivery_Customer VALUES ('6','6745 Wessex St', NULL, 'Athens', 'OH', '45701');
INSERT INTO Pizza_Order VALUES ('7','2024-03-02 18:17:00', 'Completed','6');

INSERT INTO Pizza VALUES ('14','13.25','3.20','7','9'); -- Large Thin
INSERT INTO Has_Topping VALUES (FALSE,'14','4'); -- chicken
INSERT INTO Has_Topping VALUES (FALSE,'14','5'); --green peper 
INSERT INTO Has_Topping VALUES (FALSE,'14','6'); --onion
INSERT INTO Has_Topping VALUES (FALSE,'14','8'); -- mushroom
-- 4 type of cheese
INSERT INTO Has_Topping VALUES (FALSE,'14','13');
INSERT INTO Has_Topping VALUES (FALSE,'14','14');
INSERT INTO Has_Topping VALUES (FALSE,'14','15');
INSERT INTO Has_Topping VALUES (FALSE,'14','16');
-- pizzacount = 14

-- This is order 8, customer 7
INSERT INTO Customer VALUES ('7');
INSERT INTO Dine_Out_Customer VALUES ('7','Milo', 'Auckerman','740-878-5679');
INSERT INTO Delivery_Customer VALUES ('7','8879 Suburban Home', NULL, 'Athens', 'OH', '45701');
INSERT INTO Pizza_Order VALUES ('8','2024-03-06 20:32:00', 'Completed','7');

INSERT INTO Pizza VALUES ('15','12','3.75','8','9'); -- Large Thin
-- 4 type of cheese
INSERT INTO Has_Topping VALUES (TRUE,'15','13');
INSERT INTO Has_Topping VALUES (TRUE,'15','14');
INSERT INTO Has_Topping VALUES (TRUE,'15','15');
INSERT INTO Has_Topping VALUES (TRUE,'15','16'); 

INSERT INTO Pizza VALUES ('16','12','2.55','8','9'); -- Large Thin
INSERT INTO Has_Topping VALUES (FALSE,'16','13'); -- Regular Cheese
INSERT INTO Has_Topping VALUES (TRUE,'16','1'); -- Pepperoni
INSERT INTO Applied_to_Order VALUES ('8','1'); -- employee discount
-- pizzacount = 16