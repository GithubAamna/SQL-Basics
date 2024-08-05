-- Question 1
/*SELECT CategoryName,Description
FROM categories
ORDER BY CategoryName;*/

-- Question 2
/*SELECT ContactName,CompanyName,ContactTitle,Phone
FROM Customers
ORDER BY Phone;*/

-- Question 3
/*SELECT UPPER(FirstName) AS FirstName, UPPER(LastName) AS LastName, HireDate
FROM employees
ORDER BY HireDate DESC;*/

-- Question 4
/*SELECT OrderID,OrderDate,ShippedDate,CustomerID,Freight
FROM Orders
ORDER BY Freight DESC
LIMIT 10
;*/

-- Question 5
/*SELECT LOWER(CustomerID) as ID
FROM Customers;*/

-- Question 6
/*SELECT CompanyName,Fax,Phone,Country,HomePage
FROM Suppliers
ORDER BY Country DESC,CompanyName ASC;*/

-- Question7
/*SELECT CompanyName, ContactName, City
FROM customers
WHERE city="Buenos Aires";*/

-- Question8
/*SELECT ProductName,UnitPrice, QuantityPerUnit
FROM products
WHERE UnitsInStock = 0;*/

-- Question9
/*SELECT ContactName,Address, City
FROM customers
WHERE city != "Germany" OR " MEXICO" OR "SPAIN";*/

-- Question10
/*SELECT OrderDate,ShippedDate,CustomerID,Freight
FROM orders
WHERE OrderDate= '1996-05-21';*/

-- Question11
/*SELECT FirstName,LastName,Country
FROM employees
WHERE Country != 'USA';*/

-- Question12
/*SELECT EmployeeID,OrderID,CustomerID,RequiredDate,ShippedDate
FROM orders
WHERE ShippedDate>RequiredDate;*/

-- Question13
/*SELECT City,CompanyName,ContactName
FROM customers
WHERE city like 'A%' OR city like 'B%'
;*/

-- Question14
/*SELECT OrderID
FROM orders
WHERE (OrderID % 2) =0
;*/

-- Question15
/*SELECT*
FROM orders
WHERE Freight > 500
;*/

-- Question17
/*SELECT CompanyName,ContactName,ContactTitle,Fax
FROM customers
where Fax IS NULL;*/

-- Question18
/*SELECT FirstName,LastName
FROM employees
WHERE ReportsTo IS NULL;*/

-- Question19
/*SELECT OrderID
FROM Orders
WHERE MOD(OrderID,2)!= 0;*/

-- Question20
/*SELECT CompanyName, ContactName, Fax
FROM customers
WHERE FAX is NULL
ORDER BY ContactName;*/

-- Question21
/*SELECT CompanyName, ContactName, City
FROM customers
WHERE city like '%l%'
ORDER BY ContactName;*/

-- Question22
/*SELECT FirstName, LastName, BirthDate
FROM employees
WHERE BirthDate > '1950-01-01' AND BirthDate <'1950-12-31'
;*/

-- Question23
-- We can use extract function as well 
/*SELECT FirstName, LastName, BirthDate, substring(Birthdate,1,4) AS BirthYear
FROM employees
;*/

-- Question24
/*SELECT OrderID, count(OrderID) as NumberofOrders
FROM northwind.`order details`
GROUP BY OrderID
ORDER BY NumberofOrders DESC ;*/

-- Question25
/*select suppliers.SupplierID, ProductName, CompanyName
from suppliers 
join products
on suppliers.SupplierID=products.SupplierID
Where suppliers.CompanyName IN ('Exotic Liquids','Specialty Biscuits,Ltd.','Escargots Nouveaux')
order by suppliers.SupplierID
;*/

-- Question26
/*select ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress 
from orders
Where ShipPostalCode Like '98124%'
;*/

-- Question27
/*select ContactName, ContactTitle, CompanyName
from customers
Where ContactTitle not like '%sales%'
;
*/

-- Question28
/*select LastName, FirstName, City
from employees
Where city != 'seattle'
;*/

-- Question29
/*select CompanyName, ContactTitle, City, Country
from customers
Where country IN ('Mexico','Spain') 
AND City != 'Madrid'
;*/

-- Question31
/*select ContactName
from customers
Where ContactName NOT LIKE '_A%'
;*/

-- Question32
/*select round(AVG(UnitPrice),0) as AveragePrice, sum(UnitsInStock)as totalStock, max(UnitsOnOrder)as maxOrder
from products
;*/

-- Question33
/*select suppliers.SupplierID, suppliers.CompanyName, categories.CategoryName, products.ProductName, products.UnitPrice
from products
Join suppliers
ON products.supplierID=suppliers.SupplierID
Join categories
ON products.CategoryID=categories.CategoryID
;*/

-- Question34
/*select customerID, sum(freight) as total_sum_of_freight
from orders
Group by customerID
Having total_sum_of_freight > 200;
;*/

-- Question35 -------------------------------------complete mess-----------------------------------------------------------------
/*select od.OrderID, customers.ContactName, od.UnitPrice, od.Quantity, od.Discount 
from northwind.'order details' od
join orders
ON od.OrderID = orders.OrderID
join customers
ON orders.CustomerID= customers.CustomerID
;*/ 

-- Question36
/*select e1.EmployeeID, concat(e1.lastname,' ',e1.firstname) as employee, concat(e2.lastname,' ',e2.firstname) as manager
from employees as e1
LEFT JOIN  employees as e2
ON e2.EmployeeID= e1.ReportsTo
order by e1.EmployeeID
;*/

-- Question37
/*select AVG(UnitPrice) as AveragePrice, MIN(UnitPrice) as minimumprice, MAX(UnitPrice)as maximumprice
from products;*/

-- Question 38 & 39
/*Create view CustomerInfo AS
(Select  c.CustomerID, c.CompanyName, c.ContactName, c.ContactTitle, c.Address, c.City, c.Country, c.Phone, o.orderdate, o.requiredDate, o.ShippedDate
From Customers c
JOIN Orders o
	ON c.CustomerID = o.CustomerID);

Rename table CustomerInfo To CustomerDetails;
*/

-- Question 40
/*Create view ProductDetails AS
(Select p.ProductID, s.CompanyName, p.ProductName, c.CategoryName, c.`Description`,
p.QuantityPerUnit, p.UnitPrice, p.UnitsInStock, p.UnitsOnOrder, p.ReorderLevel, p.Discontinued
From products p
JOIN Suppliers s
	ON p.SupplierID = s.SupplierID
JOIN Categories c
	ON p.CategoryID= c.CategoryID);

Select *
FROM ProductDetails
*/

-- Question42
/*SELECT SUBSTRING(CategoryName,1,5) as ShortInfo
FROM Categories;*/

-- Question43
/*Create Table Shippers_Duplicate
Like shippers;

INSERT INTO Shippers_Duplicate
SELECT *
FROM shippers;

-- Question44
SELECT *
FROM Shippers_Duplicate
*/

-- Question45
/*Select s.CompanyName, p.ProductName
FRom products p
JOIN categories c
	ON p.CategoryID= c.CategoryID
JOIN suppliers s
	ON p.SupplierID=s.SupplierID
where c.CategoryName='Seafood';*/

-- Question46
/*Select s.CompanyName, p.ProductName,c.CategoryID
FRom products p
JOIN categories c
	ON p.CategoryID= c.CategoryID
JOIN suppliers s
	ON p.SupplierID=s.SupplierID
where c.CategoryID=5;*/

-- Question47
-- Drop table shippers_duplicate;

-- Question48
/*Select LastName,FirstName, Title, 2024 - SUBSTRING(BirthDate,1,4) as Age
From employees;
--Alternative
SELECT LastName, FirstName, Title,DATE_FORMAT(FROM_DAYS(DATEDIFF(CURRENT_DATE, BirthDate)),"%y Years ")
AS Age from northwind.employees;*/

-- question50
/*Select CONCAT(ProductName,' weighs / is ',QuantityPerUnit ,'and cost $',Unitprice) as productinfo
From products;
*/
































