-- Create the new database if it does not exist already
CREATE DATABASE TrainingRecords;
GO

-- Swith from using master to the new database
USE TrainingRecords;
GO

-- Create a new table called 'Users' in schema 'dbo'
CREATE TABLE Users
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
CREATE TABLE Documents
(
    Id INT IDENTITY(1, 1) PRIMARY KEY,
    -- primary key column
    Name [NVARCHAR](MAX) NOT NULL,
    Version INT NOT NULL
);
GO

-- Create a new table called 'Completed' in schema 'dbo'
CREATE TABLE Completed
(
    Id INT IDENTITY(1, 1) PRIMARY KEY,
    -- primary key column
    UserId INT NOT NULL FOREIGN KEY REFERENCES Users(Id),
    -- linked to users table
    DocId INT NOT NULL FOREIGN KEY REFERENCES Documents(Id),
    -- linked to documents table
    Version INT NOT NULL
);
GO

-- Create a stored procedure for getting the user details in schema 'dbo'
CREATE PROCEDURE DetailedUsers
AS
    -- Get a table of each users and the docs they should be trained on
    WITH UsersAndDocs AS (
        SELECT U.*, D.Id as DocId, d.Version AS DocVer
        FROM Users AS U
        CROSS JOIN Documents AS D
    ),

    -- Add in the version of the doc the user is trained on
    UsersAndTrainings AS (
        SELECT UD.*, C.Version as TrainedVer
        FROM UsersAndDocs as UD
        LEFT JOIN Completed as C
        ON UD.DocId = C.DocId AND UD.Id = C.UserId
    )

    -- Finally aggregate by user the number of completed and required trainings
    SELECT 
        Id, FirstName, LastName, Department, Location,
        SUM(CASE WHEN UT.TrainedVer >= UT.DocVer THEN 1 ELSE 0 END) AS TrainingsCompleted,
        COUNT(*) as TrainingsRequired
    FROM UsersAndTrainings AS UT
    GROUP BY Id, FirstName, LastName, Department, Location;
GO