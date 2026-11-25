--Skeleton Candy Part 1 - extract from 2022, 2023, 2024 tables and put into stagingTable
--Students, see notes below where it says --you need to fill this in here
--Create the staging table
DROP TABLE IF EXISTS stagingTable;
CREATE TABLE stagingTable (
    yearInt INT(4),
    monthInt INT(2),
    state CHAR(2),
    country CHAR(3),
    region VARCHAR(25),
    customer_id INT(5),
    Product_Name VARCHAR(25),
    unitPrice INT(5),
    quantityDiscount INT(5),
    quantity INT(6),
    orderTotal INT(6)
);


--Insert 2022 Data
INSERT INTO stagingTable(
    "monthInt", 
    "state", 
    "country", 
    "region", 
    "Product_Name", 
    "unitPrice", 
    "quantity", 
    "orderTotal")

SELECT "Month", 
       "State", 
       "Country", 
       "Region", 
       "Product",
       "Per_Unit_Price", 
       "Quantity", 
       "Order_Total" 
FROM pd2022
;

UPDATE stagingTable SET yearInt=2022;

--Insert 2023 Data
INSERT INTO stagingTable(
    "monthInt", 
    "region", 
    "customer_id",    
    "Product_Name", 
    "unitPrice", 
    "quantity", 
    "orderTotal")

SELECT "Month",
       "Region",
       "Customer_ID",
       "Product",
       "Per_Unit_Price",
       "Quantity_1" + "Quantity_2",
       "Per_Unit_Price" * ("Quantity_1" + "Quantity_2")
FROM pd2023
;

UPDATE stagingTable SET yearInt=2023 WHERE yearInt ISNULL;


--Insert 2024 Data
INSERT INTO stagingTable(
    "monthInt",
    "country",
    "region",
    "state",
    "Product_Name",
    "unitPrice",
    "quantity",
    "quantityDiscount",
    "orderTotal"
)
SELECT "Month",
       "Country",
       "Region",
       "State",
       "Product",
       "Per_Unit_Price",
       "Quantity",
       "QuantityDiscount",
       "Order_Subtotal" - "QuantityDiscount"
FROM pd2024
;

UPDATE stagingTable SET yearInt = 2024 WHERE yearInt ISNULL;


SELECT * FROM stagingTable;

