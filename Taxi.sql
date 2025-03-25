CREATE DATABASE Taxi


CREATE TABLE Drivers
(
driver_id INT PRIMARY KEY IDENTITY(1,1),
name NVARCHAR(100),
phone_number NVARCHAR(100)
)

CREATE TABLE Cars
(
car_id INT PRIMARY KEY IDENTITY(1,1),
licence_plate NVARCHAR(10),
model NVARCHAR(10)
)

CREATE TABLE Customers
(
customer_id INT PRIMARY KEY IDENTITY(1,1),
name NVARCHAR(100),
phone_number NVARCHAR(100)
)

CREATE TABLE Rides
(
ride_id INT PRIMARY KEY IDENTITY(1,1),
driver_id INT FOREIGN KEY REFERENCES Drivers(driver_id)  ON DELETE CASCADE ON UPDATE CASCADE,
car_id INT FOREIGN KEY REFERENCES Cars(car_id) ON DELETE SET NULL ON UPDATE CASCADE,
customer_id INT FOREIGN KEY REFERENCES Customers(customer_id) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
pickup_location NVARCHAR(100),
dropoff_location NVARCHAR(100),
fare INT
)

INSERT INTO Drivers (name, phone_number) VALUES
('Ivan Petrov', '0888123456'),
('Georgi Ivanov', '0899123456'),
('Petar Dimitrov', '0878123456'),
('Nikolay Stoyanov', '0887654321'),
('Stefan Yordanov', '0899765432');

INSERT INTO Cars (licence_plate, model) VALUES
('CA1234AB', 'Toyota'),
('CB5678CD', 'BMW'),
('CC9876EF', 'Mercedes'),
('CA5432GH', 'Ford'),
('CB1111JK', 'Audi');

INSERT INTO Customers (name, phone_number) VALUES
('Maria Ivanova', '0888999000'),
('Dimitar Kolev', '0877665544'),
('Elena Petrova', '0899222333'),
('Radoslav Stefanov', '0888555777'),
('Svetlana Dimitrova', '0877999888');

INSERT INTO Rides (driver_id, car_id, customer_id, pickup_location, dropoff_location, fare) VALUES
(1, 1, 2, 'Sofia Center', 'Mladost', 20),
(2, 2, 3, 'Nadezhda', 'Lulin', 15),
(3, 3, 4, 'Druzhba', 'Studentski Grad', 25),
(4, 4, 5, 'Boyana', 'Lozenets', 30),
(5, 5, 2, 'Obelya', 'Gorublyane', 18);


DELETE FROM Drivers WHERE driver_id = 1;

DELETE FROM Cars WHERE car_id = 2;

DELETE FROM Customers WHERE customer_id = 3;


UPDATE Drivers
SET name = 'Pavel Hristov', phone_number = '0888111222'
WHERE driver_id = 1;

UPDATE Cars
SET licence_plate = 'CB9999AA', model = 'Tesla'
WHERE car_id = 2;

UPDATE Customers
SET name = 'Georgi Petrov', phone_number = '0877555666'
WHERE customer_id = 3;
