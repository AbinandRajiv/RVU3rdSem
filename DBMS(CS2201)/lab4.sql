-- Lab Experiment 04: Implement arithmetic, logical, comparison, special, and set operators in SQL using the Employees and Departments tables.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Abinand Rajiv
-- USN: 1RUA24BCA0003
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Write your code below this line along with the output 
create database offic;
use offic;
CREATE TABLE Employees (  
EmployeeID INT PRIMARY KEY,  
Name VARCHAR(100),  
Age INT,  
Salary DECIMAL(10,2),  
DepartmentID INT,  
HireDate DATE,  
Address VARCHAR(255));  

INSERT INTO Employees VALUES  
(1, 'Alice Johnson', 30, 60000, 1, '2020-03-15', '123 Main St, City A'),  
(2, 'Bob Smith', 28, 55000, 2, '2021-06-20', '456 Oak St, City B'),  
(3, 'Charlie Brown', 35, 75000, 3, '2019-01-10', '789 Pine St, City C'),  
(4, 'David Wilson', 40, 90000, 3, '2018-07-25', '101 Maple St, City D'),  
(5, 'Emma Davis', 27, 50000, 4, '2022-09-30', '202 Birch St, City E'),  
(6, 'Frank Miller', 32, 70000, 5, '2020-11-18', '303 Cedar St, City F'),  
(7, 'Grace Lee', 29, 58000, 1, '2021-04-05', '404 Walnut St, City G'),  
(8, 'Hank Adams', 45, 98000, 2, '2017-12-12', '505 Spruce St, City H'),  
(9, 'Ivy Green', 31, 64000, 4, '2023-02-14', '606 Redwood St, City I'),  
(10, 'Jack White', 38, 85000, 5, '2019-08-08', '707 Elm St, City J');  

-- TABLE:02 Department Table

CREATE TABLE Departments (  
    DepartmentID INT PRIMARY KEY,  
    DepartmentName VARCHAR(50)  
);  

INSERT INTO Departments VALUES  
(1, 'HR'),  
(2, 'Finance'),  
(3, 'Engineering'),  
(4, 'Marketing'),  
(5, 'Sales');  


-- TASK FOR STUDENTS 


-- Exercise 1: Arithmetic Operators
-- Addition, Subtraction, Multiplication, Division
--  Q1 - Add a bonus (10% of Salary) to each employee’s salary.
 Select Name, Salary, Salary + (Salary * 0.10) FROM Employees;

/*
# Name, Salary, Salary + (Salary * 0.10)
'Alice Johnson', '60000.00', '66000.0000'
'Bob Smith', '55000.00', '60500.0000'
'Charlie Brown', '75000.00', '82500.0000'
'David Wilson', '90000.00', '99000.0000'
'Emma Davis', '50000.00', '55000.0000'
'Frank Miller', '70000.00', '77000.0000'
'Grace Lee', '58000.00', '63800.0000'
'Hank Adams', '98000.00', '107800.0000'
'Ivy Green', '64000.00', '70400.0000'
'Jack White', '85000.00', '93500.0000'

*/
-- Q2 - Subtract tax (15% of Salary) from each employee’s salary.
Select Name , Salary,(Salary + (Salary *0.10)) -(Salary * 0.15) from Employees;
/*
# Name, Salary, (Salary + (Salary *0.10)) -(Salary * 0.15)
'Alice Johnson', '60000.00', '57000.0000'
'Bob Smith', '55000.00', '52250.0000'
'Charlie Brown', '75000.00', '71250.0000'
'David Wilson', '90000.00', '85500.0000'
'Emma Davis', '50000.00', '47500.0000'
'Frank Miller', '70000.00', '66500.0000'
'Grace Lee', '58000.00', '55100.0000'
'Hank Adams', '98000.00', '93100.0000'
'Ivy Green', '64000.00', '60800.0000'
'Jack White', '85000.00', '80750.0000'
*/
-- Q3 - Calculate the yearly salary from the monthly salary.
Select Name, Salary, Salary,(((Salary + (Salary *0.10)) -(Salary * 0.15) )*12) from Employees;
/*
# Name, Salary, Salary, (((Salary + (Salary *0.10)) -(Salary * 0.15) )*12)
'Alice Johnson', '60000.00', '60000.00', '684000.0000'
'Bob Smith', '55000.00', '55000.00', '627000.0000'
'Charlie Brown', '75000.00', '75000.00', '855000.0000'
'David Wilson', '90000.00', '90000.00', '1026000.0000'
'Emma Davis', '50000.00', '50000.00', '570000.0000'
'Frank Miller', '70000.00', '70000.00', '798000.0000'
'Grace Lee', '58000.00', '58000.00', '661200.0000'
'Hank Adams', '98000.00', '98000.00', '1117200.0000'
'Ivy Green', '64000.00', '64000.00', '729600.0000'
'Jack White', '85000.00', '85000.00', '969000.0000'
*/
-- Modulus Operator
-- Q4 - Find the remainder when employees’ ages are divided by 5.

-- Write your code below this line along with the output 
Select Age%5 from Employees;
/*
'0'
'3'
'0'
'0'
'2'
'2'
'4'
'0'
'1'
'3'
*/
  
 -- Exercise 2: Logical Operators: AND, OR, NOT

-- Q5 - Retrieve employees older than 30 AND with salary > 50000.
Select * from Employees where age >30 and salary>50000;
/*
# EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
'3', 'Charlie Brown', '35', '75000.00', '3', '2019-01-10', '789 Pine St, City C'
'4', 'David Wilson', '40', '90000.00', '3', '2018-07-25', '101 Maple St, City D'
'6', 'Frank Miller', '32', '70000.00', '5', '2020-11-18', '303 Cedar St, City F'
'8', 'Hank Adams', '45', '98000.00', '2', '2017-12-12', '505 Spruce St, City H'
'9', 'Ivy Green', '31', '64000.00', '4', '2023-02-14', '606 Redwood St, City I'
'10', 'Jack White', '38', '85000.00', '5', '2019-08-08', '707 Elm St, City J'
*/

-- Q6 - Retrieve employees in the HR department (ID=1) OR earning > 70000.
Select * From Employees where DepartmentID =1 or salary>70000;
/*
# EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
'1', 'Alice Johnson', '30', '60000.00', '1', '2020-03-15', '123 Main St, City A'
'3', 'Charlie Brown', '35', '75000.00', '3', '2019-01-10', '789 Pine St, City C'
'4', 'David Wilson', '40', '90000.00', '3', '2018-07-25', '101 Maple St, City D'
'7', 'Grace Lee', '29', '58000.00', '1', '2021-04-05', '404 Walnut St, City G'
'8', 'Hank Adams', '45', '98000.00', '2', '2017-12-12', '505 Spruce St, City H'
'10', 'Jack White', '38', '85000.00', '5', '2019-08-08', '707 Elm St, City J'
*/

-- Q7 - Retrieve employees NOT living in City G.
Select * from employees where address not like "%City G";
/*
# EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
'1', 'Alice Johnson', '30', '60000.00', '1', '2020-03-15', '123 Main St, City A'
'2', 'Bob Smith', '28', '55000.00', '2', '2021-06-20', '456 Oak St, City B'
'3', 'Charlie Brown', '35', '75000.00', '3', '2019-01-10', '789 Pine St, City C'
'4', 'David Wilson', '40', '90000.00', '3', '2018-07-25', '101 Maple St, City D'
'5', 'Emma Davis', '27', '50000.00', '4', '2022-09-30', '202 Birch St, City E'
'6', 'Frank Miller', '32', '70000.00', '5', '2020-11-18', '303 Cedar St, City F'
'8', 'Hank Adams', '45', '98000.00', '2', '2017-12-12', '505 Spruce St, City H'
'9', 'Ivy Green', '31', '64000.00', '4', '2023-02-14', '606 Redwood St, City I'
'10', 'Jack White', '38', '85000.00', '5', '2019-08-08', '707 Elm St, City J'

*/


-- Write your code below this line along with the output 

 
-- Exercise 3: Comparison Operators

-- Q8 - Equality, Inequality, Greater Than, Less Than

-- Q9 - Find employees with salary = 60000.
Select * from employees where salary=60000;

/*
# EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
'1', 'Alice Johnson', '30', '60000.00', '1', '2020-03-15', '123 Main St, City A'
*/
-- Q10 - List employees not in the IT department (no IT department exists; returns all).
Select * from employees where DepartmentID = "it";
/*
Null
*/
-- Q11 - Retrieve employees younger than 25 with salary > 50000 
Select * from employees where age<25 and salary >50000;
-- Q12 - List employees aged 25–35.
Select * from employees where age >24 and age <36;
/*
# EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
'1', 'Alice Johnson', '30', '60000.00', '1', '2020-03-15', '123 Main St, City A'
'2', 'Bob Smith', '28', '55000.00', '2', '2021-06-20', '456 Oak St, City B'
'3', 'Charlie Brown', '35', '75000.00', '3', '2019-01-10', '789 Pine St, City C'
'5', 'Emma Davis', '27', '50000.00', '4', '2022-09-30', '202 Birch St, City E'
'6', 'Frank Miller', '32', '70000.00', '5', '2020-11-18', '303 Cedar St, City F'
'7', 'Grace Lee', '29', '58000.00', '1', '2021-04-05', '404 Walnut St, City G'
'9', 'Ivy Green', '31', '64000.00', '4', '2023-02-14', '606 Redwood St, City I'
*/

-- Q13 - Find employees in HR, Finance, or Engineering (IDs 1, 2, 3).
Select * from employees where Departmentid = 1 or Departmentid =2 or departmentid = 3;
/*
# EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
'1', 'Alice Johnson', '30', '60000.00', '1', '2020-03-15', '123 Main St, City A'
'2', 'Bob Smith', '28', '55000.00', '2', '2021-06-20', '456 Oak St, City B'
'3', 'Charlie Brown', '35', '75000.00', '3', '2019-01-10', '789 Pine St, City C'
'4', 'David Wilson', '40', '90000.00', '3', '2018-07-25', '101 Maple St, City D'
'7', 'Grace Lee', '29', '58000.00', '1', '2021-04-05', '404 Walnut St, City G'
'8', 'Hank Adams', '45', '98000.00', '2', '2017-12-12', '505 Spruce St, City H'
*/

-- Q14 - Find employees with names starting with A.
Select * from employees where  name like "A%";
/*
# EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
'1', 'Alice Johnson', '30', '60000.00', '1', '2020-03-15', '123 Main St, City A'
*/
-- Q15 - List employees with no address.
Select * from employees where address is null;

-- Write your code below this line along with the output 

-- Exercise 5: Set Operators: UNION.

-- Q16 - Retrieve names from the HR department hired in 2022 OR 2023.
Select name  from employees where DepartmentId = 1 and year(HireDate) in (2022,2023);
-- Q17 - Find common employees in the Engineering department (ID=3) hired before and after 2020.
Select * from employees where departmentid =3 and year(hiredate) <= (2020);
/*
# EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
'3', 'Charlie Brown', '35', '75000.00', '3', '2019-01-10', '789 Pine St, City C'
'4', 'David Wilson', '40', '90000.00', '3', '2018-07-25', '101 Maple St, City D'
*/

-- Q18 - Find employees hired in 2023 but not in 2022.
Select * from employees where year(hiredate) = 2023;
/*
# EmployeeID, Name, Age, Salary, DepartmentID, HireDate, Address
'9', 'Ivy Green', '31', '64000.00', '4', '2023-02-14', '606 Redwood St, City I'

*/
