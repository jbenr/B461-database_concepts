DROP DATABASE if exists assignment6;
CREATE DATABASE assignment6;

-- Worked with Kimberly C., Michael A., Jackson E. on this assignment

-- Data for assignment 6
drop table if exists person;create table person
(
    pid integer,
    name text,
    city text,
    birthYear integer
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
    (30, 'Aya', 'NewYork', 1995),-- new  
    (31, 'Linda', 'London', 1980);-- 
drop table if exists knows;create table knows
(
    pid1 integer,
    pid2 integer
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
    (31, 3),
    (31, 9),
    (31, 11),
    (31, 20),
    (31, 21),
    (31, 22),
    (31, 23),-- new  
    (31, 1),
    (31, 2),
    (31, 4),
    (31, 5),
    (31, 6),
    (31, 7),
    (31, 8),
    (31, 10),
    (31, 12),
    (31, 14),
    (31, 15),
    (31, 16);--
drop table if exists company;create table company
(
    cname text
);insert into company
values
    ('Amazon'),
    ('IBM'),
    ('Intel'),
    ('Netflix'),
    ('Yahoo'),
    ('Google'),
    ('Apple'),
    ('Hulu'),
    ('Zoom'),
    ('Microsoft'),
    ('Britbox');drop table if exists companyLocation;create table companylocation
(
    cname text,
    city text
);insert into companyLocation
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
    ('IBM', 'SanFrancisco');
drop table if exists worksfor;create table worksfor
(
    pid integer,
    cname text,
    salary integer
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
    (16, 'Apple', 55000),--  The next two tuples were deleted-- 
    (17, 'Google', 45000),--  
    (18, 'Amazon', 45000),
    (18, 'Amazon', 55000),
    (19, 'Zoom', 45000),
    (20, 'Microsoft', 55000),
    (21, 'Intel', 55000),
    (22, 'IBM', 40000),
    (23, 'Apple', 40000),--  The next tuple was deleted--  
    (24, 'Google', 45000),
    (25, 'Hulu', 50000),
    (26, 'Intel', 55000),
    (27, 'Intel', 50000),
    (28, 'Intel', 50000),--  The next tuple was deleted--  
    (29, 'Google', 60000),
    (30, 'Intel', 60000);drop table if exists jobskill;create table jobskill
(
    skill text
);insert into jobskill
values
    ('Programming'),
    ('Databases'),
    ('AI'),
    ('Networks'),
    ('Mathematics'),
    -- new   
    ('Algorithms'),-- 
    ('OperatingSystems');drop table if exists personskill;create table personskill
(
    pid integer,
    skill text
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
    (29, 'Programming'),--  The next tuple was deleted--  
    (3, 'Programming'),
    (16, 'Networks'),
    (5, 'Networks'),
    (17, 'AI'),
    (24, 'Databases'),
    (2, 'Databases'),
    (27, 'Networks'),
    (28, 'Databases'),
    (30, 'Databases'),-- new  
    (30, 'OperatingSystems'),--  
    (4, 'Networks'),
    (6, 'Networks'),
    (17, 'Networks'),
    (23, 'Programming'),-- new 
    (1, 'OperatingSystems'),
    (29, 'OperatingSystems'),
    (31, 'Databases'),--  
    (20, 'Programming');

-- Set union A∪B:
create or replace function setunion (A anyarray, B anyarray)
returns anyarray as
$$
select array(select unnest(A)
            union
            select unnest(B)
order by 1);
$$ language sql;

--Set intersection A ∩ B:
create or replace function setintersection(A anyarray, B anyarray)
returns anyarray as
$$
select array( select unnest(A) intersect select unnest(B) order by 1);
$$ language sql;

--Set difference A − B:
create or replace function setdifference(A anyarray, B anyarray)
returns anyarray as
$$
select array( select unnest(A) except select unnest(B) order by 1);
$$ language sql;

--Set membership x ∈ A:
create or replace function isIn(x anyelement, A anyarray)
    returns boolean as
$$
select x = SOME(A);
$$ language sql;

--Subset test A ⊇ B:
create or replace function subset(A anyarray, B anyarray)
returns boolean as
$$
select A <@ B;
$$ language sql;

 --Superset test A ⊇ B:
create or replace function superset(A anyarray, B anyarray)
returns boolean as
$$
select A @> B;
$$ language sql;

--OverlaptestA∩B̸=∅:
create or replace function overlap(A anyarray, B anyarray)
returns boolean as
$$
select A && B;
$$ language sql;

--Disjointness test A ∩ B = ∅:
create or replace function disjoint(A anyarray, B anyarray)
returns boolean as
$$
select not A && B;
$$ language sql;

\qecho '1'
\qecho '(a)'
drop view if exists cityHasCompanies;
create view cityHasCompanies as
select distinct city, array(select distinct cl1.cname 
							from companyLocation cl1
							where cl1.city = cl.city) as companies
from companyLocation cl
order by city;

select *
from cityHasCompanies;

\qecho '(b)'
drop view if exists companyLocations;
create or replace view companyLocations as
select distinct c.cname, array(select distinct cl.city
                            from companylocation cl
                            where cl.cname = c.cname order by cl.city) as cities
from company c
order by cname;

select *
from companyLocations;

\qecho '(c)'
drop view if exists knowsPersons;
create view knowsPersons as
select distinct p.pid, array(select distinct k.pid2
                            from knows k
                            where k.pid1 = p.pid order by k.pid2) as knows
from person p
order by p.pid;

select *
from knowsPersons;

\qecho '(d)'
drop view if exists isKnownByPersons;
create view isKnownByPersons as
select distinct p.pid, array(select distinct k.pid1
                    from knows k
                    where k.pid2 = p.pid order by k.pid1) as known
from person p
order by p.pid;

select *
from isKnownByPersons;

\qecho '(e)'
drop view if exists personHasSkills;
create view personHasSkills as
select distinct p.pid, array(select distinct ps.skill
                            from personskill ps
                            where ps.pid = p.pid order by ps.skill) as skillz
from person p
order by p.pid;

select *
from personHasSkills;

\qecho '(f)'
drop view if exists skillOfPersons;
create view skillOfPersons as
select distinct js.skill, array(select distinct ps.pid
                                from personskill ps
                                where ps.skill = js.skill order by ps.pid) as peoples
from jobskill js
order by js.skill;

select *
from skillOfPersons;

\qecho 'ex 4'
select p.pid, p.name
from person p
where cardinality((select k.knows
                   from   knowsPersons k
                   where  k.pid = p.pid)) >= 5;
\qecho 'this is proof that the cardinality function is not working for me...'

\qecho '2'
\qecho '(a)'
select distinct k.pid, p.name
from knowsPersons k, worksfor w1, worksfor w2, person p
where isIn(w1.pid, k.knows) and isIn(w2.pid, k.knows) and w1.cname = 'Amazon' and w2.cname = 'Amazon' and w1.pid <> w2.pid and p.pid = k.pid
order by k.pid;

\qecho '(b)'
select distinct p.pid, p.name
FROM knowsPersons kp, person p, worksFor w
WHERE p.pid = kp.pid AND isIn(w.pid, kp.knows) AND w.cname = 'Amazon' AND w.salary <= 40000
order by p.pid;

\qecho '(c)'
select * 
from ((select sp.skill from jobskill sp)
EXCEPT
(select sp.skill
from skillofpersons sp, person p, worksfor w, cityHasCompanies c
where p.pid = w.pid
and c.city = 'Bloomington' and isIn(p.pid, sp.peoples) and isIn(w.cname, c.companies))) ps;

\qecho '(d)'
select setDifference(array(select skill from jobskill), array(select distinct unnest(phs.skillz) as skill 
from worksfor wf, worksfor wf2, personHasSkills phs
where (phs.pid = wf.pid and cardinality(array(select wf2.pid
                                            from worksfor wf2 
                                            where wf2.cname = wf.cname)) >= 5)));
\qecho 'i dont know why cardinality wont count the skills in the table...'
\qecho 'but i feel as if this should work, but wont because cardinality isnt working'

\qecho '(e)'
select ps.pid
from personhasskills ps
where subset(ps.skillz,(select array(select distinct unnest(ps1.skillz)
                        from personhasskills ps1, worksfor w
                        where ps1.pid = w.pid and w.cname = 'Amazon' and w.salary < 50000)));

\qecho '(f)'
select distinct p.pid
from personhasskills p
where cardinality(p.skillz) = 3;
\qecho 'cardinality is definitively not working for some reason on my computer. hope it works on yours :)'

\qecho '(g)'
select distinct p1.pid, p1.name, array(select distinct p2.pid 
                              from person p2, knowspersons kp, worksfor w
                              where kp.pid = p1.pid and w.pid = p2.pid and w.cname = 'Amazon'
                              and isIn(p2.pid, (select distinct kp.knows
                                                from knowspersons kp 
                                                where kp.pid = p1.pid)))
from person p1
order by p1.pid;

\qecho '(h)'
select count(1)
from (select p1.pid, p2.pid
from person p1, person p2
where cardinality(setdifference((select kp.knows
from isKnownByPersons kp
where kp.pid = p1.pid), (select kp.knows from knowsPersons kp where kp.pid = p2.pid))) > 0) as countt;

\qecho '(i)'
drop view if exists skillzthatkill;
create view skillzthatkill as
	select array(select distinct unnest(phs.skillz) as skills
                from WorksFor wf, personHasSkills phs 
                where (wf.cname = 'Amazon' or wf.cname = 'Google') and phs.pid = wf.pid) as skills;

select phs.pid, setIntersection(kil.skills, phs.skillz) 
from skillzthatkill as kil, personHasSkills phs order by phs.pid;


drop database assignment6;