
CREATE TABLE IF NOT EXISTS Student (sid int,
                                    sname text,
                                    byear text,
                                    PRIMARY KEY (sid));

INSERT INTO Student VALUES (1, 'Wilco', 1998);
INSERT INTO Student VALUES (2, 'Jorge', 1992);
INSERT INTO Student VALUES (3, 'Jack', 1999);
INSERT INTO Student VALUES (4, 'Jaques', 1998);
INSERT INTO Student VALUES (5, 'Rotoro', 1998);
INSERT INTO Student VALUES (6, 'Loosho', 1950);
INSERT INTO Student VALUES (7, 'Dirk', 2015);

CREATE TABLE IF NOT EXISTS Course (cno int,
                                   cname text,
                                   maxEnrollment int,
                                   PRIMARY KEY (cno));

INSERT INTO Course VALUES (100, 'SQL Hell', 21);
INSERT INTO Course VALUES (343, 'Data Structures', 4);
INSERT INTO Course VALUES (666, 'Ghost Hunting', 11);
INSERT INTO Course VALUES (101, 'Rune Discovery', 6);
INSERT INTO Course VALUES (001, 'Real World Applications Of Tomato Base', 2);
INSERT INTO Course VALUES (420, 'Intro To Sick Kick Flips', 6);
INSERT INTO Course VALUES (999, 'Being Rich, A Guide', 5);
INSERT INTO Course VALUES (002, 'Hungry Hippos: Western Ecology', 7);
INSERT INTO Course VALUES (969, 'Getting Through Your Marriage', 8);
INSERT INTO Course VALUES (858, 'Big Words', 11);

CREATE TABLE IF NOT EXISTS Major (major text,
                                  PRIMARY KEY (major));

INSERT INTO Major VALUES ('Mathematics');
INSERT INTO Major VALUES ('Monster Hunting');
INSERT INTO Major VALUES ('Law Man');
INSERT INTO Major VALUES ('Programming');
INSERT INTO Major VALUES ('Simping');

CREATE TABLE IF NOT EXISTS Enroll (sid int,
                                   cno int,
                                  PRIMARY KEY (sid, cno),
                                  FOREIGN KEY (sid) REFERENCES Student(sid),
                                FOREIGN KEY (cno) REFERENCES Course(cno));

INSERT INTO Enroll VALUES (1, 100);
INSERT INTO Enroll VALUES (1, 343);
INSERT INTO Enroll VALUES (1, 969);
INSERT INTO Enroll VALUES (2, 420);
INSERT INTO Enroll VALUES (2, 858);
INSERT INTO Enroll VALUES (2, 343);
INSERT INTO Enroll VALUES (3, 999);
INSERT INTO Enroll VALUES (3, 002);
INSERT INTO Enroll VALUES (4, 100);
INSERT INTO Enroll VALUES (4, 666);
INSERT INTO Enroll VALUES (5, 100);
INSERT INTO Enroll VALUES (5, 001);
INSERT INTO Enroll VALUES (6, 100);
INSERT INTO Enroll VALUES (6, 858);
INSERT INTO Enroll VALUES (7, 101);

CREATE TABLE IF NOT EXISTS hasMajor (sid int,
                                     major text,
                                   PRIMARY KEY (sid, major),
                                 FOREIGN KEY (sid) REFERENCES Student(sid),
                               FOREIGN KEY (major) REFERENCES Major(major));

INSERT INTO hasMajor VALUES (1, 'Mathematics');
INSERT INTO hasMajor VALUES (1, 'Law Man');
INSERT INTO hasMajor VALUES (2, 'Simping');
INSERT INTO hasMajor VALUES (3, 'Programming');
INSERT INTO hasMajor VALUES (4, 'Monster Hunting');
INSERT INTO hasMajor VALUES (5, 'Mathematics');
INSERT INTO hasMajor VALUES (6, 'Simping');
INSERT INTO hasMajor VALUES (7, 'Law Man');

CREATE TABLE IF NOT EXISTS hasPrerequisite(cno int,
                                           preReqcno int,
                                         PRIMARY KEY (cno, preReqcno),
                                         FOREIGN KEY (cno) REFERENCES Course(cno),
                                       FOREIGN KEY (preReqcno) REFERENCES Course(cno));

INSERT INTO hasPrerequisite VALUES (343, 100);
INSERT INTO hasPrerequisite VALUES (001, 100);
