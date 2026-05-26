select * from Orders
select * from Customers
Select * from Products
------------------------------------------------------------
-- 1. TOTAL REVENUE
------------------------------------------------------------
SELECT 
    SUM(p.Price) AS Total_Revenue
FROM Orders o
JOIN Products p 
ON o.ProductID = p.ProductID;


------------------------------------------------------------
-- 2. TOTAL NUMBER OF ORDERS
------------------------------------------------------------
SELECT 
    COUNT(OrderID) AS Total_Orders
FROM Orders;


------------------------------------------------------------
-- 3. AVERAGE ORDER VALUE (AOV)
------------------------------------------------------------
SELECT 
    avg(p.Price) AS Average_Order_Value
FROM Orders o
JOIN Products p 
ON o.ProductID = p.ProductID;


------------------------------------------------------------
-- 4. TOP-SELLING PRODUCTS
------------------------------------------------------------
SELECT 
    p.productid,
    p.productname,
    SUM(p.price) AS product_revenue,
    COUNT(*) AS units_sold
FROM Orders o
JOIN Products p
    ON o.productid = p.productid
GROUP BY p.productid, p.productname
ORDER BY product_revenue DESC;
------------------------------------------------------------
-- 5. REPEAT CUSTOMERS
------------------------------------------------------------
SELECT 
    c.CustomerName,
    COUNT(o.OrderID) AS Total_Orders
FROM Customers c
JOIN Orders o 
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
HAVING COUNT(o.OrderID) > 1
ORDER BY Total_Orders DESC;
