CREATE FUNCTION sum(A int[])
RETURNS int8 AS
$$
DECLARE s int8 := 0;
i int;
BEGIN
    FOR i IN array_lower(A,1)..array_length(A,1)
    LOOP 
        s := s + A[i];
    END LOOP;
    RETURN s;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION Ancestor_Descendant()
RETURNS void AS
$$
BEGIN
    DROP TABLE IF EXISTS ANC;
    CREATE TABLE ANC(A integer, D integer);

    INSERT INTO ANC SELECT * FROM PC;

    WHILE EXISTS (SELECT * FROM new_ANC_pairs())
    LOOP
        INSERT INTO ANC SELECT * FROM new_ANC_pairs();
    END LOOP;
END;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION TC()
RETURNS void AS
$$
BEGIN
    DROP TABLE IF EXISTS TC;
    CREATE TABLE TC(source integer, target integer);

    INSERT INTO TC SELECT * FROM Edge;

    WHILE EXISTS (SELECT * FROM new_TC_pairs())
    LOOP
        INSERT INTO ANC SELECT * FROM new_TC_pairs();
    END LOOP;
END;
$$ language plpgsql;