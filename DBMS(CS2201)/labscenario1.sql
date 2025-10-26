-- Lab Experiment 01: Implementation of DDL Commands in SQL for the given scenarios
-- STUDENT NAME: Abinand Rajiv
-- USN: 1RUA24BCA0003
-- SECTION: BCA A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : 'root@localhost', 'RVU-PC-013', '8.4.6', '2025-08-25 11:29:32'

-- Scenario: College Student Management System

-- CREATE AND LOAD THE database
Create database College_Student_Management_System;
use College_Student_Management_System;
-- Write your SQL query below Codespace:

-- Task 1: Create the Tables under this system (min 5 tables)
  -- Table 01: Departments ( DepartmentID, DepartmentName, HOD,ContactEmail,PhoneNumber,Location )
  -- Table 02: Course (CourseID, CourseName,Credits,DepartmentID,Duration,Fee )
  -- Table 03: Students (StudentID,FirstName,LastName,Email,DateOfBirth,CourseID)
  -- Table 04: Faculty FacultyID,FacultyName,DepartmentID,Qualification,Email,PhoneNumber)
  -- Table 05: Enrollments (  EnrollmentID,StudentID,CourseID,Semester,Year,Grade)
-- Specify the Key (Primary and Foreign) for each table while creating


-- Write your SQL query below Codespace:
use College_Student_Management_System;
create table Departments(
DepartmentId varchar(15) primary key,
DepartmentName varchar(20),
HOD varchar(15),
ContactEmail varchar(25),
PhoneNumber int,
Location varchar(20));

create table Course(
CourseID varchar(15) primary key,
CourseName varchar(20),
Credits int,
DepartmentID varchar(20),
foreign key (DepartmentId) references Departments(DepartmentID),
Duration int,
Fee int);

create table Students(
StudentID varchar(15) primary key,
FirstName varchar(15),
LastName varchar(15),
Email varchar(25),
DateOfBirth date,
CourseID varchar(15),
foreign key (CourseID) references Course(CourseID));

create table Faculty(
FacultyID varchar(15) Primary key,
FacultyName varchar(20),
DepartmentID varchar(20),
foreign key (DepartmentId) references Departments(DepartmentID),
Qualification varchar(20),
Email varchar(20),
PhoneNumber int);

create table Enrollements(
EnrollmentId varchar(15),
StudentID varchar(15),
foreign key (StudentId) references Students(StudentID),
CourseID varchar(15),
foreign key (CourseID) references Course(CourseID),
Semester int,
EnrollDate date,
Grade varchar(100));
-- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
--  describe the structure of each table and copy paste the Output 

desc Departments;
/*

'DepartmentId', 'varchar(15)', 'NO', 'PRI', NULL, ''
'DepartmentName', 'varchar(20)', 'YES', '', NULL, ''
'HOD', 'varchar(15)', 'YES', '', NULL, ''
'ContactEmail', 'varchar(25)', 'YES', '', NULL, ''
'PhoneNumber', 'int', 'YES', '', NULL, ''
'Location', 'varchar(20)', 'YES', '', NULL, ''

*/

desc Course;
/*

'CourseID', 'varchar(15)', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(20)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''
'DepartmentID', 'varchar(20)', 'YES', 'MUL', NULL, ''
'Duration', 'int', 'YES', '', NULL, ''
'Fee', 'int', 'YES', '', NULL, ''

*/

desc Students;
/*

'StudentID', 'varchar(15)', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(15)', 'YES', '', NULL, ''
'LastName', 'varchar(15)', 'YES', '', NULL, ''
'Email', 'varchar(25)', 'YES', '', NULL, ''
'DateOfBirth', 'date', 'YES', '', NULL, ''
'CourseID', 'varchar(15)', 'YES', 'MUL', NULL, ''

*/

desc Faculty;
/*

'FacultyID', 'varchar(15)', 'NO', 'PRI', NULL, ''
'FacultyName', 'varchar(20)', 'YES', '', NULL, ''
'DepartmentID', 'varchar(20)', 'YES', 'MUL', NULL, ''
'Qualification', 'varchar(20)', 'YES', '', NULL, ''
'Email', 'varchar(20)', 'YES', '', NULL, ''
'PhoneNumber', 'int', 'YES', '', NULL, ''
 
 */
 
 desc Enrollments;
 /*
 
'EnrollmentId', 'varchar(15)', 'YES', '', NULL, ''
'StudentID', 'varchar(15)', 'YES', 'MUL', NULL, ''
'CourseID', 'varchar(15)', 'YES', 'MUL', NULL, ''
'Semester', 'int', 'YES', '', NULL, ''
'EnrollDate', 'date', 'YES', '', NULL, ''
'Grades', 'varchar(100)', 'YES', '', NULL, ''
'EnrollmentOfficer', 'varchar(20)', 'YES', '', NULL, ''
'EnrollmentOfficers', 'varchar(20)', 'YES', '', NULL, ''
'ParentName', 'varchar(20)', 'YES', '', NULL, ''


*/

-- Perform the following operations on the each of the tables
-- 01: add 2 new columns for each table
-- 02: Modify the existing column from each table
-- 03 change the datatypes
-- 04: Rename a column
-- 05: Drop a column
-- 06: Rename the table
-- 07: describe the structure of the new table

alter table Departments
add NoOfCourse int,
add TotalStudent int ,
rename column PhoneNumber to ContactNo,
drop NoofCourses;
rename table Departments to Departmentinfo;


alter table Course  
add LeadFaculty varchar(30),
add TotalStudent int,
rename column Credits to Credit,
drop LeadFaculty;
rename table Course to CourseInfo;


alter table Students
add GuardianName varchar(30),
add Ages int,
rename column Email to EmailID,
drop GuardianName;
rename table Students to StudentInfo;


alter table Faculty
add LeadFacultys varchar(20),
add TotalNoOfStudentss int,
Rename column Email to EmailID;

alter table Faculty
drop LeadFacultys;
rename table Faculty to FacultyInfo;


alter table Enrollements
add EnrollmentOfficers varchar(20),
add ParentName varchar(20),
rename column Grade to Grades,
drop ParentName;
rename table Enrollements to EnrollmentInfo;

desc DepartmentInfo;
/*

'DepartmentId', 'varchar(15)', 'NO', 'PRI', NULL, ''
'DepartmentName', 'varchar(20)', 'YES', '', NULL, ''
'HOD', 'varchar(15)', 'YES', '', NULL, ''
'ContactEmail', 'varchar(25)', 'YES', '', NULL, ''
'ContactNo', 'int', 'YES', '', NULL, ''
'Location', 'varchar(20)', 'YES', '', NULL, ''
'TotalStudents', 'int', 'YES', '', NULL, ''
'NoOfCourse', 'int', 'YES', '', NULL, ''
'TotalStudent', 'int', 'YES', '', NULL, ''

*/

desc CourseInfo;
/*
'CourseID', 'varchar(15)', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(20)', 'YES', '', NULL, ''
'Credit', 'int', 'YES', '', NULL, ''
'DepartmentID', 'varchar(20)', 'YES', 'MUL', NULL, ''
'Duration', 'int', 'YES', '', NULL, ''
'Fee', 'int', 'YES', '', NULL, ''
'TotalStudents', 'int', 'YES', '', NULL, ''
'LeadFaculty', 'varchar(30)', 'YES', '', NULL, ''
'TotalStudent', 'int', 'YES', '', NULL, ''

*/

desc StudentInfo;
/*

'StudentID', 'varchar(15)', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(15)', 'YES', '', NULL, ''
'LastName', 'varchar(15)', 'YES', '', NULL, ''
'EmailID', 'varchar(25)', 'YES', '', NULL, ''
'DateOfBirth', 'date', 'YES', '', NULL, ''
'CourseID', 'varchar(15)', 'YES', 'MUL', NULL, ''
'Age', 'int', 'YES', '', NULL, ''
'GuardianName', 'varchar(30)', 'YES', '', NULL, ''
'Ages', 'int', 'YES', '', NULL, ''

*/

desc FacultyInfo;
/*

'FacultyID', 'varchar(15)', 'NO', 'PRI', NULL, ''
'FacultyName', 'varchar(20)', 'YES', '', NULL, ''
'DepartmentID', 'varchar(20)', 'YES', 'MUL', NULL, ''
'Qualification', 'varchar(20)', 'YES', '', NULL, ''
'EmailID', 'varchar(20)', 'YES', '', NULL, ''
'PhoneNumber', 'int', 'YES', '', NULL, ''
'LeadFaculty', 'varchar(20)', 'YES', '', NULL, ''
'TotalNoOfStudents', 'int', 'YES', '', NULL, ''
'TotalNoOfStudentss', 'int', 'YES', '', NULL, ''

*/
desc EnrollmentInfo;
/*
'EnrollmentId', 'varchar(15)', 'YES', '', NULL, ''
'StudentID', 'varchar(15)', 'YES', 'MUL', NULL, ''
'CourseID', 'varchar(15)', 'YES', 'MUL', NULL, ''
'Semester', 'int', 'YES', '', NULL, ''
'EnrollDate', 'date', 'YES', '', NULL, ''
'Grades', 'varchar(100)', 'YES', '', NULL, ''
'EnrollmentOfficer', 'varchar(20)', 'YES', '', NULL, ''
'EnrollmentOfficers', 'varchar(20)', 'YES', '', NULL, ''
'ParentName', 'varchar(20)', 'YES', '', NULL, ''

*/




/*  Additional set of questions 
--1 Add a new column Address (VARCHAR(100)) to the Students table.
--2 Add a column Gender (CHAR(1)) to the Students table.
--3 Add a column JoiningDate (DATE) to the Faculty table.
--4 Modify the column CourseName in the Courses table to increase its size from VARCHAR(50) to VARCHAR(100).
--5 Modify the column Location in the Departments table to VARCHAR(80).
--6 Rename the column Qualification in the Faculty table to Degree.
--7 Rename the table Faculty to Teachers.
--8 Drop the column PhoneNumber from the Departments table.
--9 Drop the column Email from the Students table.
--10 Drop the column Duration from the Courses table.
*/

alter table StudentInfo
add Adress varchar(100),
add Sex char(1);
alter table StudentInfo
drop column EmailID;

alter table Teachers
add JoiningDate date,
rename column Qualification to Degree;


alter table CourseInfo
modify column CourseName Varchar(100),
drop column Duration;

alter table DepartmentInfo
modify column Location varchar(80),
drop column ContactNo;

rename table FacultyInfo to Teachers;



SHOW TABLES; -- Before dropping the table
/*
'courseinfo'
'departmentinfo'
'enrollmentinfo'
'studentinfo'
'teachers'
*/

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
drop table EnrollmentInfo;

alter table Studentinfo drop foreign key studentinfo_ibfk_1;
alter table CourseInfo drop CourseId;

drop table CourseInfo;

SHOW TABLES; -- After dropping the table Enrollement and Course
/*
'departmentinfo'
'studentinfo'
'teachers'
*/

-- Note: Perform the specified operations on all the 5 tables in the system
-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabScenario01