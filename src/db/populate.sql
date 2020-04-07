-- Use the right db
USE TrainingRecords
GO

-- Insert some fake users
INSERT INTO dbo.Users
    (FirstName, LastName, Location, Department)
VALUES
    ('Bob', 'Smith', 'Redmond', 'Eng'),
    ('Sue', 'Jackson', 'Camas', 'Eng'),
    ('Mike', 'Johnson', 'Redmond', 'Admin'),
    ('Leslie', 'Ricter', 'Camas', 'Admin'),
    ('Eric', 'Arnold', 'Redmond', 'Tech'),
    ('Mandy', 'Ydnam', 'Camas', 'Tech'),
    ('Dude', 'Guy', 'Redmond', 'Writer'),
    ('Dude', 'Lady', 'Camas', 'Writer'),
    ('Some', 'Body', 'Redmond', 'Wildcard'),
    ('Happy', 'Sad', 'Camas', 'Wildcard')
GO

-- Insert some fake documents
INSERT INTO dbo.Documents
    (Name, Version)
VALUES
    ("How to eat cheese", "1.0"),
    ("Part assembly", "1.1"),
    ("Reporting farts", "2.0")
GO

--- Insert some fake completion records
INSERT INTO dbo.Completed
    (UserId, DocId, Version)
VALUES
    (1, 1, "1.0"),
    (1, 2, "1.1"),
    (2, 1, "1.0"),
    (2, 2, "1.1"),
    (3, 3, "2.0"),
    (4, 2, "1.0"),
    (5, 3, "2.0"),
    (6, 2, "1.1"),
    (7, 1, "1.0"),
    (8, 1, "1.0")
GO