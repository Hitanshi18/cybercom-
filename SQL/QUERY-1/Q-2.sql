USE Student_db;

CREATE TABLE College (
college_id INT PRIMARY KEY,
college_name VARCHAR(50),
college_address VARCHAR(100)
);

INSERT INTO College
VALUES (1 , "SSGEC" , "Bhavnagar");
INSERT INTO College
VALUES (2 , "GEC" , "Bhavnagar");
INSERT INTO College
VALUES (3 , "L.D. eng. college" , "Ahmedabad");
INSERT INTO College
VALUES (4 , "Marwadi university" , "Rajkot");

SELECT * FROM College;

CREATE TABLE Student (
student_id INT PRIMARY KEY,
student_name VARCHAR(50),
student_email VARCHAR(50),
college_id INT,
FOREIGN KEY (college_id) REFERENCES College(college_id)
);

INSERT INTO Student
VALUES(1 , "Hitanshi" , "hitanshishah2002@gmail.com" , 1 );

INSERT INTO Student
VALUES(2 , "Hiren" , "khiren39@gmail.com" , 2 );

INSERT INTO Student
VALUES(3 , "Hitesha" , "kamanihitesha@gmail.com" , 3 );

SELECT * FROM Student ;   
