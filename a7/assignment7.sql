-- Ben Reichert
-- Assignment 7
-- I worked with James C., Nick M., and Jackson E. on this assignment.

DROP DATABASE if exists assignment7;
CREATE DATABASE assignment7;
\c assignment7;

\qecho '1'

drop table if exists Tree;
create table Tree (
    parent integer,
    child integer
);

insert into Tree (parent, child)
values (1, 2), (1, 3), (1, 4),
        (2, 5),
        (3, 6),
        (4, 7),
        (5, 8),
        (7, 9),
        (9, 10);

\qecho 'Tree relation'
select *
from Tree;

drop function if exists distance(m integer, n integer);
CREATE FUNCTION distance(m integer, n integer)
RETURNS integer AS
$$
declare 
    count_m integer;
    count_n integer;
BEGIN
    count_m := 1;
    count_n := 1;
    drop table if exists par_m;
    create table par_m(val integer, dis integer);
    insert into par_m select t.parent, 1 from Tree t where m = child;
    insert into par_m (val, dis) values (m, 0);

    drop table if exists par_n;
    create table par_n(val integer, dis integer);
    insert into par_n select t.parent, 1 from Tree t where n = child;
    insert into par_n (val, dis) values (n, 0);

    loop
        if exists (select * from par_m a, par_n b where a.val = b.val) then return m.dis + n.dis from par_n n join par_m m on m.val = n.val;
        end if;
        insert into par_m select t.parent, count_m+1
                          from Tree t, par_m a
                          where t.child = a.val and a.dis = count_m;
        count_m := count_m + 1;

        insert into par_n select t.parent, count_n+1
                          from Tree t, par_n b
                          where t.child = b.val and b.dis = count_n;
        count_n := count_n + 1;
    end loop;
END;
$$
LANGUAGE plpgsql;

select distinct distance(1,10)
from Tree;
\qecho 'expected: 4'

select distinct distance(8,10)
from Tree;
\qecho 'expected: 7'

-- select t.parent as v1, t.child as v2, distance(t.parent, t.child)
-- from Tree t; 

-- select *
-- from (select t.parent from Tree t) a cross join (select t.child from Tree t) b;

-- \qecho 'Distance relation'
-- select a.parent as v1, b.child as v2, distance(a.parent, b.child)
-- from (select t.parent from Tree t) a cross join (select t.child from Tree t) b;

\qecho '2'

drop table if exists partSubPart;
create table partSubPart(
    pid integer,
    sid integer,
    quantity integer
);

insert into partSubPart(pid, sid, quantity)
values (1, 2, 4), (1, 3, 1), (3, 4, 1), (3, 5, 2), (3, 6, 3), (6, 7, 2), (6, 8, 3);

drop table if exists basicPart;
create table basicPart(
    pid integer,
    weight integer
);

insert into basicPart(pid, weight)
values (2, 5), (4, 50), (5, 3), (7, 6), (8, 10);

select * from partSubPart;
select * from basicPart;

\qecho '(a)'

drop function if exists aggregatedWeight(p integer);
create function aggregatedWeight(p integer)
returns integer as
$$
declare
    weight integer;
    r RECORD;
begin
    weight := 0;
    if p in (select bp.pid from basicPart bp)
        then return (select bp.weight from basicPart bp where p = bp.pid);
    end if;

    for r in select * from partSubPart
        loop
            if (r.pid = p)
                then weight := weight + r.quantity * aggregatedWeight(r.sid);
            end if;
        end loop;
    return weight;
end;
$$
language plpgsql;

select distinct aggregatedWeight(1);
\qecho 'expected: 202'

select distinct aggregatedWeight(2);
\qecho 'expected: 5'

select distinct aggregatedWeight(3);
\qecho 'expected: 182'

select distinct aggregatedWeight(4);
\qecho 'expected: 50'

select distinct aggregatedWeight(5);
\qecho 'expected: 3'

select distinct aggregatedWeight(6);
\qecho 'expected: 42'

select distinct aggregatedWeight(7);
\qecho 'expected: 6'

select distinct aggregatedWeight(8);
\qecho 'expected: 10'

\qecho '(b)'

drop view if exists bongo;
create view bongo as
SELECT DISTINCT psp1.pid as p1, psp1.sid as s1, psp1.quantity as q1, psp2.pid as p2, psp2.sid as s2, psp2.quantity as q2, bp.pid as p3, bp.weight as w
             FROM partSubPart psp1, partSubPart psp2, basicPart bp 
             WHERE (psp1.sid = psp2.pid AND psp2.sid = bp.pid) OR 
             (psp1.pid = psp2.pid AND psp1.sid = psp2.sid AND psp1.quantity = psp2.quantity AND psp1.sid = bp.pid);

select * from bongo;

drop function if exists aggregatedWeight(p integer);
create function aggregatedWeight(p integer)
returns integer as
$$
declare
    result integer;
    i RECORD;
begin
    result := 0;
    for i in select * from bongo where p1 = p or p = p3
    loop
        if i.s1 = i.p3 -- if partSubPart sid = basicPart pid
        then result := result + (i.q1 * i.w);
        end if;

        if i.s1 = i.p2 -- if partSubPart sid = partSubPart pid
        then result := result + i.q1*(i.q2 * i.w);
        end if;

        if i.p3 = p -- if basicPart pid = p
        then result := i.w;
        end if;
        
    end loop;
    return result;
end;
$$
LANGUAGE plpgsql;

select distinct aggregatedWeight(1)
from bongo;
\qecho 'expected: 202'

select distinct aggregatedWeight(2)
from bongo;
\qecho 'expected: 5'

select distinct aggregatedWeight(3)
from bongo;
\qecho 'expected: 182'

select distinct aggregatedWeight(4)
from bongo;
\qecho 'expected: 50'

select distinct aggregatedWeight(5)
from bongo;
\qecho 'expected: 3'

select distinct aggregatedWeight(6)
from bongo;
\qecho 'expected: 42'

select distinct aggregatedWeight(7)
from bongo;
\qecho 'expected: 6'

select distinct aggregatedWeight(8)
from bongo;
\qecho 'expected: 10'

drop function if exists aggregatedWeightIter(p integer);
create function aggregatedWeightIter(p integer)
returns integer as
$$
declare
    weight integer;
    r record;
begin
    drop table if exists ans;
    create table ans(part integer, weight integer);
    insert into ans values(p, 0);

    if p in (select bp.pid from basicPart bp)
        then return (select bp.weight from basicPart bp where p = bp.pid);
    end if;

    for r in select * from partSubPart
        loop
            if r.pid in (select a.part from ans a)
                then if r.sid in (select bp.pid from basicPart bp)
                        then weight := (select sum(a.weight) from ans a where a.part = r.pid)
                                        + r.quantity * (select sum(bp.weight) from basicPart bp where bp.pid = r.sid);
                            delete from ans a where a.part = r.pid;
                            insert into ans values (r.pid, weight);
                            weight := 0;
                        else insert into ans values (r.sid, 0);
                    end if;
            end if;
        end loop;
    
    for r in select * from ans
        loop
            if r.part in (select psp.sid from partSubPart psp)
                then weight := r.weight * (select psp.quantity from partSubPart psp where psp.sid = r.part);
                delete from ans a where a.part = r.part;
                insert into ans values (r.part, weight);
                weight := 0;
            end if;
        end loop;
    return (select sum(a.weight) from ans a);
end;
$$
language plpgsql;

select distinct aggregatedWeightIter(1);
\qecho 'expected: 202'

select distinct aggregatedWeightIter(2);
\qecho 'expected: 5'

select distinct aggregatedWeightIter(3);
\qecho 'expected: 182'

select distinct aggregatedWeightIter(4);
\qecho 'expected: 50'

select distinct aggregatedWeightIter(5);
\qecho 'expected: 3'

select distinct aggregatedWeightIter(6);
\qecho 'expected: 42'

select distinct aggregatedWeightIter(7);
\qecho 'expected: 6'

select distinct aggregatedWeightIter(8);
\qecho 'expected: 10'

\qecho '3'

drop table if exists A;
create table A (x integer);
insert into A values (1), (2), (3), (4), (5);
select * from A;

drop table if exists subsets;
create table subsets(x int[]);
drop function if exists powerset(x int[]);
create function powerset(x int[])
returns VOID as
$$
declare
    i integer;
begin
    insert into subsets values(x);

    for i in (select unnest(x))
        loop
            perform powerset(array(select * from unnest(x) as val where val <> i));
        end loop;
end;
$$
language plpgsql;

select * from powerset(array[1, 2, 3, 4, 5]);
select distinct * from subsets order by x;

drop function if exists subset(A anyarray, B anyarray);
create function subset(A anyarray, B anyarray)
returns boolean as
$$
    select A <@ B;
$$
language sql;

drop function if exists superset(A anyarray, B anyarray);
create function superset(A anyarray, B anyarray)
returns boolean as
$$
    select A @> B;
$$
language sql;

drop function if exists superSetsOfSet(x int[]);
create function superSetsOfSet(x int[])
returns table(arr int[]) as
$$
declare 
    j int[];
begin
    drop table if exists ans;
    create table ans(arr int[]);

    drop table if exists subset;
    create table subset(x int[]);
    perform powerset(array(select * from A));
    --raise notice 'poopoo';

    for j in (select * from subsets)
        loop
            --raise notice 'doodoo';
            if subset(x,j)
                then insert into ans values(j);
            end if;
        end loop;
    return query select distinct * from ans;
end;
$$
language plpgsql;

select superSetsOfSet(array[2,3]);

\qecho '4'
drop table if exists document;
create table document(doc text, words text[]);
insert into document values
  ('d1', array['A','B','C']),
  ('d2', array['B','C','D']),
  ('d3', array['A','E']),
  ('d4', array['B', 'B', 'A', 'D']),
  ('d5', array['E','F']),
  ('d6', array['A','D','G']),
  ('d7', array['C','B','A']),
  ('d8', array['B','A']);

select * from document;

drop table if exists powerSetsWords;
create table powerSetsWords(val text[]);
drop function if exists powerSetWords(x text[]);
create function powerSetWords(x text[])
returns void as
$$
declare
    i text;
begin
    insert into powerSetsWords values (x);
    for i in select unnest(x)
        loop
            perform powerSetWords(array(select distinct * from unnest(x) as val where val <> i));
        end loop;
end;
$$ language plpgsql;

drop function if exists frequentSets(t int);
create function frequentSets(t int)
returns table(x text[]) as
$$
declare
    words text[];
    i text[];
    j text[];
    count integer;
begin
    words := array['A','B','C','D','E','F','G'];
    drop table if exists powerSetsWords;
    create table powerSetsWords(words text[]);
    perform powerSetWords(words);
    drop table if exists ans;
    create table ans(X text[]);
    for i in (select distinct * from powerSetsWords)
        loop
            count := 0;
            for j in (select distinct d.words from document d)
            loop
                if subset(i,j) then count := count + 1;
                    if count >= t then insert into ans select distinct i;
                    end if;
                end if;
            end loop;
        end loop;
    return query select distinct * from ans;
end;
$$
language plpgsql;

select x as frequentSets from frequentSets(1);
select x as frequentSets from frequentSets(2);
select x as frequentSets from frequentSets(3);
select x as frequentSets from frequentSets(4);
select x as frequentSets from frequentSets(5);
select x as frequentSets from frequentSets(6);
select x as frequentSets from frequentSets(7);

\c postgres;
drop database assignment7;