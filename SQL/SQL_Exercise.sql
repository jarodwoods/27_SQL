-- find all products--
 SELECT * 
 FROM products;
 
-- find all products that cost $1400
 SELECT * 
 FROM products 
 WHERE Price = 1400;
 
-- find all products that cost 11.99 or 13.99
 SELECT *
 FROM products
 WHERE Price = 11.99 OR Price = 13.99;
 
-- find all products that do NOT cost 11.99 - using NOT
 SELECT *
 FROM products 
 WHERE NOT Price = 11.99;
 
-- find  all products and sort them by price from greatest to least
 SELECT * 
 FROM products 
 ORDER BY Price DESC;
 
-- find all employees who don't have a middle initial
 SELECT * 
 FROM employees
 WHERE MiddleInitial IS NULL;
 
-- find distinct product prices
 SELECT DISTINCT Price 
 FROM products;
 
-- find all employees whose first name starts with the letter ‘j’
 SELECT *
 FROM employees
 WHERE FirstName LIKE 'j%';
 
-- find all Macbooks --
 SELECT *
 FROM products
 WHERE Name = 'Macbook';
 
-- find all products that are on sale
 SELECT *
 FROM products 
 WHERE OnSale IS True;
 
-- find the average price of all products --
 SELECT ROUND(AVG(Price), 2) AS 'Product Average Price'
 FROM products;
 
-- find all Geek Squad employees who don't have a middle initial --
 SELECT * 
 FROM employees
 WHERE MiddleInitial IS NULL;
 
-- find all products from the products table whose stock level is in the range of 500 to 1200. 
-- Order by Price from least to greatest. **Try this with the between keyword** 
 SELECT * 
 FROM products 
 WHERE StockLevel BETWEEN 500 AND 1200
 ORDER BY Price;
 
-- ------------------------------------------------------------------------------------------------
-- JOINS SECTION: 
-- EXERCISE HOW TO VIDEO: https://youtu.be/G5VzHjX6MLI

-- joins: select all the computers from the products table:
 -- using the products table and the categories table, return the product name and the category name
 SELECT p.Name, c.Name 
 FROM products AS p
 INNER JOIN categories AS c
 ON p.CategoryID = c.CategoryID
 WHERE p.CategoryID = 1;
 
-- joins: find all product names, product prices, and products ratings that have a rating of 5
 SELECT p.Name, p.Price, r.Rating
 FROM reviews AS r
 INNER JOIN products AS p
 ON r.ProductID = p.ProductID
 WHERE r.Rating = 5; 
 
-- joins: find the employee with the most total quantity sold.  use the sum() function and group by
SELECT e.FirstName, e.LastName, SUM(s.Quantity) AS 'Total' 
FROM sales AS s
INNER JOIN employees AS e
ON s.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total DESC
LIMIT 2;

-----------------------------------------------------------------
-- joins: find the name of the department, and the name of the category for Appliances and Games
SELECT d.Name AS Department, c.Name AS Category
FROM departments AS d
INNER JOIN categories AS c 
ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Games' OR c.Name = 'appliances';

-- joins: find the product name, total # sold, and total price sold,
-- for Eagles: Hotel California --You may need to use SUM()
SELECT p.Name, SUM(s.Quantity) AS 'Total Sold', SUM(s.Quantity * s.PricePerUnit) AS 'Total'
FROM products AS p
INNER JOIN sales AS s 
ON s.ProductID = p.ProductID;

-- joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!)
SELECT p.Name AS 'Product Name', r.Reviewer, r.Rating, r.Comment
FROM reviews AS r
INNER JOIN products AS p
ON p.ProductID = r.ProductID
WHERE p.ProductID = 857 AND r.Rating = 1;




-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name,
 the name of each product, how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.ProductID, p.Name, Sum(s.Quantity) AS Quantity, s.Date 
FROM sales AS s
INNER JOIN employees AS e 
ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p 
ON p.productid = s.productid
GROUP BY e.employeeid, e.FirstName, e.LastName, p.productID, p.name, s.Date;

SELECT e.EmployeeID, e.FirstName, e.LastName, p.ProductID, 
	   p.Name, SUM(s.Quantity) AS 'Total Sold' 
FROM sales AS s
INNER JOIN employees AS e 
ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p 
ON p.productid = s.productid
GROUP BY e.employeeID, p.productID;


-- BONUS Employee Sales Report
SELECT DISTINCT e.EmployeeID, e.FirstName, e.MiddleInitial, e.LastName, e.Title,
		CONCAT('$', FORMAT(SUM(s.Quantity * s.PricePerUnit), 2)) AS 'Total Amount Sold',
        p.Name AS 'Most Expensive Product Sold',
        COUNT(s.Quantity) AS 'Number of Products Sold'
FROM employees AS e
INNER JOIN sales AS s
ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p
ON s.ProductID = p.ProductID 


        

