USE bestbuy;
/* joins: select all the computers from the products table: 
using the products table and the categories table, return the product name and the category name */
 SELECT P.Name as Product, C.Name as Category 
 FROM products as P
 INNER JOIN categories AS C ON C.CategoryID = P.CategoryID
 WHERE C.Name = 'Computers';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT P.Name as Product, P.Price, R.Rating
 FROM products as P
 INNER JOIN reviews as R ON R.ProductID = P.ProductID
 WHERE R.Rating = '5';
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT E.FirstName, E.LastName, Sum(S.Quantity) AS Total FROM sales as S
INNER JOIN employees AS E ON E.EmployeeID = S.EmployeeID
GROUP BY E.EmployeeID ORDER BY Total DESC;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT D.Name as Department, C.Name as Category
FROM departments as D
INNER JOIN categories as C ON C.DepartmentID = D.DepartmentID
WHERE C.Name = 'Appliances' OR C.Name = 'Games';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT P.Name as Product, Sum(S.Quantity) as Sold, Sum(S.Quantity*S.PricePerUnit) as Total
FROM products as P
INNER JOIN sales as S ON P.ProductID = S.ProductID
WHERE P.Name = 'Eagles: Hotel California';
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT P.Name as Product, R.Reviewer, R.Rating, R.Comment
FROM products as P
INNER JOIN reviews as R ON P.ProductID = R.ProductID
WHERE P.Name = 'Visio TV' and R.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT 
	E.EmployeeID as ID, 
	E.FirstName as First,
    E.LastName as Last,
    P.Name as Product,
    SUM(s.Quantity) as Total
    FROM sales as S
    INNER JOIN products as P on P.ProductID = S.ProductID
    INNER JOIN employees as E on E.EmployeeID = S.EmployeeID
    GROUP BY E.EmployeeID, P.ProductID
    ORDER BY E.EmployeeID;
    