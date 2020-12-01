-- Creating database with my initials
CREATE DATABASE dvg;

--Connecting database 
\c dvg; 

--Table Creation Statements
CREATE TABLE Student (
  Sid       INTEGER   PRIMARY KEY,
  Sname     VARCHAR(15) NOT NULL
);

--Populating Tables
INSERT INTO Student VALUES
(1001,'Jean'),
(1002,'Maria'),
(1003,'Anna'),
(1004,'Chin'),
(1005,'John'),
(1006,'Ryan'),
(1007,'Catherine'),
(1008,'Emma'),
(1009,'Jan'),
(1010,'Linda'),
(1011,'Nick'),
(1012,'Eric'),
(1013,'Lisa'),
(1014,'Filip'),
(1015,'Dirk'),
(1016,'Mary'),
(1017,'Ellen'),
(1020,'Greg'),
(1022,'Qin'),
(1023,'Melanie'),
(1040,'Pam');

--Sample queries

\qecho 'Question 1 (a)'

SELECT s.sname FROM Student s
 WHERE s.sid > 1010;

\qecho 'Question 1 (b)'

SELECT s.sname FROM Student s
 WHERE s.sid > 1001 
   AND s.sid < 1010;

--Connect to default database
\c postgres;

--Drop database which you created
DROP DATABASE dvg;