-- Use the right db
USE TrainingRecords;
GO

-- Insert some fake users
INSERT INTO Users
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
    ('Some', 'Body', 'Redmond', 'HR'),
    ('Happy', 'Sad', 'Camas', 'HR');
GO

-- Insert some fake documents
INSERT INTO Documents
    (Name, Version)
VALUES
    ('How to eat cheese', 1),
    ('Part assembly', 2),
    ('Reporting smells', 5),
    ('Secret tunnels', 8),
    ('How to cook eggs', 4),
    ('10 steps to walking up stairs', 3);
GO

--- Insert some fake completion records
INSERT INTO Completed
    (UserId, DocId, Version)
VALUES
    (1, 1, 1),
    (1, 2, 2),
    (1, 3, 5),
    (2, 1, 1),
    (2, 2, 2),
    (2, 4, 8),
    (3, 3, 5),
    (3, 4, 5),
    (4, 2, 2),
    (4, 3, 5),
    (4, 5, 3),
    (4, 6, 3),
    (5, 3, 5),
    (5, 4, 8),
    (6, 2, 2),
    (6, 5, 4),
    (7, 1, 1),
    (7, 6, 3),
    (8, 1, 1),
    (8, 6, 2),
    (9, 4, 7),
    (10, 1, 1);
GO