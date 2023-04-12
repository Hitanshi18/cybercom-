-- Assume you are working on a database for a car dealership. 

use Student_db;

CREATE TABLE Cars (
    CarID int PRIMARY KEY,
    Brand varchar(50),
    Model varchar(50),
    Year int,
    Mileage int,
    Price decimal(10,2),
    Available bit
);
INSERT INTO Cars
VALUES 
 (1, 'Toyota', 'Camry', 2022, 2000, 24000, 1),
 (2, 'Honda', 'Civic', 2021, 5000, 18000, 1),
(3 , 'lucid' , 'air' , 2023, 200, 200000, 1),
(4,'Armada' ,'Nissan', 2022, 2000,30000,1),
(5, 'Aventador', 'Lamborghini' , 2022, 1000, 50000,1),
(6, 'Chevrolet', 'Blazer EV', 2020 , 3000,60000, 1),
(7, 'Bronco', 'Ford', 2019, 2000,38000, 1),
(8, 'Maruti', 'Brezza', 2018, 1500,90000, 1),
(9, 'Maruti', 'Swift', 2017, 2000,75000, 1),
(10, 'Tata', 'Sfari', 2016, 1000,48000, 1),
(11, 'Honda','Amaze',2018, 1000,63000,1),
(12, 'Renault', 'Duster', 2019, 2000,72400,1),
(13,'Toyota','Glanza',2016,1000,82600,1);

CREATE TABLE Custom (
    CustomID int PRIMARY KEY,
    FirstName varchar(50),
    LastName varchar(50),
    Email varchar(100),
    PhoneNumber varchar(20)
);

INSERT INTO Custom
VALUES (1, 'John', 'Doe', 'johndoe@example.com', '555-555-1234'),
(2, 'Jane', 'Smith', 'janesmith@example.com', '555-555-5678'),
(3, 'Mahi', 'Raval', 'ravalmahi@gmail.com', '444-663-2564'),
(4, 'Bob', 'Alice', 'alicebob@gmail.com', '32-635-9852'),
(5, 'juhi', 'chavda', 'chavdajuhi@gmail.com', '122-554-7230');

CREATE TABLE Sale (
    SaleID int PRIMARY KEY,
    CarID int,
    CustomID int,
    SaleDate date,
    SalePrice decimal(10,2),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (CustomID) REFERENCES Custom(CustomID)
);

INSERT INTO Sale
VALUES (1, 1, 1, '2023-02-20', 22000.00),
 (2, 2, 2, '2023-02-21', 17000.00),
 (3,3,3, '2021-12-28', 27500.00),
 (4,4,4,'2023-01-28', 35400.00),
 (5,5,5,'2023-02-12', 38800.00);

-- 1. Retrieve the top 10 most expensive cars from the Cars
-- table.

SELECT TOP 10 Brand, Model, Price
FROM Cars
ORDER BY Price DESC;

-- 2. Retrieve the average price of all available cars from the
-- Cars table.

SELECT AVG(Price) as AveragePrice
FROM Cars
WHERE Available = 1;


-- 3. Retrieve the list of customers who have purchased a car,
-- along with the total number of cars each customer has
-- purchased.

SELECT c.FirstName, c.LastName, COUNT(s.CarID) AS NumCarsPurchased
FROM Customers c
INNER JOIN Sale s ON c.CustomID = s.CustomID
GROUP BY c.CustomID;


-- 4. Retrieve the list of customers who have not yet made a
-- purchase.

SELECT c.FirstName, c.LastName, c.Email, c.PhoneNumber
FROM Custom c
LEFT JOIN Sale s ON c.CustomerID = s.CustomID
WHERE s.SaleID IS NULL;

-- 5. Insert a new car into the Cars table with the following
-- information: Brand='Toyota', Model='Corolla', Year=2022,
-- Mileage=0, Price=20000, Available=1.

INSERT INTO Cars (Brand, Model, Year, Mileage, Price, Available)
VALUES ('Toyota', 'Corolla', 2022, 0, 20000, 1);

-- 6. Update the price of all cars in the Cars table by adding
-- 10% to their current price.

UPDATE Cars
SET Price = Price * 1.1;

-- 7. Delete all sales from the Sales table that occurred before
-- January 1, 2022.

DELETE FROM Sale
WHERE SaleDate < '2022-01-01';
