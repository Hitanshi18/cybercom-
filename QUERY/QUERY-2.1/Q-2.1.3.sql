--  Write an SQL query to swap all 'f' and 'm' values (i.e.,
-- change all 'f' values to 'm' and vice versa) with a single
-- update statement and no intermediate temporary tables.Note
-- that you must write a single update statement, do not write
-- any select statement for this problem


USE Student_db;
CREATE TABLE salary (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  sex ENUM('m', 'f'),
  salary INT
);
INSERT INTO salary
VALUES(1, 'Hitanshi', 'f' , 25000);
INSERT INTO salary
VALUES(2, 'Hiren' , 'm' , 23500);
INSERT INTO salary
VALUES(3, 'jenish' , 'm', 22000);
INSERT INTO salary
VALUES(4, 'Hitesha' , 'f' , 24000);
SELECT * FROM salary;

UPDATE Salary 
SET 
    sex = IF(sex = 'm', 'f', 'm');