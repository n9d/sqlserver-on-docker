CREATE DATABASE TestDB
go
SELECT Name from sys.Databases
USE TestDB
CREATE TABLE Inventory (id INT, name NVARCHAR(50), quantity INT)
go
INSERT INTO Inventory VALUES (1, 'banana', 150); INSERT INTO Inventory VALUES (2, 'orange', 154);
go
