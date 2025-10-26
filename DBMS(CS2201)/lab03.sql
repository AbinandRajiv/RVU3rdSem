-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 02: Program 02 - Implementation of DML Commands in SQL ( INSERT , SELECT, UPDATE and DELETE )
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Abinand Rajiv
-- USN: 1RUA24BCA0003
-- SECTION: BCA A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
  'root@localhost', 'RVU-PC-058', '9.4.0', '2025-09-01 11:24:21'


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Scenario: You are managing a database for a library with two tables: Books and Members.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Task 01: Create Tables [ Check the below mentioned Instructions:
-- Create the Books and Members tables with the specified structure.
-- Books Table and Member Table : 
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task with the Instructed Column in the session 
Create Database Lib;
use lib;

Create table Books(
Book_ID varchar(15) primary key,
B_Name varchar(20),
Author varchar(25),
Published_Date date,
avail_copy int,
total_copy int);

Create table Member(
M_Id varchar(15) ,
M_Name varchar(20),
Contact_No int,
Pending_Return int,
NoOfReturns int);

alter table Books modify Published_Date int;
alter table Member add ( Membership_Level varchar(20));
alter table Member add ( Date_of_join date);
alter table Books add (Publish_Loc varchar(20));

-- Paste the Output below for the given command ( DESC TableName;) 
desc Books;

/*
'Book_ID', 'varchar(15)', 'NO', 'PRI', NULL, ''
'B_Name', 'varchar(20)', 'YES', '', NULL, ''
'Author', 'varchar(25)', 'YES', '', NULL, ''
'Published_Date', 'int', 'YES', '', NULL, ''
'avail_copy', 'int', 'YES', '', NULL, ''
'total_copy', 'int', 'YES', '', NULL, ''
'Publish_Loc', 'varchar(20)', 'YES', '', NULL, ''


 */
 
 desc Member;
 
/*

'M_Id', 'varchar(15)', 'YES', '', NULL, ''
'M_Name', 'varchar(20)', 'YES', '', NULL, ''
'Contact_No', 'int', 'YES', '', NULL, ''
'Pending_Return', 'int', 'YES', '', NULL, ''
'NoOfReturns', 'int', 'YES', '', NULL, ''
'Membership_Level', 'varchar(20)', 'YES', '', NULL, ''
'Date_of_join', 'date', 'YES', '', NULL, ''


*/
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 02: Insert a New Book
-- Instructions: Insert a book titled "1984_The Black Swan" by George Orwell (published in 1949) with 04 available copies and 10 Total copies. 
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

insert into Books values(
"B532","1984_The_Black_Swan","George Orwell",1949,4,10);
insert into Books values(
"B534","Silent Patient","Alex Michelaedes",2011,5,15),(
"B245","IN 27 DAYS","Michelle",2014,2,19);





-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
Select * From Books;
/*

# Book_ID, B_Name, Author, Published_Date, avail_copy, total_copy
'B532', '1984_The_Black_Swan', 'George Orwell', '1949', '4', '10'

*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 03: Add New Members
-- Instructions: Insert two members: David Lee (Platinum, joined 2024-04-15) and Emma Wilson (Silver, joined 2024-05-22).
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
Insert into Member values(
"M251","David Lee",90812234,4,10,"Platinum","2024-04-15"),(
"M532","Emma Wilson",80897662,2,16,"Silver","2024-05-22");
Insert into Member values(
"M234","Oscar Piastri",9087256,1,13,"Gold","2024-02-28"),(
"M237","Lando Norris",90827342,0,19,"Platinum","2024-01-04"),(
"M333","Max Verstappen",9033392,3,13,"Gold","2024-03-03");


-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
Select * From member;
/*

# M_Id, M_Name, Contact_No, Pending_Return, NoOfReturns, Membership_Level, Date_of_join
# M_Id, M_Name, Contact_No, Pending_Return, NoOfReturns, Membership_Level, Date_of_join
'M251', 'David Lee', '90812234', '4', '10', 'Platinum', '2024-04-15'
'M532', 'Emma Wilson', '80897662', '2', '16', 'Silver', '2024-05-22'
'M234', 'Oscar Piastri', '9087256', '1', '13', 'Gold', '2024-02-28'
'M237', 'Lando Norris', '90827342', '0', '19', 'Platinum', '2024-01-04'
'M333', 'Max Verstappen', '9033392', '3', '13', 'Gold', '2024-03-03'

*/
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 04: Update Book Details 
-- Instructions: The library acquired 2 additional copies of "1984_The Black Swan". Update the Books table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

update Books set total_copy= 12, avail_copy = 6 where Book_ID = "B532";

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
Select * from books;

/*

# Book_ID, B_Name, Author, Published_Date, avail_copy, total_copy, Publish_Loc
'B245', 'IN 27 DAYS', 'Michelle', '2014', '2', '19', NULL
'B532', '1984_The_Black_Swan', 'George Orwell', '1949', '6', '12', NULL
'B534', 'Silent Patient', 'Alex Michelaedes', '2011', '5', '15', NULL

*/
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 05: Modify a Member's Information
-- Instructions: Update a member's membership type. Emma Wilson has upgraded her membership from 'Silver' to 'Gold'.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
update Member 
set Membership_Level = "Gold" 
where M_Id = "M532";

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
Select * from Member;
/*

'M251', 'David Lee', '90812234', '4', '10', 'Platinum', '2024-04-15'
'M532', 'Emma Wilson', '80897662', '2', '16', 'Gold', '2024-05-22'
'M234', 'Oscar Piastri', '9087256', '1', '13', 'Gold', '2024-02-28'
'M237', 'Lando Norris', '90827342', '0', '19', 'Platinum', '2024-01-04'
'M333', 'Max Verstappen', '9033392', '3', '13', 'Gold', '2024-03-03'

*/
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 06: Remove a Member
-- Instructions: Delete David Lee’s record from the Members table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

Delete from member where M_ID = "M251";

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
Select * from Member;

/*
'M532', 'Emma Wilson', '80897662', '2', '16', 'Gold', '2024-05-22'
'M234', 'Oscar Piastri', '9087256', '1', '13', 'Gold', '2024-02-28'
'M237', 'Lando Norris', '90827342', '0', '19', 'Platinum', '2024-01-04'
'M333', 'Max Verstappen', '9033392', '3', '13', 'Gold', '2024-03-03'
*/
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 09: Borrowing Table 
-- Instructions: Create a Borrowing table with foreign keys referencing Books and Members.
-- Subtask 1: Borrow a Book
-- Scenario:Emma Wilson (member_id = 2) borrows the book "The Catcher in the Rye" (book_id = 102) on 2024-06-01. Insert this record into the Borrowing table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 10: Find the name of Borrower who book = 102 [ Advance and Optional ]
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Final Task 00: ER Diagram - Instructions:
-- Draw an ER diagram for the library database. Additional Upload the scanned copy of the created ER Daigram in the Google Classroom.



-- END of the Task -- 