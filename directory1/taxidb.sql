CREATE DATABASE TAXI
DROP DATABASE TAXI
USE TAXI
CREATE TABLE Users (
                       UserId INT PRIMARY KEY IDENTITY,
                       Name NVARCHAR(100) NOT NULL,
                       Email NVARCHAR(100) UNIQUE NOT NULL,
                       Phone NVARCHAR(15) NOT NULL,
                       CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Drivers (
                         DriverId INT PRIMARY KEY IDENTITY,
                         Name NVARCHAR(100) NOT NULL,
                         Email NVARCHAR(100) UNIQUE NOT NULL,
                         Phone NVARCHAR(15) NOT NULL,
                         LicenseNumber NVARCHAR(50) UNIQUE NOT NULL,
                         VehicleId INT,
                         CreatedAt DATETIME DEFAULT GETDATE(),
                         FOREIGN KEY (VehicleId) REFERENCES Vehicles(VehicleId)
);

CREATE TABLE Vehicles (
                          VehicleId INT PRIMARY KEY IDENTITY,
                          LicensePlate NVARCHAR(20) UNIQUE NOT NULL,
                          Model NVARCHAR(50) NOT NULL,
                          Make NVARCHAR(50) NOT NULL,
                          Year INT NOT NULL
);

CREATE TABLE Rides (
                       RideId INT PRIMARY KEY IDENTITY,
                       UserId INT,
                       DriverId INT,
                       StartLocationId INT,
                       EndLocationId INT,
                       StartTime DATETIME NOT NULL,
                       EndTime DATETIME,
                       Status NVARCHAR(20) NOT NULL,
                       FOREIGN KEY (UserId) REFERENCES Users(UserId),
                       FOREIGN KEY (DriverId) REFERENCES Drivers(DriverId),
                       FOREIGN KEY (StartLocationId) REFERENCES Locations(LocationId),
                       FOREIGN KEY (EndLocationId) REFERENCES Locations(LocationId)
);

CREATE TABLE Locations (
                           LocationId INT PRIMARY KEY IDENTITY,
                           Latitude FLOAT NOT NULL,
                           Longitude FLOAT NOT NULL,
                           Address NVARCHAR(255) NOT NULL
);

INSERT INTO Users (Name, Email, Phone) VALUES ('Alice Smith', 'alice@gmail.com', '555-1234');
INSERT INTO Users (Name, Email, Phone) VALUES ('Bob Johnson', 'bob@gmail.com', '555-5678');
INSERT INTO Vehicles (LicensePlate, Model, Make, Year) VALUES ('ABC123', 'Camry', 'Toyota', 2020);
INSERT INTO Vehicles (LicensePlate, Model, Make, Year) VALUES ('XYZ789', 'Accord', 'Honda', 2021);
INSERT INTO Drivers (Name, Email, Phone, LicenseNumber, VehicleId) VALUES ('John Doe', 'john@gmail.com', '555-9876', 'D1234567', 1);
INSERT INTO Drivers (Name, Email, Phone, LicenseNumber, VehicleId) VALUES ('Jane Roe', 'jane@gmail.com', '555-5432', 'D7654321', 2);
INSERT INTO Locations (Latitude, Longitude, Address) VALUES (40.7128, -74.0060, '123 Main St, New York, NY');
INSERT INTO Locations (Latitude, Longitude, Address) VALUES (40.7308, -73.9973, '456 Elm St, New York, NY');
INSERT INTO Rides (UserId, DriverId, StartLocationId, EndLocationId, StartTime, Status) VALUES (1, 1, 1, 2, '2024-09-01 08:00:00', 'Completed');
INSERT INTO Rides (UserId, DriverId, StartLocationId, EndLocationId, StartTime, Status) VALUES (2, 2, 2, 1, '2024-09-02 09:00:00', 'Pending');
