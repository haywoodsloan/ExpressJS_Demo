-- Use the right db
USE TrainingRecords
GO

-- Insert some fake users
INSERT INTO dbo.Users (Id, FirstName, LastName, Location, Department)
VALUES (1, 'Bob', 'Smith', 'Redmond', 'Eng')
GO

INSERT INTO dbo.Users (Id, FirstName, LastName, Location, Department)
VALUES (2, 'Sue', 'Jackson', 'Camas', 'Eng')
GO

INSERT INTO dbo.Users (Id, FirstName, LastName, Location, Department)
VALUES (3, 'Mike', 'Johnson', 'Redmond', 'Admin')
GO

INSERT INTO dbo.Users (Id, FirstName, LastName, Location, Department)
VALUES (4, 'Leslie', 'Ricter', 'Camas', 'Admin')
GO

INSERT INTO dbo.Users (Id, FirstName, LastName, Location, Department)
VALUES (5, 'Eric', 'Arnold', 'Redmond', 'Tech')
GO

INSERT INTO dbo.Users (Id, FirstName, LastName, Location, Department)
VALUES (6, 'Mandy', 'Ydnam', 'Camas', 'Tech')
GO

INSERT INTO dbo.Users (Id, FirstName, LastName, Location, Department)
VALUES (7, 'Dude', 'Guy', 'Redmond', 'Writer')
GO

INSERT INTO dbo.Users (Id, FirstName, LastName, Location, Department)
VALUES (8, 'Dude', 'Lady', 'Camas', 'Writer')
GO

INSERT INTO dbo.Users (Id, FirstName, LastName, Location, Department)
VALUES (9, 'Some', 'Body', 'Redmond', 'Wildcard')
GO

INSERT INTO dbo.Users (Id, FirstName, LastName, Location, Department)
VALUES (10, 'Happy', 'Sad', 'Camas', 'Wildcard')
GO