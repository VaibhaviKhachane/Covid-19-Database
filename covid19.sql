CREATE DATABASE covid19Database;
/*Table-Creation*/
CREATE TABLE world(countryId numeric primary key, countryName varchar(255) not null,
noDeaths numeric not null, noRecovered numeric not null,
vaccineDevStage varchar, vaccineId numeric(3) unique,
tCase numeric);

CREATE TABLE India(stateId numeric(1) primary key, stateName varchar(255) not null,
noDeaths numeric not null, noRecovered numeric not null,
noHealthWorkers numeric, totalCases numeric not null);

CREATE TABLE ageIndia(stateId numeric(1) primary key, noAge0_19 numeric not null,
noAge20_39 numeric not null, noAge40_59 numeric not null,
noAge60_above numeric not null, populationS numeric not null);

CREATE TABLE vaccineDistriIndia(stateId numeric(1) primary key,
noDeaths numeric not null, noRecovered numeric not null,
percentageHealthWorkers float,
noAge60_above numeric not null, totalCases numeric not null);

CREATE TABLE canAdopt (stateId numeric(1) Foreign Key REFERENCES India(stateId), totalCases numeric not null, age60_above numeric,
perHealthWorker float);

CREATE TABLE mainAge(stateId numeric(1) Foreign Key REFERENCES India(stateId), age60_above numeric);

/*DML query*/
INSERT INTO world(countryId,countryName,noDeaths,noRecovered,vaccineDevStage, vaccineId,tCase)
VALUES(1,'USA', 263687,7548940,'3',101,12777174);
INSERT INTO world(countryId,countryName,noDeaths,noRecovered,vaccineDevStage, vaccineId,tCase)
VALUES(2,'India', 134254,8592407,'3',102,9177840);
INSERT INTO world(countryId,countryName,noDeaths,noRecovered,vaccineDevStage, vaccineId,tCase)
VALUES(3,'Brazil', 169541,5432505,null,null,6088004);
INSERT INTO world(countryId,countryName,noDeaths,noRecovered,vaccineDevStage, vaccineId,tCase)
VALUES(4,'Russia', 36540,1611445,'2',103,2114502);
INSERT INTO world (countryId,countryName,noDeaths,noRecovered,vaccineDevStage, vaccineId,tCase)
VALUES(5,'UK', 55230,135,'4',104,1527495);

INSERT INTO India VALUES(1, 'Maharashtra', 47666, 1654793, 134859, 1784361);
INSERT INTO India VALUES(2, 'Gujrat', 3873, 181138, 45058, 198737);
INSERT INTO India VALUES(3, 'Delhi', 8512, 488476, 8999, 534317);
INSERT INTO India VALUES(4, 'Andhra Pradesh', 6948, 842416, 62349, 862758);
INSERT INTO India VALUES(5, 'Goa', 677, 45083, 27166, 46901);

INSERT INTO ageIndia VALUES(1, 10627267,38281546, 22033674, 5853226, 76795713);
INSERT INTO ageIndia VALUES(2, 17161928,20171297, 11931619, 4786559, 54051403);
INSERT INTO ageIndia VALUES(3, 6232694,6186329, 22033674, 1147445, 35600142);
INSERT INTO ageIndia VALUES(4, 29884539,29022840, 16623726, 8278241, 83809346);
INSERT INTO ageIndia VALUES(5, 432035, 515528, 345393, 163495, 1456451);

INSERT INTO vaccineDistriIndia VALUES (1, 47666, 1654793, 13.57, 5853226, 1784361);
INSERT INTO vaccineDistriIndia VALUES (2,3873,181138,3.92, 4786559,198737);
INSERT INTO vaccineDistriIndia VALUES (3,8512,488476, 3.32, 1147445,534317);
INSERT INTO vaccineDistriIndia VALUES (4,6948, 842416, 8.00, 8278241, 862758);
INSERT INTO vaccineDistriIndia VALUES (5, 677,45083, 0.22, 163495, 46901);

INSERT INTO canAdopt VALUES(1, 1784361,5853226,13.57);
INSERT INTO canAdopt VALUES(2, 198737, 4786559,3.92);
INSERT INTO canAdopt VALUES(3, 534317, 1147445,3.32);
INSERT INTO canAdopt VALUES(4, 862758,8278241,8.00);
INSERT INTO canAdopt VALUES(5, 46901,163495,0.22);

INSERT INTO mainAge VALUES(1,5853226);
INSERT INTO mainAge VALUES(2, 4786559);
INSERT INTO mainAge VALUES(3, 1147445);
INSERT INTO mainAge VALUES(4, 8278241);
INSERT INTO mainAge VALUES(5, 163495);

ALTER TABLE vaccineDistriIndia
ALTER COLUMN percentageHealthWorkers float;

ALTER TABLE world
ADD FOREIGN KEY(stateId) REFERENCES India(stateId);

UPDATE world
SET stateId = 1
WHERE vaccineDevStage = 3;

/*RELATED QUERIES*/

/*Queries of table world*/

SELECT * FROM world;
SELECT * FROM world
ORDER BY vaccineDevStage;
SELECT MAX(tCase) AS LargestCases
FROM world;
SELECT AVG(tCase) As AverageTotalCase
FROM world;
SELECT world.countryId, India.stateName
FROM world
INNER JOIN India ON world.stateId=India.stateId;

/*Queries on table India*/
SELECT * FROM India;
SELECT * FROM India
ORDER BY noHealthWorkers;
SELECT MAX(noDeaths) AS LargestDeaths
FROM India;
SELECT AVG(totalCases) As AverageTotalCase
FROM India;
SELECT world.countryId, India.stateName
FROM India
INNER JOIN world ON world.stateId=India.stateId;

/*Queries on table ageIndia*/
SELECT * FROM ageIndia;
SELECT * FROM ageIndia
ORDER BY noAge61_above;
SELECT MAX(noAge61_above) AS AgedState
FROM ageIndia;
SELECT AVG(noAge61_above) As ageAbove60
FROM ageIndia;

/*Queries on table vaccineDistriIndia*/
SELECT * FROM vaccineDistriIndia;
SELECT * FROM vaccineDistriIndia
ORDER BY noAge61_above;
SELECT MAX(noDeaths) AS LargestDeaths
FROM vaccineDistriIndia;
SELECT AVG(noDeaths) As AverageDeaths
FROM vaccineDistriIndia;
SELECT vaccineDistriIndia.stateId, India.stateName
FROM vaccineDistriIndia
INNER JOIN India ON vaccineDistriIndia.stateId=India.stateId
ORDER BY stateName;
