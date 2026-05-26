select * from Customers
select * from Orders
select * from Products

--1) Identify customers who lived in the same country
/*Ans) 'Self join' has been used on Customers table to compare each customer with every other customer 
in the same country */ 
SELECT distinct
    c1.CustomerName AS Customer1,
    c2.CustomerName AS Customer2,
    c1.Country
FROM Customers c1
JOIN Customers c2
    ON c1.Country = c2.Country
   AND c1.CustomerID < c2.CustomerID
ORDER BY c1.Country, c1.CustomerName, c2.CustomerName;

--2) Find the name of the customer who spent the most on their orders
/*Ans) simple JOIN is used from Orders to Products, then group by customer and sum Price. 
*/
SELECT
    c.CustomerName,
    SUM(p.Price) AS TotalSpent
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY c.CustomerName 
ORDER BY TotalSpent DESC
--3) Find the customers who order more then one type of products 
/*And) Simple JOIN used with plus COUNT(DISTINCT ProductID) to find customers with multiple product types. 
This is better than checking raw orders because it avoids counting repeated purchases of the same product as different types.
*/
SELECT 
    c.CustomerName,
    COUNT(DISTINCT o.ProductID) AS ProductTypesOrdered
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
HAVING COUNT(DISTINCT o.ProductID) > 1
ORDER BY c.CustomerName
--4) List all products with their corresponding orders, using Right join, including the order the have never been ordered
/*Ans) Right join is used to perform task as a requirement */
SELECT 
    p.ProductID,
    p.ProductName,
    p.Price,
    o.OrderID,
    o.CustomerID,
    o.OrderDate
FROM Orders o
Right JOIN Products p
    ON o.ProductID = p.ProductID
ORDER BY p.ProductID, o.OrderID;

--5) Retrive all orders detail along with product name placed by customers from 'USA' 
/* Ans) Joined Orders to Customers & Products and filter by Country = 'USA' to generate a desired result. */
SELECT 
    o.OrderID,
    c.CustomerName,
    c.Country,
    o.OrderDate,
    o.ProductID,
    P.ProductName
FROM Orders o
JOIN Customers c
    ON o.CustomerID = c.CustomerID
JOIN Products P
    ON P.ProductID=O.ProductID
WHERE c.Country = 'USA' 
ORDER BY o.OrderDate, o.OrderID;

--6) Find the name of the customers who ordered product price orver £850
/* Ans) Simply joined Orders with Products, filter Price > 850, and return distinct customer names.*/

SELECT DISTINCT
    c.CustomerName,
    p.ProductName,
    p.Price
    
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON o.ProductID = p.ProductID
WHERE p.Price > 850
ORDER BY c.CustomerName;

--7) Find the customer who order same product more then once 
/*Ans) Simply Joined Order with Customers and Products and Count all. 
Finllay Used GROUP BY CustomerID, ProductID and HAVING COUNT(*) > 1 */

SELECT 
    c.CustomerName,
    P.Price,
    p.ProductName,
    COUNT(*) AS TimesOrdered
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY c.CustomerID, c.CustomerName, p.ProductID, p.ProductName, p.Price
HAVING COUNT(*) > 1
ORDER BY c.CustomerName, p.ProductName;