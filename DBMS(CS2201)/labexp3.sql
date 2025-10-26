-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Abinand Rajiv
-- USN: 1RUA24BCA0003
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
/*

'root@localhost', 'LAPTOP-47O1N7JI', '8.0.43', '2025-09-08 19:12:55'

*/
create database office;
use office;
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. create a table named Employee with EmpID ,FirstName,LastName Salary BirthDate HireDate 
CREATE TABLE Employee (
EmpID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Salary DECIMAL(10, 2),
BirthDate DATE,
HireDate DATE
);
-- 2. Insert 10 records to employee;
INSERT INTO Employee VALUES
(1, 'Max', 'Verstappen', 50000.00, '1989-01-15', '2010-06-01'),
(2, 'Oscar', 'Piastri', 55000.00, '1992-03-22', '2012-08-15'),
(3, 'Fernando', 'Alonso', 60000.00, '1989-11-10', '2015-02-20'),
(4, 'Charles', 'Leclerc', 52000.00, '1976-07-30', '2009-11-05'),
(5, 'Lewis', 'Hamilton', 58000.00, '1983-05-12', '2011-09-12'),
(6, 'Richard', 'Vershoor', 62000.00, '1992-12-01', '2016-04-18'),
(7, 'Gabi', 'Bortoleto', 49000.00, '1987-04-05', '2013-01-23'),
(8, 'Kush', 'Maini', 57000.00, '1985-09-17', '2010-10-10'),
(9, 'Mikey', 'Moore', 53000.00, '1991-06-25', '2014-07-07'),
(10, 'Frank', 'Ocean', 61000.00, '1986-02-28', '2012-05-30');
-- 3. create a table named Orders with OrderID , OrderDate, totalAmount, EmpID(foreign key)  

CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
OrderDate DATE,
TotalAmount DECIMAL(10, 2),
EmpID INT,
FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
);
-- 4. Insert 10 records to Orders

INSERT INTO Orders values
(1001, '2023-01-15', 1500.50, 1),
(1002, '2023-02-10', 2300.00, 2),
(1003, '2023-03-05', 500.75, 3),
(1004, '2023-03-18', 1200.00, 4),
(1005, '2023-04-12', 1750.25, 5),
(1006, '2023-05-30', 800.00, 6),
(1007, '2023-06-15', 2150.40, 7),
(1008, '2023-07-01', 3000.00, 8),
(1009, '2023-07-20', 900.00, 9),
(1010, '2023-08-05', 2700.80, 10);

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.
Select * from Employee;



-- Output: 
/*

# EmpID, FirstName, LastName, Salary, BirthDate, HireDate
'1', 'Max', 'Verstappen', '50000.00', '1989-01-15', '2010-06-01'
'2', 'Oscar', 'Piastri', '55000.00', '1992-03-22', '2012-08-15'
'3', 'Fernando', 'Alonso', '60000.00', '1989-11-10', '2015-02-20'
'4', 'Charles', 'Leclerc', '52000.00', '1976-07-30', '2009-11-05'
'5', 'Lewis', 'Hamilton', '58000.00', '1983-05-12', '2011-09-12'
'6', 'Richard', 'Vershoor', '62000.00', '1992-12-01', '2016-04-18'
'7', 'Gabi', 'Bortoleto', '49000.00', '1987-04-05', '2013-01-23'
'8', 'Kush', 'Maini', '57000.00', '1985-09-17', '2010-10-10'
'9', 'Mikey', 'Moore', '53000.00', '1991-06-25', '2014-07-07'
'10', 'Frank', 'Ocean', '61000.00', '1986-02-28', '2012-05-30'

*/

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
Select EmpID, FirstName, LastName, ROUND(Salary) AS RoundedSalary From Employee;

-- Output: 
/*
'1', 'Max', 'Verstappen', '50000'
'2', 'Oscar', 'Piastri', '55000'
'3', 'Fernando', 'Alonso', '60000'
'4', 'Charles', 'Leclerc', '52000'
'5', 'Lewis', 'Hamilton', '58000'
'6', 'Richard', 'Vershoor', '62000'
'7', 'Gabi', 'Bortoleto', '49000'
'8', 'Kush', 'Maini', '57000'
'9', 'Mikey', 'Moore', '53000'
'10', 'Frank', 'Ocean', '61000'

*/
/* b. Absolute Values: Show absolute values of salaries */
Select EmpID, Salary, ABS(Salary) AS AbsoluteSalary from Employee;
-- Output: 
/*
'1', '50000.00', '50000.00'
'2', '55000.00', '55000.00'
'3', '60000.00', '60000.00'
'4', '52000.00', '52000.00'
'5', '58000.00', '58000.00'
'6', '62000.00', '62000.00'
'7', '49000.00', '49000.00'
'8', '57000.00', '57000.00'
'9', '53000.00', '53000.00'
'10', '61000.00', '61000.00'
*/

-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
Select count(*) as EmployeeCount from Employee;

-- Output: 
/*
'10'
*/
/* b. Sum of Salaries: Calculate total salary expense */
Select sum(Salary) as TotalSalaryExpense from Employee;

-- Output: 
/*
'557000.00'
*/
/* c. Average Order Amount: Find average order value */
Select avg(TotalAmount) as AvgOrderAmount from Orders;

/* d. Max/Min Salary: Find highest and lowest salaries */
Select max(Salary) as MaxSalary, min(Salary) as MinSalary from Employee;

-- Output: 
/*
'62000.00', '49000.00'

*/
-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
Select FirstName, upper(FirstName) as FirstNameUpper, lower(FirstName) as FirstNameLower from Employee;

-- Output: 
/*
'Max', 'MAX', 'max'
'Oscar', 'OSCAR', 'oscar'
'Fernando', 'FERNANDO', 'fernando'
'Charles', 'CHARLES', 'charles'
'Lewis', 'LEWIS', 'lewis'
'Richard', 'RICHARD', 'richard'
'Gabi', 'GABI', 'gabi'
'Kush', 'KUSH', 'kush'
'Mikey', 'MIKEY', 'mikey'
'Frank', 'FRANK', 'frank'

*/
/* b. Concatenate Names: Create full names */
Select EmpID, concat(FirstName, ' ', LastName) as FullName from Employee;

-- Output: 
/*

'1', 'Max Verstappen'
'2', 'Oscar Piastri'
'3', 'Fernando Alonso'
'4', 'Charles Leclerc'
'5', 'Lewis Hamilton'
'6', 'Richard Vershoor'
'7', 'Gabi Bortoleto'
'8', 'Kush Maini'
'9', 'Mikey Moore'
'10', 'Frank Ocean'

*/
/* c. Extract Substring: Get first 3 characters of first names */
Select EmpID, FirstName, substring(FirstName, 1, 3) as FirstNamePrefix from Employee;

-- Output: 
/*

'1', 'Max', 'Max'
'2', 'Oscar', 'Osc'
'3', 'Fernando', 'Fer'
'4', 'Charles', 'Cha'
'5', 'Lewis', 'Lew'
'6', 'Richard', 'Ric'
'7', 'Gabi', 'Gab'
'8', 'Kush', 'Kus'
'9', 'Mikey', 'Mik'
'10', 'Frank', 'Fra'

*/
-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert text to DATE type */
Select str_to_date('2023-08-15', '%Y-%m-%d') as ConvertedDate;

-- Output: 
/*
'2023-08-15'
*/
-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
Select now() as CurrentTimestamp;

-- Output: 
/*

'2025-09-08 19:34:49'
*/
/* b. Extract Year: Get year from order dates */
Select OrderID, OrderDate, year(OrderDate) as OrderYear from  Orders;

-- Output: 

/* c. Add Months: Add 3 months to order dates */
Select OrderID, OrderDate, date_add(OrderDate, INTERVAL 3 MONTH) as OrderPlus3Months from Orders;

-- Output: 

/* d. Days Since Order: Calculate days between order date and now */
-- Output: 

-- END of the Task --