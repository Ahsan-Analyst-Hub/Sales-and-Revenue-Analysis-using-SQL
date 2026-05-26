
------------------------------------------------------------
-- 6. CUSTOMER LIFETIME VALUE (CLV)
------------------------------------------------------------
SELECT 
    c.CustomerName,
    SUM( p.Price) AS Customer_Lifetime_Value
FROM Customers c
JOIN Orders o 
ON c.CustomerID = o.CustomerID
JOIN Products p 
ON o.ProductID = p.ProductID
GROUP BY c.CustomerName
ORDER BY Customer_Lifetime_Value DESC;


------------------------------------------------------------
-- 7. REVENUE BY COUNTRY
------------------------------------------------------------
SELECT 
    c.Country,
    SUM(p.Price) AS Revenue
FROM Customers c
JOIN Orders o 
ON c.CustomerID = o.CustomerID
JOIN Products p 
ON o.ProductID = p.ProductID
GROUP BY c.Country
ORDER BY Revenue DESC;


------------------------------------------------------------
-- 8. PRODUCTS THAT GENERATE MOST REVENUE 
------------------------------------------------------------
SELECT
    p.productid,
    p.productname,
    p.price,
    COUNT(*) AS units_sold,
    SUM(p.price) AS total_revenue
FROM Orders o
JOIN Products p
    ON o.productid = p.productid
GROUP BY p.productid, p.productname, p.price
ORDER BY total_revenue DESC;

------------------------------------------------------------
-- 9. MULTI-PRODUCT CUSTOMERS
------------------------------------------------------------
SELECT 
    C.CustomerID,
    c.CustomerName,
    COUNT(DISTINCT o.ProductID) AS Products_Purchased
FROM Customers c
JOIN Orders o 
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName, C.CustomerID
HAVING COUNT(DISTINCT o.ProductID) > 1
ORDER BY Products_Purchased DESC;


------------------------------------------------------------
-- 10. SALES TREND OVER TIME
------------------------------------------------------------
SELECT 
    OrderDate,
    SUM(p.Price) AS Daily_Sales
FROM Orders o
JOIN Products p 
ON o.ProductID = p.ProductID
GROUP BY OrderDate
ORDER BY OrderDate;

