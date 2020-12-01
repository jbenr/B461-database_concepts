-- On this assignment I worked with the following people:
-- Zunaeed S., Jimmy Z., Michael A., Jackson E.

-- data1 dataset for for Assignment2
DROP DATABASE if exists assignment2;
CREATE DATABASE assignment2;
DROP TABLE if exists person
cascade;
create table person
(
    pid integer,
    name text,
    city text,
    birthYear integer,
    primary key (pid)
);insert into person
values
    (1, 'Nick', 'NewYork', 1990),
    (2, 'Deepa', 'Indianapolis', 1985),
    (3, 'Eric', 'NewYork', 1990),
    (4, 'Ryan', 'Indianapolis', 1995),
    (5, 'Hasan', 'Indianapolis', 1990),
    (6, 'Arif', 'Indianapolis', 1980),
    (7, 'Ryan', 'Chicago', 1980),
    (8, 'Jean', 'SanFransisco', 2000),
    (9, 'Aya', 'SanFransisco', 1985),
    (10, 'Lisa', 'NewYork', 2000),
    (11, 'Arif', 'Chicago', 1990),
    (12, 'Deepa', 'Bloomington', 1990),
    (13, 'Nick', 'SanFransisco', 1980),
    (14, 'Ryan', 'Indianapolis', 1990),
    (15, 'Nick', 'Indianapolis', 1990),
    (16, 'Anna', 'Chicago', 1980),
    (17, 'Lisa', 'Bloomington', 1990),
    (18, 'Ryan', 'Bloomington', 1995),
    (19, 'Lisa', 'Chicago', 1980),
    (20, 'Danielle', 'Indianapolis', 1985),
    (21, 'Eric', 'Chicago', 1980),
    (22, 'Anna', 'Indianapolis', 1985),
    (23, 'Chris', 'Bloomington', 1990),
    (24, 'Aya', 'NewYork', 1995),
    (25, 'Arif', 'SanFransisco', 1990),
    (26, 'Anna', 'Bloomington', 2000),
    (27, 'Latha', 'SanFransisco', 2000),
    (28, 'Eric', 'Bloomington', 2000),
    (29, 'Linda', 'Bloomington', 1990),
    (30, 'Aya', 'NewYork', 1995),
    -- The following two tuples were added:  
    (31, 'Aya', 'NewYork', 1996),
    (32, 'Anna', 'Bloomington', 1985);
drop table if exists knows
cascade;
create table knows
(
    pid1 integer,
    pid2 integer,
    primary key(pid1, pid2),
    foreign key (pid1) references person(pid),
    foreign key (pid2) references person(pid)
);insert into knows
values
    (5, 22),
    (15, 28),
    (10, 27),
    (11, 27),
    (13, 14),
    (11, 14),
    (5, 28),
    (1, 26),
    (18, 24),
    (24, 5),
    (6, 26),
    (15, 7),
    (15, 25),
    (19, 27),
    (10, 5),
    (11, 19),
    (20, 22),
    (27, 23),
    (24, 29),
    (4, 10),
    (26, 12),
    (13, 15),
    (19, 4),
    (20, 10),
    (10, 6),
    (1, 7),
    (17, 23),
    (9, 26),
    (3, 10),
    (21, 29),
    (27, 15),
    (12, 13),
    (16, 3),
    (14, 24),
    (14, 28),
    (12, 4),
    (15, 8),
    (4, 28),
    (18, 11),
    (12, 16),
    (30, 12),
    (4, 9),
    (4, 8),
    (29, 13),
    (29, 20),
    (24, 18),
    (16, 13),
    (30, 17),
    (23, 22),
    (7, 16),
    (29, 22),
    (26, 3),
    (28, 30),
    (25, 10),
    (3, 22),
    (22, 21),
    (30, 3),
    (1, 20),
    (19, 11),
    (29, 15),
    (13, 30),
    (11, 12),
    (1, 5),
    (13, 18),
    (24, 19),
    (30, 10),
    (4, 12),
    (24, 11),
    (18, 22),
    (3, 2),
    (4, 3),
    (12, 23),
    (25, 24),
    (17, 20),
    (28, 10),
    (8, 17),
    (15, 13),
    (1, 9),
    (6, 18),
    (3, 4),
    (4, 19),
    (24, 23),
    (27, 3),
    (12, 5),
    (12, 2),
    (26, 22),
    (30, 15),
    (20, 13),
    (28, 14),
    (14, 5),
    (1, 10),
    (7, 9),
    (27, 22),
    (12, 11),
    (16, 20),
    (12, 3),
    (17, 7),
    (2, 14),
    (18, 25),
    (16, 24),
    --  The following 5 tuples were added:  
    (16, 15),
    (31, 14),
    (32, 14),
    (32, 7),
    (31, 7);
drop table if exists company
cascade;
create table company
(
    cname text,
    city text,
    primary key (cname, city)
);insert into company
values
    ('Amazon', 'NewYork'),
    ('IBM', 'NewYork'),
    ('Amazon', 'Indianapolis'),
    ('Amazon', 'Bloomington'),
    ('Intel', 'NewYork'),
    ('Netflix', 'Indianapolis'),
    ('Yahoo', 'Indianapolis'),
    ('Google', 'Bloomington'),
    ('Apple', 'Indianapolis'),
    ('Hulu', 'Chicago'),
    ('Hulu', 'NewYork'),
    ('Yahoo', 'Chicago'),
    ('Intel', 'Bloomington'),
    ('Google', 'Chicago'),
    ('Zoom', 'Chicago'),
    ('Yahoo', 'NewYork'),
    ('Yahoo', 'Bloomington'),
    ('Netflix', 'Bloomington'),
    ('Microsoft', 'Chicago'),
    ('Netflix', 'NewYork'),
    ('Microsoft', 'Indianapolis'),
    ('Zoom', 'SanFransisco'),
    ('Netflix', 'SanFrancisco'),
    ('Yahoo', 'SanFrancisco'),
    ('IBM', 'SanFrancisco'),
    -- The following tuple was added:
    ('Uber', 'Bloomington');
drop table if exists worksfor
cascade;
create table worksfor
(
    pid integer,
    cname text,
    salary integer,
    primary key(pid),
    foreign key (pid) references person(pid)
);insert into worksfor
values
    (1, 'IBM', 60000),
    (2, 'Hulu', 50000),
    (3, 'Amazon', 45000),
    (4, 'Microsoft', 60000),
    (5, 'Amazon', 40000),
    (6, 'IBM', 50000),
    (7, 'IBM', 50000),
    (8, 'Netflix', 45000),
    (9, 'Yahoo', 50000),
    (10, 'Hulu', 40000),
    (11, 'Apple', 40000),
    (12, 'Netflix', 55000),
    (13, 'Apple', 40000),
    (14, 'IBM', 50000),
    (15, 'IBM', 40000),
    (16, 'Apple', 55000),
    (17, 'Google', 45000),
    (18, 'Amazon', 45000),
    (19, 'Zoom', 45000),
    (20, 'Microsoft', 55000),
    (21, 'Intel', 55000),
    (22, 'IBM', 40000),
    (23, 'Apple', 40000),
    (24, 'Google', 45000),
    (25, 'Hulu', 50000),
    (26, 'Intel', 55000),
    (27, 'Intel', 50000),
    (28, 'Intel', 50000),
    (29, 'Google', 60000),
    (30, 'Intel', 60000),
    -- The following two tuples were added: 
    (31, 'Uber', 50000),
    (32, 'Uber', 60000);
drop table if exists jobskill
cascade;
create table jobskill
(
    skill text,
    primary key(skill)
);insert into jobskill
values
    ('Programming'),
    ('Databases'),
    ('AI'),
    ('Networks'),
    ('Mathematics'),
    -- The following tuple was added: 
    ('Accounting');
drop table if exists personskill
cascade;
create table personskill
(
    pid integer,
    skill text,
    primary key(pid,skill),
    foreign key (pid) references person(pid),
    foreign key (skill) references jobskill(skill)
);insert into personskill
values
    (27, 'Programming'),
    (18, 'Mathematics'),
    (10, 'AI'),
    (29, 'Networks'),
    (23, 'AI'),
    (4, 'AI'),
    (1, 'Databases'),
    (10, 'Networks'),
    (9, 'Programming'),
    (13, 'Networks'),
    (9, 'AI'),
    (27, 'Mathematics'),
    (20, 'AI'),
    (29, 'Databases'),
    (5, 'Programming'),
    (26, 'Databases'),
    (1, 'Networks'),
    (28, 'AI'),
    (15, 'Programming'),
    (16, 'Mathematics'),
    (12, 'Databases'),
    (15, 'Databases'),
    (24, 'Programming'),
    (14, 'AI'),
    (25, 'Networks'),
    (13, 'AI'),
    (12, 'Programming'),
    (22, 'Programming'),
    (7, 'Mathematics'),
    (10, 'Programming'),
    (16, 'Databases'),
    (19, 'Programming'),
    (7, 'Programming'),
    (22, 'AI'),
    (5, 'Databases'),
    (2, 'Mathematics'),
    (14, 'Programming'),
    (26, 'Networks'),
    (19, 'Networks'),
    (21, 'Programming'),
    (14, 'Mathematics'),
    (19, 'AI'),
    (2, 'Networks'),
    (8, 'Databases'),
    (13, 'Mathematics'),
    (29, 'Programming'),
    (3, 'AI'),
    (16, 'Networks'),
    (5, 'Networks'),
    (17, 'AI'),
    (24, 'Databases'),
    (2, 'Databases'),
    (27, 'Networks'),
    (28, 'Databases'),
    (30, 'Databases'),
    (4, 'Networks'),
    (6, 'Networks'),
    (17, 'Networks'),
    (23, 'Programming'),
    (20, 'Programming'),
    --  The following four tuples were added:  
    (31, 'Programming'),
    (32, 'Databases'),
    (32, 'Accounting'),
    (6, 'Databases');


\qecho '1.1 a)'
    SELECT p.pid, p.name
    from person p, company c, worksfor w
    where w.pid = p.pid AND c.city = 'Bloomington' AND w.cname = c.cname
intersect
    SELECT p.pid, p.name
    from person p, person p2, knows k
    where k.pid1 = p.pid AND k.pid2 = p2.pid AND p2.city = 'Chicago'
order by pid;

\qecho '1.1 b)'
select distinct p.pid, p.name
from (select p.pid, p.name
    from person p
    where p.pid IN (select w.pid
    from worksfor w
    where w.cname IN (select c.cname
    from company c
    where c.city = 'Bloomington'))) p
where p.pid IN (select p.pid
from person p, person p2, knows k
where k.pid1 = p.pid AND k.pid2 = p2.pid AND p2.city = 'Chicago')
order by pid;

\qecho '1.1 c)'
select distinct p.pid, p.name
from person p, worksfor w
where p.pid = SOME (select w.pid
    from company c, worksfor w
    where w.cname = c.cname AND c.city = 'Bloomington') AND
    p.pid = SOME (select p.pid
    from person p, person p2, knows k
    where k.pid1 = p.pid AND k.pid2 = p2.pid AND p2.city = 'Chicago')
order by pid;

\qecho '1.1 d)'
SELECT p.pid, p.name
from person p, company c, worksfor w
where w.pid = p.pid AND c.city = 'Bloomington' AND w.cname = c.cname
    and exists (SELECT p1.pid, p.name
    from person p1, person p2, knows k
    where k.pid1 = p.pid AND k.pid2 = p2.pid AND p2.city = 'Chicago' AND p1.pid = p.pid)
order by pid;

\qecho '1.2 a)'
    select p.pid, p.name
    from person p, knows k, person p2, worksfor w
    where k.pid1 = p.pid AND k.pid2 = p2.pid AND p2.pid = w.pid AND w.cname = 'Google'
EXCEPT
    select p.pid, p.name
    from person p, person p2, knows k, worksfor w, personskill ps
    where k.pid1 = p.pid AND k.pid2 = p2.pid AND p2.pid = w.pid AND w.cname = 'Amazon' AND p2.pid = ps.pid AND ps.skill = 'Programming'
order by pid;

\qecho '1.2 b)'
select distinct p.pid, p.name
from (select p.pid, p.name
    from person p
    where p.pid in (select p.pid
    from person p, knows k, person p2, worksfor w
    where k.pid1 = p.pid AND k.pid2 = p2.pid AND p2.pid = w.pid AND w.cname = 'Google')) p
where p.pid not in (select p.pid
from person p, person p2, knows k, worksfor w, personskill ps
where k.pid1 = p.pid AND k.pid2 = p2.pid AND p2.pid = w.pid AND w.cname = 'Amazon' AND p2.pid = ps.pid AND ps.skill = 'Programming')
order by pid;

\qecho '1.2 c)'
select distinct p.pid, p.name
from person p
where p.pid = SOME (select p.pid
    from person p, knows k, person p2, worksfor w
    where k.pid1 = p.pid AND k.pid2 = p2.pid AND p2.pid = w.pid AND w.cname = 'Google')
    AND not p.pid = SOME (select p.pid
    from person p, person p2, knows k, worksfor w, personskill ps
    where k.pid1 = p.pid AND k.pid2 = p2.pid AND p2.pid = w.pid AND w.cname = 'Amazon' AND p2.pid = ps.pid AND ps.skill = 'Programming')
order by pid;

\qecho '1.2 d)'
select p.pid, p.name
from person p, knows k, person p2, worksfor w
where k.pid1 = p.pid AND k.pid2 = p2.pid AND p2.pid = w.pid AND w.cname = 'Google'
    AND not exists (select p1.pid, p1.name
    from person p1, person p2, knows k, worksfor w, personskill ps
    where p1.pid = p.pid AND k.pid1 = p.pid AND k.pid2 = p2.pid AND p2.pid = w.pid AND w.cname = 'Amazon' AND p2.pid = ps.pid AND ps.skill = 'Programming')
order by pid;

\qecho '1.3 a)'
    select distinct c.cname
    from person p, person p2, worksfor w, worksfor w2, personskill s, personskill s2, company c
    where not p.pid = p2.pid AND p.pid = w.pid AND p2.pid = w2.pid AND w.cname = c.cname AND w2.cname = c.cname AND p.pid = s.pid AND p2.pid = s2.pid AND s.skill = s2.skill
intersect
    select c.cname
    from company c
order by cname;

\qecho '1.3 b)'
select distinct c.cname
from company c
where c.cname IN (select c.cname
from person p, person p2, worksfor w, worksfor w2, personskill s, personskill s2, company c
where not p.pid = p2.pid AND p.pid = w.pid AND p2.pid = w2.pid AND w.cname = c.cname AND w2.cname = c.cname AND p.pid = s.pid AND p2.pid = s2.pid AND s.skill = s2.skill)
order by cname;

\qecho '1.3 c)'
select distinct c.cname
from company c, person p, person p2, worksfor w, worksfor w2
where p.pid <> p2.pid and p.pid = w.pid and p2.pid = w2.pid and w.cname = c.cname and w2.cname = c.cname and exists (select ps1.pid
    from personskill ps1, personskill ps2
    where p.pid = ps1.pid and p2.pid = ps2.pid and ps1.skill = ps2.skill);

\qecho '1.4 a)'
--CREATE or replace VIEW IBMs
--AS
--    select distinct p.pid, p.name, w.salary
--    from person p, worksfor w
--    where p.pid = w.pid AND w.cname = 'IBM';
--create or replace view database_IBMs
--AS
--    select distinct p.pid, p.name, w.salary
--    from person p, worksfor w, personskill s
--    where p.pid = w.pid AND w.cname = 'IBM' AND p.pid = s.pid AND s.skill = 'Databases';
    select distinct p.pid, p.name
    from person p, worksfor w
    where p.pid = w.pid AND w.cname = 'IBM'
except
    select distinct p1.pid, p1.name
    from person p1, person p2, personskill ps1, personskill ps2, worksfor w1, worksfor w2
    where p1.pid = ps1.pid AND p1.pid = w1.pid AND p2.pid = ps2.pid and p2.pid = w2.pid and w1.cname = 'IBM' and w2.cname = 'IBM' and w1.salary < w2.salary;

\qecho '1.4 b)'
select distinct p.pid, p.name
from person p, worksfor w
where p.pid = w.pid AND w.cname = 'IBM' and p.pid not in (
select distinct p1.pid
    from person p1, person p2, personskill ps1, personskill ps2, worksfor w1, worksfor w2
    where p1.pid = ps1.pid AND p1.pid = w1.pid AND p2.pid = ps2.pid and p2.pid = w2.pid and w1.cname = 'IBM' and w2.cname = 'IBM' and ps2.skill = 'Databases' and w1.salary < w2.salary);

\qecho '1.5'
select w.cname, w.pid, p.name
from worksfor w, person p
where p.pid = w.pid
    and w.salary not in
	(select lowest.salary
    from (select distinct w1.pid, w1.salary
        from worksfor w1, worksfor w2
        where w1.pid <> w2.pid
            and w1.cname = w.cname
            and w2.cname = w.cname
            and w1.salary > w2.salary) as lowest,
        (select distinct w1.pid, w1.salary
        from worksfor w1, worksfor w2
        where w1.pid <> w2.pid
            and w1.cname = w.cname
            and w2.cname = w.cname
            and w1.salary > w2.salary) as lowest2
    where lowest.salary > lowest2.salary
        and lowest.pid <> lowest2.pid)
    and w.salary in (select distinct w1.salary
    from worksfor w1, worksfor w2
    where w1.pid <> w2.pid
        and w1.cname = w.cname
        and w2.cname = w.cname
        and w1.salary > w2.salary);

\qecho '1.6'
select k.pid1
from knows k
where k.pid1 not in 
(select distinct k1.pid1
    from knows k1, knows k2
    where k1.pid1 = k2.pid1 and k1.pid2 != k2.pid2) AND
    k.pid2 in 
(select distinct ps1.pid
    from personskill ps1, personskill ps2
    where ps1.pid = ps2.pid and ps1.skill != ps2.skill)
order by pid1;

\qecho '1.7'
    (select ps.skill
    from personskill ps)
except
    (
        select distinct ps.skill
    from personskill ps
    where ps.skill in (select s.skill
    from person p, personskill s, worksfor w
    where p.pid = w.pid and p.pid = s.pid and w.cname = 'Netflix')
union
    (select s.skill
    from person p, personskill s, worksfor w
    where p.pid = w.pid and p.pid = s.pid and w.cname = 'Yahoo'));

\qecho '1.8'
SELECT DISTINCT js1.skill, js2.skill
FROM person p1, jobskill js1, personskill sk1, jobskill js2
WHERE p1.pid = sk1.pid and sk1.skill = js1.skill and js1.skill = ALL
(SELECT sk.skill
    FROM person p2, personskill sk
    WHERE sk.pid = p2.pid and sk.skill = js2.skill and p2.pid != p1.pid);

\qecho '2.1 a)'
create or replace view SalaryAbove50000
as
select *
from person p
where p.pid IN (select w.pid
from worksfor w, person p
where p.pid = w.pid AND w.salary > 50000);
select *
from SalaryAbove50000;

\qecho '2.1 b)'
drop view if exists IBMEmployee;
create view IBMEmployee
as
    select w.pid
    from worksfor w
    where w.cname = 'IBM';
select *
from IBMEmployee;

\qecho '2.1 c)'
    select p.pid, p.name
    from person p, worksfor w
    where p.pid = w.pid AND w.cname = 'Apple'
intersect
    select p.pid, p.name
    from SalaryAbove50000 bb, person p
    where p.pid = bb.pid
intersect
    select p.pid, p.name
    from SalaryAbove50000, person p
    where p.pid in (select p.pid
    from IBMEmployee
    where p.pid in (select p.pid
    from person p, person p2, knows k
    where p.pid != k.pid1 AND p2.pid = k.pid2));

\qecho '2.2 a)'
drop function if exists SalaryAbove;
create function SalaryAbove(amount integer)
returns setof person
as $$
select p.pid, p.name, p.city, p.birthYear
from person p, worksfor w
where p.pid = w.pid AND w.salary > amount;
$$ language sql;
\qecho 'Salary above 30000'
select *
from SalaryAbove(30000);
\qecho 'Salary above 50000'
select *
from SalaryAbove(50000);
\qecho 'Salary above 70000'
select *
from SalaryAbove(70000);

\qecho '2.2 b)'
drop function if exists KnowsEmployeeAtCompany;
create function KnowsEmployeeAtCompany(workname text)
returns table
(pid integer)
as $$
select distinct p.pid
from person p, person p2, knows k, worksfor w
where p.pid = k.pid1 AND p2.pid = k.pid2 AND w.pid = p2.pid AND w.cname = workname;
$$ language sql;
\qecho 'Person who knows employee at Yahoo'
select *
from KnowsEmployeeAtCompany('Yahoo');
\qecho 'Person who knows employee at Google'
select *
from KnowsEmployeeAtCompany('Google');
\qecho 'Person who knows employee at Amazon'
select *
from KnowsEmployeeAtCompany('Amazon');

\qecho '2.2 c)'
drop function if exists KnowsEmployeeAtCompany2;
create function KnowsEmployeeAtCompany2(workname text)
returns table
(pid integer, kpid integer)
as $$
select distinct p.pid, k.pid2
from person p, person p2, knows k, worksfor w
where p.pid = k.pid1 AND p2.pid = k.pid2 AND w.pid = p2.pid AND w.cname = workname;
$$ language sql;

select distinct w2.salary, c.cname, p.pid
from worksfor w, worksfor w2, company c, company c1, person p
where p.pid = w.pid
    AND w.cname = c.cname
    AND p.pid IN (select x.pid
    from SalaryAbove(w2.salary) x)
    AND p.pid IN (select y.pid
    from KnowsEmployeeAtCompany2(c1.cname) y
    where c1.cname != c.cname
        and y.kpid not in
(select t.pid
        from SalaryAbove(w2.salary) t)
);



\qecho '3.1'
drop table if exists nums;
create table nums
(
    num integer
);
insert into nums
values
    (1),
    (2),
    (3),
    (4),
    (5);

select n.num as x, sqrt(n.num) as square_root_x, power(n.num, 2) as x_squared, power(2, n.num) as two_to_the_power_x, factorial(n.num) as x_factorial, ln(n.num) as logarithm_x
from nums n;

\qecho '3.2 a)'
drop table if exists A, B, C;
create table A
(
    num integer
);
create table B
(
    num integer
);
insert into A
values
    (1),
    (2);
insert into B
values
    (1),
    (3),
    (5);

select exists
    (
        select *
    from A
intersect
    select *
    from B)
as answer1_t;

select exists
(select *
from A
where num in
(select *
from B))
as answer2_t;

delete from A;
delete from B;
insert into A
values
    (1),
    (2);
insert into B
values
    (3),
    (5);

select exists
    (
        select *
    from A
intersect
    select *
    from B)
as answer1_f;

select exists
(select *
from A
where num in
(select *
from B))
as answer2_f;

\qecho '3.2 b)'
delete from A;
delete from B;
insert into A
values
    (1),
    (2);
insert into B
values
    (1),
    (2),
    (3);

select not exists
    (
        SELECT a.num
    FROM A a
EXCEPT
    SELECT a.num
    FROM A a, B b
    WHERE a.num = b.num)
AS answer1_t;

select not exists
(SELECT a.num
FROM A a
WHERE a.num <> ALL (SELECT b.num
FROM B b))
AS answer2_t;

delete from A;
delete from B;
insert into A
values
    (1),
    (2);
insert into B
values
    (2),
    (3);

select not exists
    (
        select *
    from A
except
    (select a.num
    from A a, B b
    where a.num = b.num))
as answer1_f;

select not exists
(SELECT a.num
FROM A a
WHERE a.num <> ALL (SELECT b.num
FROM B b))
AS answer2_f;

\qecho '3.2 c)'
delete from A;
delete from B;
insert into A
values
    (1),
    (2);
insert into B
values
    (2),
    (3);
create table C
(
    num integer
);
insert into C
values
    (1),
    (2),
    (3);

select not exists
(
    select *
    from A
union
    select *
    from B
except
    select *
    from C)
as answer1_t;

select not exists
    (
        select *
    from A
union
    select *
    from B
    where B.num <> ALL (select *
    from C))
as answer2_t;

delete from A;
delete from B;
delete from C;
insert into A
values
    (1),
    (2);
insert into B
values
    (2),
    (3);
insert into C
values
    (1),
    (2),
    (4);

select not exists
(
    select *
    from A
union
    select *
    from B
except
    select *
    from C)
as answer1_f;

select not exists
    (
        select *
    from A
union
    select *
    from B
    where B.num <> ALL (select *
    from C))
as answer2_f;


\qecho '3.3 a)'
SELECT 2
>= ALL
(select distinct count(js.skill)
FROM person p, jobskill js, personskill sk
WHERE p.pid = sk.pid and sk.skill = js.skill)
as answer;

\qecho '3.3 b)'
SELECT 55000
< ALL
(SELECT DISTINCT w.salary
FROM company c, person p, worksfor w
WHERE p.pid = w.pid and w.cname = c.cname)
as answer;

DROP DATABASE assignment2;