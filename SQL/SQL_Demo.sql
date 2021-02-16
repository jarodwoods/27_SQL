-- SELECT
/*  Select all columns from the products table.  */
SELECT *   
FROM products;


/* Select only the Name and Price columns from the products table.   */
SELECT Name, Price
FROM products;


/* Select Name, Price, and add a 3rd column AS “Discounted Price” with a 10% discount. */
SELECT Name, Price, (Price - (Price * .1))
AS 'Discounted Price'
FROM products;

-- --------------------------------------------------------------------------------------------------------------
-- SELECT DISTINCT

/*  Select only the distinct prices from the products table */
SELECT DISTINCT Price FROM products;

-- --------------------------------------------------------------------------------------------------------------
-- WHERE 

/* Select all the products whose price is greater than $100 */
SELECT *
FROM products
WHERE Price > 100.00;

/* Select the product with a product ID of  97 */
SELECT * 
FROM products 
WHERE ProductID = 97;

-- -------------------------------------------------------------------------------------------------------------
-- AND, OR, NOT, IS, NULL

/* Select all the employees who are geek squad members and who doesn’t have a middle initial */
SELECT * 
FROM employees
WHERE Title = 'Geek Squad' AND MiddleInitial IS NULL;

/* Select all the employees who are geek squad members and have a middle initial */
SELECT * 
FROM employees
WHERE Title = 'Geek Squad' AND MiddleInitial IS NOT NULL;

/* Select all the products who are on sale or whose stock levels are 0 */
SELECT * 
FROM products
WHERE OnSale IS True OR StockLevel IS NULL;

-- --------------------------------------------------------------------------------------------------------------  
-- ORDER BY

/* Select all the products whose price is greater than $200 and is on sale, order by price descending */
SELECT * 
FROM products 
WHERE Price > 200 AND OnSale IS True
ORDER BY Price DESC;

/* Select all the products whose price is less than $200 and category ID is either 1 or 3 order by CategoryID Ascending and Name Ascending */
SELECT * 
FROM products 
WHERE Price < 200 AND CategoryID = 1 OR CategoryID = 3
ORDER BY CategoryID ASC, Name ASC;

-- -----------------------------------------------------------------------------------------------------------------
-- INSERT INTO

/* Add a new department named IoT to the departments table (you might need to change the ID if you’ve already added some to your table) */
INSERT INTO departments
VALUES (5, “IoT”);

/* Add a new employee and input their first name, last name, middle initial, and Email Address */
INSERT INTO employees (FirstName, LastName, MiddleInitial, EmailAddress)
VALUES(“John”, “Smith”,"D", "123@abc.com");

-- ------------------------------------------------------------------------------------------------------------------
-- UPDATE 
/* Update the first and last name of the employee John D. Smith => Jack J. Jackson (Don’t forget your WHERE clause) */
-- The employee ID number may be slightly different for you depending on if you’ve already inserted some rows into the table
UPDATE employees
SET FirstName = "Jack", MiddleInitial = ‘J’,  LastName = "Jackson"
WHERE EmployeeID = 34618;

-- -----------------------------------------------------------------------------------------------------------------
-- DELETE

/* Delete all the entries you’ve INSERTED INTO in your table (DON’T FORGET WHERE CLAUSE!)*/
DELETE 
FROM employees
WHERE EmployeeID = 34618;

-- --------------------------------------------------------------------------------------------------------------
-- MIN() and MAX()

SELECT MIN(Price)
FROM Products;

SELECT MAX(StockLevel)
From Products;

-- ---------------------------------------------------------------------------------------------------------------
-- COUNT(), AVG(), SUM()

/* Return the total count of products */
SELECT COUNT(ProductID)
FROM products;

/* Return the average of all the products */ 
SELECT AVG(Price)
FROM Products;

/* Return the total amount of money you’re entire products table is worth */
SELECT SUM(StockLevel * Price)
FROM products;

-- ---------------------------------------------------------------------------------------------------------------
-- LIKE and wildcards

/* The SQL LIKE Operator
Usually used with wildcards
% = The percentage sign means 0 or more characters
_ = The underscore sign means a single character
*/

/* Return all products with “J” as the first letter */
SELECT * 
FROM products 
WHERE Name LIKE "J%";

/* Return all products with “y” as the last letter */
SELECT * 
FROM products
WHERE Name LIKE "%y";

/* Return all the employees with a firstname that has 2 characters */
SELECT * 
FROM employees
WHERE FirstName LIKE '__';

-- For more information on WILDCARDS go to: https://www.w3schools.com/sql/sql_wildcards.asp

-- --------------------------------------------------------------------------------------------------------------
-- BETWEEN 

/* Return all the products from $10 - $100 */ 
SELECT * 
FROM products
WHERE Price BETWEEN 10 AND 20;

-- --------------------------------------------------------------------------------------------------------------
-- ORDER BY

/* Order the previous query by Price ascending */
SELECT * 
FROM products 
WHERE Price BETWEEN 10 AND 20
ORDER BY Price;

/* Order the previous query by Price descending */
SELECT * 
FROM products 
WHERE Price BETWEEN 10 AND 20
ORDER BY Price DESC;

-- -------------------------------------------------------------------------------------------------------------
-- GROUP BY

SELECT DISTINCT COUNT(EmployeeID) AS 'Employee Count', Title
FROM employees
GROUP BY  Title;

-- -----------------------------------------------------------------------------------------------
-- JOINS
-- INNER JOIN
SELECT * 
FROM employees e 
INNER JOIN sales s 
ON e.EmployeeID = s.EmployeeID;

-- LEFT JOIN
SELECT * 
FROM employees e 
LEFT JOIN sales s 
ON e.EmployeeID = s.EmployeeID;

-- RIGHT JOIN
SELECT * 
FROM employees e 
RIGHT JOIN sales s 
ON e.EmployeeID = s.EmployeeID;

-- LEFT EXCLUDING JOIN
SELECT * 
FROM employees e 
LEFT JOIN sales s 
ON e.EmployeeID = s.EmployeeID
WHERE s.EmployeeID IS NULL;

-- RIGHT EXCLUDING JOIN
SELECT * 
FROM employees e 
RIGHT JOIN sales s 
ON e.EmployeeID = s.EmployeeID
WHERE e.EmployeeID IS NULL;

-- ---------------------------------------------------------------------------------------------
/* Which employee sold the most iphone 7's? Include the sales and employee information */
SELECT *
FROM employees e
INNER JOIN sales s ON e.EmployeeID = s.EmployeeID
WHERE s.ProductID = 593
ORDER BY QUANTITY DESC;
