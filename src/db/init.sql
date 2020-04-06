-- Connect to the 'master' database to first check if our database already exists
USE master
GO

-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
    FROM sys.databases
    WHERE name = N'TrainingRecords'
)
CREATE DATABASE TrainingRecords
GO

-- Swith from using master to the new database
USE TrainingRecords
GO

-- Create a new table called 'Users' in schema 'dbo'
IF OBJECT_ID('dbo.Users', 'U') IS NULL
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
IF OBJECT_ID('dbo.Documents', 'U') IS NULL
CREATE TABLE dbo.Documents
(
    Id INT IDENTITY(1, 1) PRIMARY KEY,
    -- primary key column
    Name [NVARCHAR](MAX) NOT NULL,
    Version [NVARCHAR](MAX) NOT NULL
);
GO

-- Create a new table called 'Completed' in schema 'dbo'
IF OBJECT_ID('dbo.Completed', 'U') IS NULL
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