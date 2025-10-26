create database class;
use class;

create table student_marks(
student_name varchar(20),
age int,
subject_name varchar(25),
m1 int,
m2 int,
m3 int
);

insert into student_marks values
("Verstappen", 19, "DBMS", 15, 25, 25),
("Harsh", 19, "DBMS", 5, 5, 25),
("Lando", 19, "DBMS", 25, 25, 25),
("Rosberg", 19, "DBMS", 15, 10, 22),
("Neel", 19, "DBMS", 12, 3, 20),
("Hamilton", 19, "DBMS", 4, 5, 5),
("Webber", 19, "DBMS", 2, 14, 17),
("Cyril", 19, "DBMS", 15, 25, 2),
("Bortoleto", 19, "DBMS", 4, 25, 12),
("Carlos", 19, "DBMS", 1, 25, 5);

select * from student_marks;

/*

'Verstappen', '19', 'DBMS', '15', '25', '25'
'Harsh', '19', 'DBMS', '5', '5', '25'
'Lando', '19', 'DBMS', '25', '25', '25'
'Rosberg', '19', 'DBMS', '15', '10', '22'
'Neel', '19', 'DBMS', '12', '3', '20'
'Hamilton', '19', 'DBMS', '4', '5', '5'
'Webber', '19', 'DBMS', '2', '14', '17'
'Cyril', '19', 'DBMS', '15', '25', '2'
'Bortoleto', '19', 'DBMS', '4', '25', '12'
'Carlos', '19', 'DBMS', '1', '25', '5'

*/

alter table student_marks
add total_marks int,
add avg_marks int,
add percentage int;
    
alter table student_marks add result varchar(20);
        
update student_marks set total_marks = m1 + m2 + m3;

update student_marks set avg_marks = total_marks / 3;

update student_marks set percentage = (total_marks / 70.0) * 100;

update student_marks set result = 'pass' where total_marks >= 28;

update student_marks set result = 'fail' where total_marks < 28;

select * from student_marks;

/*

# student_name, age, subject_name, m1, m2, m3, total_marks, avg_marks, percentage, result
'Verstappen', '19', 'DBMS', '15', '25', '25', '65', '22', '93', 'pass'
'Harsh', '19', 'DBMS', '5', '5', '25', '35', '12', '50', 'pass'
'Lando', '19', 'DBMS', '25', '25', '25', '75', '25', '107', 'pass'
'Rosberg', '19', 'DBMS', '15', '10', '22', '47', '16', '67', 'pass'
'Neel', '19', 'DBMS', '12', '3', '20', '35', '12', '50', 'pass'
'Hamilton', '19', 'DBMS', '4', '5', '5', '14', '5', '20', 'fail'
'Webber', '19', 'DBMS', '2', '14', '17', '33', '11', '47', 'pass'
'Cyril', '19', 'DBMS', '15', '25', '2', '42', '14', '60', 'pass'
'Bortoleto', '19', 'DBMS', '4', '25', '12', '41', '14', '59', 'pass'
'Carlos', '19', 'DBMS', '1', '25', '5', '31', '10', '44', 'pass'

*/