-- Use the right db
USE TrainingRecords
GO

-- Insert some fake users
INSERT INTO dbo.Users (FirstName, LastName, Location, Department)
VALUES ('Bob', 'Smith', 'Redmond', 'Eng')
GO

INSERT INTO dbo.Users (FirstName, LastName, Location, Department)
VALUES ('Sue', 'Jackson', 'Camas', 'Eng')
GO

INSERT INTO dbo.Users (FirstName, LastName, Location, Department)
VALUES ('Mike', 'Johnson', 'Redmond', 'Admin')
GO

INSERT INTO dbo.Users (FirstName, LastName, Location, Department)
VALUES ('Leslie', 'Ricter', 'Camas', 'Admin')
GO

INSERT INTO dbo.Users (FirstName, LastName, Location, Department)
VALUES ('Eric', 'Arnold', 'Redmond', 'Tech')
GO

INSERT INTO dbo.Users (FirstName, LastName, Location, Department)
VALUES ('Mandy', 'Ydnam', 'Camas', 'Tech')
GO

INSERT INTO dbo.Users (FirstName, LastName, Location, Department)
VALUES ('Dude', 'Guy', 'Redmond', 'Writer')
GO

INSERT INTO dbo.Users (FirstName, LastName, Location, Department)
VALUES ('Dude', 'Lady', 'Camas', 'Writer')
GO

INSERT INTO dbo.Users (FirstName, LastName, Location, Department)
VALUES ('Some', 'Body', 'Redmond', 'Wildcard')
GO

INSERT INTO dbo.Users (FirstName, LastName, Location, Department)
VALUES ('Happy', 'Sad', 'Camas', 'Wildcard')
GO

-- Insert some fake documents
INSERT INTO dbo.Documents (Name, Version)
VALUES ("How to eat cheese", "1.0")
GO

INSERT INTO dbo.Documents (Name, Version)
VALUES ("Part assembly", "1.1")
GO

INSERT INTO dbo.Documents (Name, Version)
VALUES ("Reporting farts", "2.0")
GO

--- Insert some fake completion records
INSERT INTO dbo.Completed (UserId, DocId, Version)
VALUES (1, 1, "1.0")
GO

INSERT INTO dbo.Completed (UserId, DocId, Version)
VALUES (1, 2, "1.1")
GO

INSERT INTO dbo.Completed (UserId, DocId, Version)
VALUES (2, 1, "1.0")
GO

INSERT INTO dbo.Completed (UserId, DocId, Version)
VALUES (2, 2, "1.1")
GO

INSERT INTO dbo.Completed (UserId, DocId, Version)
VALUES (3, 3, "2.0")
GO

INSERT INTO dbo.Completed (UserId, DocId, Version)
VALUES (4, 2, "1.0")
GO

INSERT INTO dbo.Completed (UserId, DocId, Version)
VALUES (5, 3, "2.0")
GO

INSERT INTO dbo.Completed (UserId, DocId, Version)
VALUES (6, 2, "1.1")
GO

INSERT INTO dbo.Completed (UserId, DocId, Version)
VALUES (7, 1, "1.0")
GO

INSERT INTO dbo.Completed (UserId, DocId, Version)
VALUES (8, 1, "1.0")
GO