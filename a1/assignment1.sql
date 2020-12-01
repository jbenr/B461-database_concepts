CREATE DATABASE jbr;

\c jbr;

drop table if exists employee;
drop table if exists company;
drop table if exists jobskill;
drop table if exists manages;

--I worked with Zunaeed S. and Jackson E. on this assignment

\qecho 'Question 1'
\qecho '1.'
CREATE TABLE employee
(
    id integer,
    ename text,
    city text,
    cname text,
    salary integer,
    PRIMARY KEY (id)
);

CREATE TABLE company
(
    cname text,
    city text,
    PRIMARY KEY (cname, city)
);

CREATE TABLE jobskill
(
    id integer,
    skill text,
    PRIMARY KEY (id, skill),
    FOREIGN KEY (id) REFERENCES Employee(id)
);

CREATE TABLE manages
(
    mid integer,
    eid integer,
    PRIMARY KEY (mid, eid),
    FOREIGN KEY (mid) REFERENCES Employee(id),
    FOREIGN KEY (eid) REFERENCES Employee(id)
);

-- Data for the employee relation.
INSERT INTO employee
VALUES
    (1001, 'Jean', 'Bloomington', 'Apple', 60000),
    (1002, 'Vidya', 'Indianapolis', 'Apple', 45000),
    (1003, 'Anna', 'Chicago', 'Amazon', 55000),
    (1004, 'Qin', 'Denver', 'Amazon', 55000),
    (1005, 'Aya', 'Chicago', 'Google', 60000),
    (1006, 'Ryan', 'Chicago', 'Amazon', 55000),
    (1007, 'Danielle', 'Indianapolis', 'Netflix', 50000),
    (1008, 'Emma', 'Bloomington', 'Amazon', 50000),
    (1009, 'Hasan', 'Bloomington', 'Apple', 60000),
    (1010, 'Linda', 'Chicago', 'Amazon', 55000),
    (1011, 'Nick', 'NewYork', 'Google', 55000),
    (1012, 'Eric', 'Indianapolis', 'Apple', 50000),
    (1013, 'Lisa', 'Indianapolis', 'Netflix', 55000),
    (1014, 'Deepa', 'Bloomington', 'Apple', 50000),
    (1015, 'Chris', 'Denver', 'Amazon', 60000),
    (1016, 'YinYue', 'Chicago', 'Amazon', 55000),
    (1017, 'Latha', 'Indianapolis', 'Netflix', 60000),
    (1018, 'Arif', 'Bloomington', 'Apple', 50000);

-- Data for the company relation.
INSERT INTO company
VALUES
    ('Apple', 'Bloomington'),
    ('Amazon', 'Chicago'),
    ('Amazon', 'Denver'),
    ('Amazon', 'Columbus'),
    ('Google', 'NewYork'),
    ('Netflix', 'Indianapolis'),
    ('Netflix', 'Chicago'),
    ('Microsoft', 'Bloomington');

-- Data for the jobskill relation.
insert into jobskill
values
    (1001, 'Programming'),
    (1001, 'AI'),
    (1002, 'Programming'),
    (1002, 'AI'),
    (1004, 'AI'),
    (1004, 'Programming'),
    (1005, 'AI'),
    (1005, 'Programming'),
    (1005, 'Networks'),
    (1006, 'Programming'),
    (1006, 'OperatingSystems'),
    (1007, 'OperatingSystems'),
    (1007, 'Programming'),
    (1008, 'Programming'),
    (1009, 'OperatingSystems'),
    (1009, 'Networks'),
    (1010, 'Networks'),
    (1011, 'Networks'),
    (1011, 'OperatingSystems'),
    (1011, 'AI'),
    (1011, 'Programming'),
    (1012, 'AI'),
    (1012, 'OperatingSystems'),
    (1012, 'Programming'),
    (1013, 'Programming'),
    (1013, 'AI'),
    (1013, 'OperatingSystems'),
    (1013, 'Networks'),
    (1014, 'OperatingSystems'),
    (1014, 'AI'),
    (1014, 'Programming'),
    (1014, 'Networks'),
    (1015, 'Programming'),
    (1015, 'AI'),
    (1016, 'Programming'),
    (1016, 'OperatingSystems'),
    (1016, 'AI'),
    (1017, 'Networks'),
    (1017, 'Programming'),
    (1018, 'AI');


-- Data for the manages relation.
INSERT INTO manages
VALUES
    (1001, 1002),
    (1001, 1009),
    (1001, 1012),
    (1009, 1018),
    (1009, 1014),
    (1012, 1014),
    (1003, 1004),
    (1003, 1006),
    (1003, 1015),
    (1015, 1016),
    (1006, 1008),
    (1006, 1016),
    (1016, 1010),
    (1005, 1011),
    (1013, 1007),
    (1013, 1017);

SELECT *
FROM employee;
SELECT *
FROM company;
SELECT *
FROM jobskill;
SELECT *
FROM manages;

\qecho '2.'
CREATE TABLE specialtable
(
    id integer,
    ename text,
    FOREIGN KEY (ename) REFERENCES employee(ename)
);

INSERT INTO specialtable
VALUES
    (1001, 'Jean'),
    (1004, 'Qin'),
    (1009, 'Hasan'),
    (1014, 'Deepa'),
    (1016, 'YinYue'),
    (1018, 'Arif');

\qecho 'This insertion will run because the relation has no keys'
INSERT INTO company
VALUES
    ('Windy', 'City');

\qecho 'This deletion will run because the relation has no keys'
DELETE FROM company
WHERE cname = 'Windy';

\qecho 'This deletion will run because jobskill has no keys'
DELETE from jobskill
WHERE skill = 'AI';

\qecho 'This insertion will not run because we are adding a primary key value, which must be unique'
INSERT INTO employee VALUES
(1001, 'Ben', 'Charlottesville', 'NASA', 1000000);

\qecho 'Deleting'
DELETE FROM employee
WHERE ename = 'Ben';

\qecho 'This deletion will not run because ename is a foreign key in specialtable'
DELETE FROM employee
WHERE ename = 'Jean';

\qecho 'This insertion will not run because ename is a foreign key in specialtable and Hunter is not in employees'
INSERT INTO specialtable
VALUES
    (1019, 'Hunter');

\qecho 'Question 2';
\qecho '1.'
SELECT DISTINCT e.id, e.ename, e.salary
FROM employee e
WHERE e.salary >= 30000
    AND e.salary <= 50000
    AND e.city = 'Indianapolis';

\qecho '2.'
SELECT DISTINCT e.id, e.ename
FROM (SELECT e.id, e.ename
    FROM employee e
    WHERE e.cname IN (SELECT c.cname
    FROM company c
    WHERE c.city = 'Chicago')) e
WHERE e.id IN (SELECT m.eid
FROM manages m
WHERE m.mid IN (SELECT e.id
FROM employee e
WHERE e.city = 'Bloomington'));

\qecho '3.'
SELECT DISTINCT e.id, e.ename
FROM employee e, manages m
WHERE e.id = m.eid
    AND m.mid IN (SELECT DISTINCT e2.id
    FROM employee e2
    WHERE e.city = e2.city)
ORDER BY e.id;

\qecho '4.'
SELECT DISTINCT e.id, e.ename
FROM employee e, jobskill j1, jobskill j2, jobskill j3
WHERE e.id = j1.id AND e.id = j2.id AND e.id = j3.id AND
    j1.skill <> j2.skill AND j1.skill <> j3.skill AND j2.skill <> j3.skill
ORDER BY e.id;

\qecho '5.'
SELECT DISTINCT e.id, e.ename, e.salary
FROM (SELECT DISTINCT e.id
    FROM manages m, employee e, (SELECT DISTINCT e.id, j.skill
        FROM employee e, jobskill j, manages m
        WHERE e.id = j.id AND j.skill = 'Programming' AND e.id = m.eid) m2
    WHERE m.mid = e.id AND
        m2.id = m.eid) m2, manages m3, employee e
WHERE m3.mid = e.id AND
    m3.eid = m2.id
ORDER BY e.id;

\qecho '6.'
SELECT DISTINCT m1.eid, m2.eid
FROM employee e, manages m1, manages m2
WHERE m1.mid = m2.mid AND m1.eid <> m2.eid
ORDER BY m1.eid;

\qecho '7.'
SELECT DISTINCT c.cname
FROM company c
WHERE c.cname NOT IN (SELECT e.cname
FROM employee e
WHERE e.city = 'Bloomington');

\qecho '8.'
SELECT DISTINCT c.cname, jbr.id
FROM company c,
    (SELECT e.id, e.cname
    FROM employee e
    WHERE e.cname = cname AND NOT EXISTS (SELECT e1.salary
        FROM employee e1
        WHERE e1.salary > e.salary AND e.cname = e1.cname)) AS jbr
WHERE c.cname = jbr.cname
ORDER BY cname;

\qecho '9.'
SELECT DISTINCT e.id, e.ename
FROM employee e, manages m
WHERE m.mid NOT IN (SELECT e2.id
                    FROM employee e2
                    WHERE e2.salary >= e.salary);

\qecho '10.'
SELECT DISTINCT m.mid
FROM manages m
WHERE m.mid NOT IN (SELECT e.id
FROM employee e, manages m, jobskill j
WHERE m.mid = e.id AND j.id = e.id
    AND j.skill IN (
    SELECT j.skill
    FROM employee e, manages m, jobskill j
    WHERE e.id = m.eid AND j.id = e.id));

\c postgres;

DROP DATABASE jbr;