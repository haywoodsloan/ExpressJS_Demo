-- Create the new database if it does not exist already
CREATE DATABASE TrainingRecords
GO

-- Swith from using master to the new database
USE TrainingRecords
GO

-- Create a new table called 'Users' in schema 'dbo'
CREATE TABLE dbo.Users
(
    Id INT IDENTITY(1, 1) PRIMARY KEY,
    -- primary key column
    FirstName [NVARCHAR](MAX) NOT NULL,
    LastName [NVARCHAR](MAX) NOT NULL,
    Location [NVARCHAR](MAX) NOT NULL,
    Department [NVARCHAR](MAX) NOT NULL,
);
GO

-- Create a new table called 'Documents' in schema 'dbo'
CREATE TABLE dbo.Documents
(
    Id INT IDENTITY(1, 1) PRIMARY KEY,
    -- primary key column
    Name [NVARCHAR](MAX) NOT NULL,
    Version [NVARCHAR](MAX) NOT NULL
);
GO

-- Create a new table called 'Completed' in schema 'dbo'
CREATE TABLE dbo.Completed
(
    Id INT IDENTITY(1, 1) PRIMARY KEY,
    -- primary key column
    UserId INT NOT NULL FOREIGN KEY REFERENCES dbo.Users(Id),
    -- linked to users table
    DocId INT NOT NULL FOREIGN KEY REFERENCES dbo.Documents(Id),
    -- linked to documents table
    Version [NVARCHAR](MAX) NOT NULL
);
GO

-- Create a stored procedure for getting the user details in schema 'dbo'
CREATE PROCEDURE dbo.DetailedUsers
AS
    -- body of the stored procedure
    SELECT Users.*, IsNull(Completed.Count, 0) AS TrainingsCompleted
    FROM Users
    LEFT JOIN (
        SELECT Count(*) AS Count, UserId 
        FROM Completed
        GROUP BY UserId 
    ) Completed ON Completed.UserId=Users.Id
GO