--  Create a database schema for student grade system. It contains
-- student data and their grade of each subject based on the
-- different semester


USE Student_db;

CREATE TABLE Stud (
  student_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  date_of_birth DATE ,
  address VARCHAR(100)
);

INSERT INTO Stud
VALUES(1, 'Hitanshi', 'Shah' , 'hitanshishah2002@gmail.com',  '2002-05-18', 'Bhavnagar');
INSERT INTO Stud
VALUES(2, 'Hiren' , 'Khunt', 'khiren@gmail.com',2001-11-07, 'Surat');
INSERT INTO Stud
VALUES(3 , 'Hitesha', 'Kamani', 'kamanihitesha@gmail.com' ,'2002-11-08', 'Keshod');
INSERT INTO Stud
VALUES(4, 'Vishwa', 'Sutariya', 'sutariyavishwa@gmiail.com' , '2002-02-22', 'Valbhipur');
INSERT INTO Stud
VALUES(5 , 'Jenish' 'Paladiya' , 'paladiyajenish01@gmail.com', '2002-07-30', 'Surat');

SELECT * FROM Stud;


CREATE TABLE Subjects (
  subject_id INT PRIMARY KEY,
  subject_name VARCHAR(50)
);
INSERT INTO Subjects
VALUES(1, 'PPS');
INSERT INTO Subjects
VALUES(2 , 'DS');
INSERT INTO Subjects
VALUES(3, 'CS');
INSERT INTO Subjects
VALUES(4, 'DBMS');
INSERT INTO Subjects
VALUES(5, 'JAVA');

SELECT * FROM Subjects;

CREATE TABLE Semesters (
  semester_id INT PRIMARY KEY,
  semester_name VARCHAR(50),
  start_date DATE,
  end_date DATE
);
INSERT INTO Semesters
VALUES(1, 'first', '2019-07-30', '2019-12-30');
INSERT INTO Semesters
VALUES(2, 'second', '2020-02-01', '2020-07-05');
INSERT INTO Semesters
VALUES(3, 'third', '2020-09-13', '2021-02-21');
INSERT INTO Semesters
VALUES(4, 'fourth', '2021-03-15', '2021-0830');
INSERT INTO Semesters
VALUES(5, 'fifth',  '2021-09-25', ' 2022-02-10');

SELECT * FROM Semesters;

CREATE TABLE Grades (
  grade_id INT PRIMARY KEY,
  stud_id INT,
  subject_id INT,
  semester_id INT,
  grade DECIMAL(5,2),
  FOREIGN KEY (stud_id) REFERENCES Stud(stud_id),
  FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id),
  FOREIGN KEY (semester_id) REFERENCES Semesters(semester_id)
);
INSERT INTO Grades
VALUES(1,1,1,2,7.9);
INSERT INTO Grades
VALUES(2,2,3,3,8.5);
INSERT INTO Grades
VALUES(3,3,2,2,9.4);
INSERT INTO Grades
VALUES(4,4,5,5,6.4);
INSERT INTO Grades
VALUES(5,5,4,1,9.9);

SELECT * FROM Grades;