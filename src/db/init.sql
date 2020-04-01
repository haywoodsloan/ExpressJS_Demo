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
    UsersId INT NOT NULL PRIMARY KEY,
    -- primary key column
    FName [NVARCHAR](MAX) NOT NULL,
    LName [NVARCHAR](MAX) NOT NULL,
    Department [NVARCHAR](MAX) NOT NULL,
);
GO