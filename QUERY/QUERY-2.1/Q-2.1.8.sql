--  Write an SQL query to report the first name, last name, city,
-- and state of each person in the Person table. If the address
-- of a personId is not present in the Address table, report null
-- instead. Return the result table in any order.

USE Student_db;

CREATE TABLE Person (
  personId INT PRIMARY KEY,
  firstName VARCHAR(50),
  lastName VARCHAR(50)
);

INSERT INTO Person
VALUES(1, 'Wang' , 'Allen');

INSERT INTO Person
VALUES(2, 'Alice' , 'Bob');

SELECT * FROM Person;

CREATE TABLE Address (
  addressId INT PRIMARY KEY,
  personId INT,
  city VARCHAR(50),
  state VARCHAR(50),
  FOREIGN KEY (personId) REFERENCES Person(personId)
);
INSERT INTO Address
VALUES(1 ,1,'New york city' , 'New york');

INSERT INTO Address
VALUES(2,2,'Bhavagar','Gujarat');

SELECT * FROM Address;

select FirstName, LastName, City, State
from Person
left join Address
on Person.PersonId=Address.PersonId;