select * from Customers
select * from Orders
select * from Products

--1) Write an SQL query to find the names of customers who have placed an order.
select distinct c.CustomerName from Customers c
inner join Orders o
on c.CustomerID = o.CustomerID

--2) Find the list of customers who have not placed any orders.
select c.CustomerName from Customers c
left join Orders o
on c.CustomerID = o.CustomerID
where o.CustomerID is null

--3) List all orders along with the product name and price.
select o.OrderID,p.ProductName,p.Price from Orders o
left join Products p
on o.ProductID = p.ProductID
order by p.Price desc

--4) Find the names of customers and their orders, including customers who haven't placed any orders.
select distinct CustomerName,OrderID from Customers c 
left join Orders o on o.CustomerID = c.CustomerID

--5) Retrieve a list of products that have never been ordered.
select * from Orders o
left join Products p
on o.ProductID=p.ProductID
where o.OrderDate is null

--6) Find the total number of orders placed by each customer.
select c.CustomerName, count(o.OrderID) [Number of orders] from Customers c 
left join Orders o on c.CustomerID = o.CustomerID
group by c.CustomerName
order by count(o.OrderID) desc

--OR (exculuding the customer who did not place any order) 
select c.CustomerName, count(o.OrderID) [Number of orders] from Customers c 
inner join Orders o on c.CustomerID = o.CustomerID
group by c.CustomerName
order by count(o.OrderID) desc

--7) Display the customers, the products they've ordered, and the order date. Include customers who haven't placed any orders.

select distinct c.CustomerName,p.ProductName,o.OrderDate from Customers c 
left join Orders o 
on c.CustomerID=o.CustomerID left join Products p 
on o.ProductID=p.ProductID
order by o.OrderDate desc