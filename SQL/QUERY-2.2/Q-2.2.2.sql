-- CASE 2
-- Write an SQL query to report all the classes that have at least
-- five students. Return the result table in any order.

USE Student_db;

CREATE TABLE Courses(
student_id varchar(256) PRIMARY KEY,
class varchar(256)
);

insert into Courses
values('A', 'Math');
insert into Courses
values('B', 'English');
insert into Courses
values('C', 'Math');
insert into Courses
values('D', 'Biology');
insert into Courses
values('E', 'Math');
insert into Courses
values('F', 'Computer');
insert into Courses
values('G', 'Math');
insert into Courses
values('H', 'Math');
insert into Courses
values('I', 'Math');

select class from Courses
group by class
having count(class)>=5;