create database assignment3;
\c assignment3

-- data for Assignment3
-- Worked with Jackson E. on this assignment :)

drop table if exists person;
create table person (pid  integer,
                     name text,
                     city text,
                     birthYear integer,
                     primary key (pid));

insert into person values
  (1,'Nick','NewYork',1990),
  (2,'Deepa','Indianapolis',1985),
  (3,'Eric','NewYork',1990),
  (4,'Ryan','Indianapolis',1995),
  (5,'Hasan','Indianapolis',1990),
  (6,'Arif','Indianapolis',1980),
  (7,'Ryan','Chicago',1980),
  (8,'Jean','SanFransisco',2000),
  (9,'Aya','SanFransisco',1985),
  (10,'Lisa','NewYork',2000),
  (11,'Arif','Chicago',1990),
  (12,'Deepa','Bloomington',1990),
  (13,'Nick','SanFransisco',1980),
  (14,'Ryan','Indianapolis',1990),
  (15,'Nick','Indianapolis',1990),
  (16,'Anna','Chicago',1980),
  (17,'Lisa','Bloomington',1990),
  (18,'Ryan','Bloomington',1995),
  (19,'Lisa','Chicago',1980),
  (20,'Danielle','Indianapolis',1985),
  (21,'Eric','Chicago',1980),
  (22,'Anna','Indianapolis',1985),
  (23,'Chris','Bloomington',1990),
  (24,'Aya','NewYork',1995),
  (25,'Arif','SanFransisco',1990),
  (26,'Anna','Bloomington',2000),
  (27,'Latha','SanFransisco',2000),
  (28,'Eric','Bloomington',2000),
  (29,'Linda','Bloomington',1990),
  (30,'Aya','NewYork',1995);


drop table if exists knows;
create table knows (pid1 integer,
                    pid2 integer,
                    primary key(pid1, pid2),
                    foreign key (pid1) references person(pid),
                    foreign key (pid2) references person(pid));

insert into knows values
  (5,22),
  (15,28),
  (10,27),
  (11,27),
  (13,14),
  (11,14),
  (5,28),
  (1,26),
  (18,24),
  (24,5),
  (6,26),
  (15,7),
  (15,25),
  (19,27),
  (10,5),
  (11,19),
  (20,22),
  (27,23),
  (24,29),
  (4,10),
  (26,12),
  (13,15),
  (19,4),
  (20,10),
  (10,6),
  (1,7),
  (17,23),
  (9,26),
  (3,10),
  (21,29),
  (27,15),
  (12,13),
  (16,3),
  (14,24),
  (14,28),
  (12,4),
  (15,8),
  (4,28),
  (18,11),
  (12,16),
  (30,12),
  (4,9),
  (4,8),
  (29,13),
  (29,20),
  (24,18),
  (16,13),
  (30,17),
  (23,22),
  (7,16),
  (29,22),
  (26,3),
  (28,30),
  (25,10),
  (3,22),
  (22,21),
  (30,3),
  (1,20),
  (19,11),
  (29,15),
  (13,30),
  (11,12),
  (1,5),
  (13,18),
  (24,19),
  (30,10),
  (4,12),
  (24,11),
  (18,22),
  (3,2),
  (4,3),
  (12,23),
  (25,24),
  (17,20),
  (28,10),
  (8,17),
  (15,13),
  (1,9),
  (6,18),
  (3,4),
  (4,19),
  (24,23),
  (27,3),
  (12,5),
  (12,2),
  (26,22),
  (30,15),
  (20,13),
  (28,14),
  (14,5),
  (1,10),
  (7,9),
  (27,22),
  (12,11),
  (16,20),
  (12,3),
  (17,7),
  (2,14),
  (18,25),
  (16,24);


drop table if exists company;
create table company(cname text,
                     city  text,
                     primary key (cname, city));

insert into company values
  ('Amazon','NewYork'),
  ('IBM','NewYork'),
  ('Amazon','Indianapolis'),
  ('Amazon','Bloomington'),
  ('Intel','NewYork'),
  ('Netflix','Indianapolis'),
  ('Yahoo','Indianapolis'),
  ('Google','Bloomington'),
  ('Apple','Indianapolis'),
  ('Hulu','Chicago'),
  ('Hulu','NewYork'),
  ('Yahoo','Chicago'),
  ('Intel','Bloomington'),
  ('Google','Chicago'),
  ('Zoom','Chicago'),
  ('Yahoo','NewYork'),
  ('Yahoo','Bloomington'),
  ('Netflix','Bloomington'),
  ('Microsoft','Chicago'),
  ('Netflix','NewYork'),
  ('Microsoft','Indianapolis'),
  ('Zoom','SanFransisco'),
  ('Netflix','SanFrancisco'),
  ('Yahoo','SanFrancisco'),
  ('IBM','SanFrancisco');



drop table if exists worksfor;
create table worksfor(pid    integer,
                      cname  text,
                      salary integer,
                      primary key(pid),
                      foreign key (pid) references person(pid));

insert into worksfor values
  (1,'IBM',60000),
  (2,'Hulu',50000),
  (3,'Amazon',45000),
  (4,'Microsoft',60000),
  (5,'Amazon',40000),
  (6,'IBM',50000),
  (7,'IBM',50000),
  (8,'Netflix',45000),
  (9,'Yahoo',50000),
  (10,'Hulu',40000),
  (11,'Apple',40000),
  (12,'Netflix',55000),
  (13,'Apple',40000),
  (14,'IBM',50000),
  (15,'IBM',40000),
  (16,'Apple',55000),
  (17,'Google',45000),
  (18,'Amazon',45000),
  (19,'Zoom',45000),
  (20,'Microsoft',55000),
  (21,'Intel',55000),
  (22,'IBM',40000),
  (23,'Apple',40000),
  (24,'Google',45000),
  (25,'Hulu',50000),
  (26,'Intel',55000),
  (27,'Intel',50000),
  (28,'Intel',50000),
  (29,'Google',60000),
  (30,'Intel',60000);


drop table if exists jobskill;
create table jobskill(skill text,
                      primary key(skill));
insert into jobskill values 
  ('Programming'), 
  ('Databases'), 
  ('AI'), 
  ('Networks'), 
  ('Mathematics');

drop table if exists personskill;
create table personskill(pid integer,
                         skill text,
                         primary key(pid,skill),
                         foreign key (pid) references person(pid),
                         foreign key (skill) references jobskill(skill));

insert into personskill values
  (27,'Programming'),
  (18,'Mathematics'),
  (10,'AI'),
  (29,'Networks'),
  (23,'AI'),
  (4,'AI'),
  (1,'Databases'),
  (10,'Networks'),
  (9,'Programming'),
  (13,'Networks'),
  (9,'AI'),
  (27,'Mathematics'),
  (20,'AI'),
  (29,'Databases'),
  (5,'Programming'),
  (26,'Databases'),
  (1,'Networks'),
  (28,'AI'),
  (15,'Programming'),
  (16,'Mathematics'),
  (12,'Databases'),
  (15,'Databases'),
  (24,'Programming'),
  (14,'AI'),
  (25,'Networks'),
  (13,'AI'),
  (12,'Programming'),
  (22,'Programming'),
  (7,'Mathematics'),
  (10,'Programming'),
  (16,'Databases'),
  (19,'Programming'),
  (7,'Programming'),
  (22,'AI'),
  (5,'Databases'),
  (2,'Mathematics'),
  (14,'Programming'),
  (26,'Networks'),
  (19,'Networks'),
  (21,'Programming'),
  (14,'Mathematics'),
  (19,'AI'),
  (2,'Networks'),
  (8,'Databases'),
  (13,'Mathematics'),
  (29,'Programming'),
  (3,'AI'),
  (16,'Networks'),
  (5,'Networks'),
  (17,'AI'),
  (24,'Databases'),
  (2,'Databases'),
  (27,'Networks'),
  (28,'Databases'),
  (30,'Databases'),
  (4,'Networks'),
  (6,'Networks'),
  (17,'Networks'),
  (23,'Programming'),
  (20,'Programming');

\qecho '1'
drop table if exists P;
create table P
(
    co bigint,
    de int
);
insert into P
values (2, 2), (-5, 1), (5, 0);
select *
from P;

drop table if exists Q;
create table Q
(
    co bigint,
    de int
);
insert into Q
values (4, 4), (3, 3), (1, 2), (-1, 1), (0, 0);
select *
from Q;

create or replace function multiplicationPandQ()
returns table(coefficient bigint, degree integer) as
$$
select cast(sum(P.co * Q.co) as bigint), P.de + Q.de as deg
from P, Q
group by deg
order by deg desc;
$$ language sql;

select *
from multiplicationPandQ();

\qecho '2'
drop table if exists X;
create table X 
(
    index int,
    value int
);
insert into X values (1, 7), (2, -1), (3, 2);

drop table if exists Y;
create table Y
(
    index int,
    value int
);
insert into Y values (1, 1), (2, 1), (3, -10);

select * from X;
select * from Y;

create or replace function dotProductXandY() returns bigint as
$$
select sum(X.value * Y.value)
from X, Y
where X.index = Y.index;
$$ language sql;

select *
from dotProductXandY();

\qecho '3'
select p.pid, p.name
from Person p
where p.city = 'Bloomington' and
(select count(1)
from personskill ps
where ps.pid = p.pid and ps.skill <> 'Programming') >= 1 and  
(select count(1)
from worksfor w, personskill ps1
where w.cname = 'Netflix' and w.pid = p.pid) >= 1;

\qecho '4'
select w.pid, w.cname, w.salary
from worksfor w
where not (select count(w1.salary)
from worksfor w1, company c
where w.pid <> w1.pid and w.cname = w1.cname and not w.salary <= w1.salary and
(select count(p.city)
from person p
where p.birthyear <> 1998 and p.city = c.city) = 0) = 0;

\qecho '5'
select p.pid, p.name
from person p
where p.city = 'Bloomington' and (select count(p2.pid)
from knows k, person p2
where p.pid <> p2.pid and p.pid = k.pid1 and p2.pid = k.pid2 and
(select count(ps.skill)
from personskill ps
where p2.pid = ps.pid) >= 3) <= 1;

\qecho '6'
select p.pid, p.name
from person p
where (select count(ps.skill)
from personskill ps
where ps.pid = p.pid) = 2
order by p.pid;

\qecho '7'
select distinct w.cname,
(select count(p.pid)
from person p
where p.pid = w.pid and
(select count(k.pid2)
from person p2, worksfor w2, knows k
where k.pid2 <> p.pid and k.pid2 = p2.pid and k.pid1 = p.pid and p2.pid = w2.pid and w2.cname = w.cname)
>= 2) from worksfor w;

\qecho '8'
create or replace function knowsPerson(person integer)
returns table(pid integer, name text) as
$$
select p.pid, p.name
from person p
where p.pid in (select p2.pid
from person p2, knows k
where person = k.pid1 and p2.pid = k.pid2);
$$ language sql;

create or replace view salaryMoreThan55000 as (select w.pid
from worksfor w
where w.salary > 55000);

select p.pid, p.name
from person p
where not exists (select kp.pid
from knowsPerson(p.pid) kp
INTERSECT
select p2.pid
from salaryMoreThan55000 p2);

\qecho '9'
create or replace view problem9view as (select w.pid
from worksfor w
where w.cname = 'Netflix'
intersect
select p.pid
from person p
where p.birthYear > 1985
intersect
select w.pid
from worksfor w
where w.salary >= 55000);

select p.pid, p.name
from person p
where exists (select kp.pid
from knowsPerson(p.pid) kp
INTERSECT
select p9.pid
from problem9view p9)
order by pid;

\qecho '10'
create or replace function employsPerson(company text)
returns table (pid integer, name text) as
$$
select p.pid, p.name
from person p
where p.pid in (select w.pid
from worksfor w
where p.pid = w.pid and w.cname = company);
$$ language sql;

create or replace view lessThan55000 as (select w.pid
from worksfor w
where w.salary < 55000);

select distinct c.cname
from company c
where not exists (select ep.pid
from employsPerson(c.cname) ep
except
select lt.pid
from lessThan55000 lt);

\qecho '11'
create or replace view IBMjobskills as (select distinct ps.pid, ps.skill
from worksfor w, personskill ps
where ps.pid = w.pid and w.cname = 'IBM');
--select *
--from IBMjobskills;

create or replace function personsJobSkills(person integer)
returns table (pid integer, jobskill text) as
$$
select ps.pid, ps.skill
from personskill ps
where ps.skill in (select j.skill
from jobskill j) and ps.pid = person;
$$ language sql;

select p.pid, p.name
from person p
where (select count(js.jobskill)
from personsJobSkills(p.pid) js
where js.jobskill in (select i.skill
from IBMjobskills i)) > 2;

\qecho '12'
create or replace view atLeast50000 as (select w.pid
from worksfor w
where w.salary >= 50000);

create or replace function employsPeople(company text)
returns table (pid integer) as
$$
select w.pid
from worksfor w
where w.cname = company;
$$ language sql;

select distinct w.cname
from worksfor w
where (select count(emp.pid)
from employsPeople(w.cname) emp
where emp.pid in (select atl.pid
from atLeast50000 atl)) % 2 != 0;

\qecho '13'
create or replace view jobskill3 as (select ps.pid
from personskill ps
where (select count(pjs.jobskill)
from personsJobSkills(ps.pid) pjs) = 3);

select p.pid, p.name
from person p
where (select count(kp.pid)
from knowsPerson(p.pid) kp
where kp.pid in (select js3.pid
from jobskill3 js3)) >= 2;

\qecho '14'
create or replace function friendCount(ppl integer)
returns bigint as
$$
select count(k.pid2)
from knows k
where k.pid1 = ppl;
$$ language sql;

select distinct p.pid, p2.pid
from person p, person p2, person p3
where p.pid <> p2.pid and friendCount(p.pid) = friendCount(p2.pid) and not exists ((select distinct kp.pid
from knowsPerson(p.pid) kp
union
select distinct kp2.pid
from knowsPerson(p2.pid) kp2)
except
(select distinct kp.pid
from knowsPerson(p.pid) kp
intersect
select distinct kp2.pid
from knowsperson(p2.pid) kp2));

\qecho '15'
select p.pid, p2.pid
from person p, person p2
where p.pid <> p2.pid and friendCount(p.pid) = friendCount(p2.pid);

\c postgres;
  DROP database assignment3;