/* SQL Basics with NorthWind Database */

-- Query showing CategoryName and Description from categories table sorted by CategoryName
SELECT CategoryName,Description
FROM categories
ORDER BY CategoryName;

-- Query showing ContactName, CompanyName, ContactTitle and Phone from the customers table sorted by Phone.
SELECT ContactName,CompanyName,ContactTitle,Phone
FROM Customers
ORDER BY Phone;

-- Query showing FirstName and LastName in Upper Case from employees table sorted by their HireDate in descending order.
SELECT UPPER(FirstName) AS FirstName, UPPER(LastName) AS LastName, HireDate
FROM employees
ORDER BY HireDate DESC;

-- Query showing top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table sorted by Freight in descending order.
SELECT OrderID,OrderDate,ShippedDate,CustomerID,Freight
FROM Orders
ORDER BY Freight DESC
LIMIT 10
;

-- Query showing all the CustomerID in lowercase alaised as ID from the customers table.
SELECT LOWER(CustomerID) as ID
FROM Customers;

-- Query showing CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by the Country in descending order then by CompanyName in ascending order.
SELECT CompanyName,Fax,Phone,Country,HomePage
FROM Suppliers
ORDER BY Country DESC,CompanyName ASC;

-- Query showing CompanyName, ContactName of all customers from ‘Buenos Aires' only.
SELECT CompanyName, ContactName, City
FROM customers
WHERE city="Buenos Aires";

-- Query showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock.
SELECT ProductName,UnitPrice, QuantityPerUnit
FROM products
WHERE UnitsInStock = 0;

-- Query showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain.
SELECT ContactName,Address, City
FROM customers
WHERE city != "Germany" OR " MEXICO" OR "SPAIN";

-- Query showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21st May 1996.
SELECT OrderDate,ShippedDate,CustomerID,Freight
FROM orders
WHERE OrderDate= '1996-05-21';

-- Query showing FirstName, LastName, Country from the employees not from United States.
SELECT FirstName,LastName,Country
FROM employees
WHERE Country != 'USA';

-- Query showing the EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from all orders shipped later than the required date.
SELECT EmployeeID,OrderID,CustomerID,RequiredDate,ShippedDate
FROM orders
WHERE ShippedDate>RequiredDate;

-- Query showing the City, CompanyName, ContactName of customers from cities starting with A or B.
SELECT City,CompanyName,ContactName
FROM customers
WHERE city like 'A%' OR city like 'B%';

-- Query showing all the even numbers of OrderID from the orders table.
SELECT OrderID
FROM orders
WHERE (OrderID % 2) =0;

-- Query showing all the orders where the freight cost more than $500.
SELECT*
FROM orders
WHERE Freight > 500
;

-- Query showing the CompanyName, ContactName number of all customer that have no fax number.
SELECT CompanyName,ContactName,ContactTitle,Fax
FROM customers
where Fax IS NULL;

-- Query showing the FirstName, LastName of all employees that do not report to anybody.
SELECT FirstName,LastName
FROM employees
WHERE ReportsTo IS NULL;

-- Query showing all the odd numbers of OrderID from the orders table.
SELECT OrderID
FROM Orders
WHERE MOD(OrderID,2)!= 0;

-- Query showing the CompanyName, ContactName, Fax of all customers that do not have Fax number and sorted by ContactName.
SELECT CompanyName, ContactName, Fax
FROM customers
WHERE FAX is NULL
ORDER BY ContactName;

-- Query showing the City, CompanyName, ContactName of customers from cities that has letter L in the name sorted by ContactName
SELECT CompanyName, ContactName, City
FROM customers
WHERE city like '%l%'
ORDER BY ContactName;

-- Query showing the FirstName, LastName, BirthDate of employees born in the 1950s.
SELECT FirstName, LastName, BirthDate
FROM employees
WHERE BirthDate > '1950-01-01' AND BirthDate <'1950-12-31'
;

-- Query showing the FirstName, LastName, the year of BirthDate renamed as BirthYear from the employees table.
-- We can use extract function as well 
SELECT FirstName, LastName, substring(Birthdate,1,4) AS BirthYear
FROM employees
;

-- Query showing OrderID, total number of Order ID as NumberofOrders from the orderdetails table grouped by OrderID and sorted by NumberofOrders in descending order
SELECT OrderID, count(OrderID) as NumberofOrders
FROM northwind.`order details`
GROUP BY OrderID
ORDER BY NumberofOrders DESC ;

-- Query showing the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids, Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID
select suppliers.SupplierID, ProductName, CompanyName
from suppliers 
join products
on suppliers.SupplierID=products.SupplierID
Where suppliers.CompanyName IN ('Exotic Liquids','Specialty Biscuits,Ltd.','Escargots Nouveaux')
order by suppliers.SupplierID
;

-- Query showing the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all orders with ShipPostalCode beginning with "98124"
select ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress 
from orders
Where ShipPostalCode Like '98124%'
;

-- Query showing the ContactName, ContactTitle, CompanyName of customers that the has no "Sales" in their ContactTitle
select ContactName, ContactTitle, CompanyName
from customers
Where ContactTitle not like '%sales%'
;

-- Query showing the LastName, FirstName, City of employees in cities other than "Seattle";
select LastName, FirstName, City
from employees
Where city != 'seattle'
;

-- Query showing the CompanyName, ContactTitle, City, Country of all customers in any city in Mexico or other cities in Spain other than Madrid.
select CompanyName, ContactTitle, City, Country
from customers
Where country IN ('Mexico','Spain') 
AND City != 'Madrid'
;

-- Query showing the ContactName of all customers that do not have letter A as the second alphabet in their Contactname.
select ContactName
from customers
Where ContactName NOT LIKE '_A%'
;

-- Query showing the average UnitPrice rounded to the next whole number, total price of UnitsInStock and maximum number of orders from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively.
select round(AVG(UnitPrice),0) as AveragePrice, sum(UnitsInStock)as totalStock, max(UnitsOnOrder)as maxOrder
from products
;

-- Query showing the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice from the products, suppliers and categories table.
select suppliers.SupplierID, suppliers.CompanyName, categories.CategoryName, products.ProductName, products.UnitPrice
from products
Join suppliers
ON products.supplierID=suppliers.SupplierID
Join categories
ON products.CategoryID=categories.CategoryID
;

-- Query showing the CustomerID, sum of Freight, from the orders table with sum of freight greater $200, grouped by CustomerID.
select customerID, sum(freight) as total_sum_of_freight
from orders
Group by customerID
Having total_sum_of_freight > 200;
;

-- Query showing the OrderID ContactName, UnitPrice, Quantity, Discount from the order details, orders and customers table with discount given on every purchase.
select od.OrderID, customers.ContactName, od.UnitPrice, od.Quantity, od.Discount 
from northwind.'order details' as od
join orders
ON od.OrderID = orders.OrderID
join customers
ON orders.CustomerID= customers.CustomerID
;

-- Query showing the EmployeeID, the LastName and FirstName as employee, and the LastName and FirstName of who they report to as manager from the employees table sorted by Employee
select e1.EmployeeID, concat(e1.lastname,' ',e1.firstname) as employee, concat(e2.lastname,' ',e2.firstname) as manager
from employees as e1
LEFT JOIN  employees as e2
ON e2.EmployeeID= e1.ReportsTo
order by e1.EmployeeID
;

-- Query showing the average, minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice and MaximumPrice respectively
select AVG(UnitPrice) as AveragePrice, MIN(UnitPrice) as minimumprice, MAX(UnitPrice)as maximumprice
from products;

-- Query creating a view CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Country, Phone, OrderDate, RequiredDate, ShippedDate from the customers and orders table and then renaming it as CustomerDetails. 
Create view CustomerInfo AS
(Select  c.CustomerID, c.CompanyName, c.ContactName, c.ContactTitle, c.Address, c.City, c.Country, c.Phone, o.orderdate, o.requiredDate, o.ShippedDate
From Customers c
JOIN Orders o
	ON c.CustomerID = o.CustomerID);
Rename table CustomerInfo To CustomerDetails;

-- Query creating a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, Description, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from the supplier, products and categories tables
Create view ProductDetails AS
(Select p.ProductID, s.CompanyName, p.ProductName, c.CategoryName, c.`Description`,
p.QuantityPerUnit, p.UnitPrice, p.UnitsInStock, p.UnitsOnOrder, p.ReorderLevel, p.Discontinued
From products p
JOIN Suppliers s
	ON p.SupplierID = s.SupplierID
JOIN Categories c
	ON p.CategoryID= c.CategoryID);

Select *
FROM ProductDetails;


-- Query showing the first 5 character of categoryName from the category tables and renamed as ShortInfo.
SELECT SUBSTRING(CategoryName,1,5) as ShortInfo
FROM Categories;

-- Query creating a copy of shipper table named as Shippers_Duplicate and then inserting data from shippers table into the new table.
Create Table Shippers_Duplicate
Like shippers;

INSERT INTO Shippers_Duplicate
SELECT *
FROM shippers;

-- Query showing the data from Shippers_Duplicate.
SELECT *
FROM Shippers_Duplicate;


-- Query showing the CompanyName and ProductName from all product in the Seafood category
Select s.CompanyName, p.ProductName
FRom products p
JOIN categories c
	ON p.CategoryID= c.CategoryID
JOIN suppliers s
	ON p.SupplierID=s.SupplierID
where c.CategoryName='Seafood';

-- Query showing the CategoryID, CompanyName and ProductName from all product in the categoryID 5.
Select s.CompanyName, p.ProductName,c.CategoryID
FRom products p
JOIN categories c
	ON p.CategoryID= c.CategoryID
JOIN suppliers s
	ON p.SupplierID=s.SupplierID
where c.CategoryID=5;

-- Query deleting the Shippers_Duplicate
Drop table Shippers_Duplicate;

-- Query showing the LastName, FirstName, Title and the age of all employees.
Select LastName,FirstName, Title, 2024 - SUBSTRING(BirthDate,1,4) as Age
From employees;
-- Alternative
SELECT LastName, FirstName, Title,DATE_FORMAT(FROM_DAYS(DATEDIFF(CURRENT_DATE, BirthDate)),"%y Years ")
AS Age from northwind.employees;

-- Query returning specific statements from products table
Select CONCAT(ProductName,' weighs / is ',QuantityPerUnit ,'and cost $',Unitprice) as productinfo
From products;

































