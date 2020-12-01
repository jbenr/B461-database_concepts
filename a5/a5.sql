drop database if exists a5;
create database a5;
\c a5

create or replace function makerandomR
(m integer, n integer, l integer)
returns void as
$$
declare i integer; j integer;
begin
    drop table if exists Ra;
    drop table if exists Rb;
    drop table if exists R;
    create table Ra
    (
        a int
    );
    create table Rb
    (
        b int
    );
    create table R
    (
        a int,
        b int
    );
    for i in 1..m loop
    insert into Ra
    values(i);
end
loop;
    for j in 1..n loop
insert into Rb
values(j);
end loop;
insert into R
select *
from Ra a, Rb b
order by random() limit(l);
end;
$$ LANGUAGE
plpgsql;

create or replace function makerandomS
(n integer, l integer)
returns void as
$$
declare i integer;
begin
    drop table if exists Sb;
    drop table if exists S;
    create table Sb
    (
        b int
    );
    create table S
    (
        b int
    );
    for i in 1..n loop
    insert into Sb
    values(i);
end
loop;
insert into S
select *
from Sb
order by random() limit (l);
end;
$$ LANGUAGE
plpgsql;

select *
from makerandomR(1,5,10);

select *
from makerandomS(5,10);

select distinct r1.a
from R r1, R r2
where  r1.b = r2.a;

select distinct r1.a
from R r1
natural join
(select distinct r2.a as b
from R r2)
r2;

\qecho '4'

\qecho 'a)'
explain analyze
select distinct r1.a
from R r1, R r2, R r3
where  r1.b = r2.a and r2.b = r3.a;

\qecho 'b)'
\qecho 'Optimized'
explain analyze
select distinct r1.a
from R r1
natural join (select distinct r2.a as b from R r2) r2
natural join (select distinct r3.a as b from R r3) r3;

\qecho 'RA'
--explain analyze
select distinct r1.a
from R r1 inner join R r2 on (r1.b = r2.a)
inner join R r3 on (r2.b = r3.a);

\qecho '5'

\qecho 'a)'
explain analyze
select ra.a
from Ra ra
where not exists (select r.b
                 from R r
                 where r.a = ra.a and
                       r.b not in (select s.b from S s));

\qecho 'b)'
select q1.rra
from (select ra.a as rra
     from Ra ra
        except
     select ra.a
     from Ra ra, R r
     where r.a = ra.a and r.b not in (select s.b from S s)) q1
order by 1;

explain analyze
\qecho 'Optimized'
select q1.rra
from (select ra.a as rra
     from Ra ra
        except
     select q2.rra
     from (select ra.a as rra, r.b
          from Ra ra, R r
          where r.a = ra.a
            except
          select ra.a, r.b
          from Ra ra, R r, S s
          where r.b = s.b) q2) q1
order by 1;

--explain analyze
\qecho 'RA'
select q1.rra
from (select ra.a as rra
     from Ra ra
        except
     select q2.rra
     from (select ra.a as rra, r.b
          from Ra ra inner join R r on (r.a = ra.a)
            except
          select ra.a, r.b
          from Ra ra inner join R r on (r.a = r.a)
          inner join S s on (r.b = s.b)) q2) q1
order by 1;

\qecho '6'

\qecho 'a)'
explain analyze
select ra.a
from Ra ra
where not exists (select s.b
                 from S s
                 where s.b not in (select r.b
                                  from R r
                                  where r.a = ra.a));

\qecho 'b)'
select q1.rra
from (select ra.a as rra
     from Ra ra
        except
     select ra.a
     from Ra ra, S s
     where s.b not in (select r.b
                      from R r
                      where r.a = ra.a)) q1
order by 1;

\qecho 'Optimized'
explain analyze
select q1.rra
from (select ra.a as rra
     from Ra ra
        except
     select q2.rra
     from (select ra.a as rra, s.b
          from Ra ra, R r, S s
            except
          select ra.a, s.b
          from Ra ra, R r, S s
          where s.b = r.b and r.a = ra.a) q2) q1
order by 1;

\qecho 'RA'
--explain analyze
select q1.rra
from (select ra.a as rra
     from Ra ra
        except
     select q2.rra
     from (select ra.a as rra, s.b
          from Ra ra inner join R r on (r.a = r.a)
          inner join S s on (s.b = s.b)
            except
          select ra.a, s.b
          from Ra ra inner join R r on (r.a = ra.a)
          inner join S s on (s.b = r.b)) q2) q1
order by 1;

\c postgres;
DROP database a5;