MSSQL TRAINING

Introduction and Basics

What is a Database?
What is MSSQL Server?
What is SQL Server Management Studio (SSMS)?
Database Objects

Server
Database
Tables
Views
Functions
Stored Procedures
Triggers
Jobs
SQL Data Types

Text Data Types
char
nchar
varchar
nvarchar
text
ntext
Binary Data Types
bit
binary
varbinary
image
Numeric Data Types
bit
bigint
smallint
tinyint
decimal
numeric
Monetary Data Types
money
smallmoney
Date and Time Data Types
date
smalldatetime
datetime
datetime2
time
datetimeoffset
Other Data Types
Basic SQL Commands

What are CRUD Operations?
Data Retrieval (SELECT)
TOP
DISTINCT
ORDER BY
GROUP BY
Record Search (WHERE)
NOT
AND
OR
LIKE
IN
BETWEEN
IS NULL
IS NOT NULL
Data Insertion, Update, and Deletion
INSERT
UPDATE
DELETE
Relational Databases and JOINs

Indexes
Primary Key
Secondary Key
Foreign Key
Connecting Tables
Using WHERE
INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL OUTER JOIN
SELF JOIN
CROSS JOIN
UNION
UNION ALL
Functions

Mathematical Functions
ABS, ACOS, ASIN, ATAN, ATN2, CEILING, COS, COT, DEGREES, EXP, FLOOR, LOG, LOG10, PI, POWER, RADIANS, RAND, ROUND, SIGN, SIN, SQRT, SQUARE, TAN
Text Functions
CHAR, CHARINDEX, CONCAT, STR, LEN, SUBSTRING, LOWER, UPPER, LEFT, RIGHT, LTRIM, RTRIM, TRIM, REPLACE, STRING_AGG
Date and Time Functions
GETDATE, DAY, MONTH, YEAR, DATEADD, DATEDIFF, DATEPART
Aggregate Functions
SUM, AVG, COUNT, MIN, MAX
Other Functions
COALESCE, CASE, NULLIF, NEWID
Table Operations

CREATE
ALTER
DELETE
TRUNCATE
CLONE
View Operations

CREATE
ALTER
DELETE
CLONE
Advanced SQL Topics

JSON
What is JSON?
JSON_VALUE
JSON_QUERY
JSON_ARRAY
ISJSON
Database Diagram
TSQL
DECLARE
PRINT
WHILE
SET
DECLARE CURSOR
OPEN
FETCH
DEALLOCATE
PIVOT Operations
Subqueries
CTE (Common Table Expressions)
Stored Procedures and Usage
Functions
Scalar Functions
Table-Valued Functions
Triggers
Transactions and Error Handling
BEGIN TRANS
TRY
CATCH
ROLLBACK
COMMIT
Performance and Security

What is an Index? Types and Usage
Query Optimization (Improving Query Performance)
Reading Execution Plans
User Authorization and Role-Based Security
Additional Topics

Database Backup and Restore
BACKUP
RESTORE
Automated Tasks (SQL Server Agent Jobs)
Database Design - Normalization
Identifying Problematic SQL and KILL Operations

--Installation

--------Open a blank database called Northwind
--------With this database selected, open the query
--------Run the query with this database selected, it will create the tables