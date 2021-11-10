DROP DATABASE IF EXISTS TRAVEL_COMPANY;
CREATE DATABASE TRAVEL_COMPANY;
USE TRAVEL_COMPANY;

/* SOLUTION 1 */
DROP TABLE IF EXISTS PASSENGER;
CREATE TABLE PASSENGER (
    Passenger_name VARCHAR(50),
    Category VARCHAR(20),
    Gender CHAR,
    Boarding_City VARCHAR(50),
    Destination_City VARCHAR(50),
    Distance INT,
    Bus_Type VARCHAR(20)
);

DROP TABLE IF EXISTS PRICE;
CREATE TABLE PRICE (
    Bus_Type VARCHAR(20),
    Distance INT,
    Price INT
);

/* SOLUTION 2 */
INSERT INTO PASSENGER VALUES("Sejal", "AC", 'F', "Bengaluru", "Chennai", 350, "Sleeper");
INSERT INTO PASSENGER VALUES("Anmol", "Non-AC", 'M', "Mumbai", "Hyderabad", 700, "Sitting");
INSERT INTO PASSENGER VALUES("Pallavi", "AC", 'F', "Panaji", "Bengaluru", 600, "Sleeper");
INSERT INTO PASSENGER VALUES("Khusboo", "AC", 'F', "Chennai", "Mumbai", 1500, "Sleeper");
INSERT INTO PASSENGER VALUES("Udit", "Non-AC", 'M', "Trivandrum", "panaji", 1000, "Sleeper");
INSERT INTO PASSENGER VALUES("Ankur", "AC", 'M', "Nagpur", "Hyderabad", 500, "Sitting");
INSERT INTO PASSENGER VALUES("Hemant", "Non-AC", 'M', "panaji", "Mumbai", 700, "Sleeper");
INSERT INTO PASSENGER VALUES("Manish", "Non-AC", 'M', "Hyderabad", "Bengaluru", 500, "Sitting");
INSERT INTO PASSENGER VALUES("Piyush", "AC", 'M', "Pune", "Nagpur", 700, "Sitting");

INSERT INTO PRICE VALUES("Sleeper", 350, 770);
INSERT INTO PRICE VALUES("Sleeper", 500, 1100);
INSERT INTO PRICE VALUES("Sleeper", 600, 1320);
INSERT INTO PRICE VALUES("Sleeper", 700, 1540);
INSERT INTO PRICE VALUES("Sleeper", 1000, 2200);
INSERT INTO PRICE VALUES("Sleeper", 1200, 2640);
INSERT INTO PRICE VALUES("Sleeper", 350, 434);
INSERT INTO PRICE VALUES("Sitting", 500, 620);
INSERT INTO PRICE VALUES("Sitting", 500, 620);
INSERT INTO PRICE VALUES("Sitting", 600, 744);
INSERT INTO PRICE VALUES("Sitting", 700, 868);
INSERT INTO PRICE VALUES("Sitting", 1000, 1240);
INSERT INTO PRICE VALUES("Sitting", 1200, 1488);
INSERT INTO PRICE VALUES("Sitting", 1500, 1860);

/* SOLUTION 3 */
SELECT 
    Gender, COUNT(Gender)
FROM
    PASSENGER p
WHERE
    p.Distance >= 600
GROUP BY p.Gender;

/* SOLUTION 4 */
SELECT 
    Bus_Type, MIN(Price)
FROM
    PRICE p
WHERE
    p.Bus_Type = 'Sleeper';
    
/* SOLUTION 5 */
SELECT 
    Passenger_name
FROM
    PASSENGER p
WHERE
    p.Passenger_name LIKE 'A%';
    
/* SOLUTION 6 */
SELECT 
    p.Passenger_name,
    p.Boarding_City,
    p.Destination_City,
    p.Bus_Type,
    r.Price
FROM
    PASSENGER p,
    PRICE r
WHERE
    p.Distance = r.Distance
        AND p.Bus_Type = r.Bus_Type;

/* SOLUTION 7 */
SELECT 
    p.Passenger_name, r.Price
FROM
    PASSENGER p,
    PRICE r
WHERE
    p.Bus_Type = 'Sitting'
        AND p.Distance > 1000
        AND p.Distance = r.Distance;

/* SOLUTION 8 */
SELECT 
    Bus_Type, Price
FROM
    PRICE
WHERE
    Distance = (SELECT 
            Distance
        FROM
            PASSENGER
        WHERE
            Boarding_City = 'Panaji'
                AND Destination_City = 'Bengaluru');

/* SOLUTION 9 */
SELECT DISTINCT
    Distance AS Non_repeated_distances
FROM
    PASSENGER
ORDER BY Distance DESC;

/* SOLUTION 10 */
SELECT 
    p.Passenger_name,
    p.Distance,
    p.Distance * 100 / (SELECT 
            SUM(p.Distance)
        FROM
            PASSENGER p) Percentage_Distance
FROM
    PASSENGER p;

/* SOLUTION 11 */
CALL cost_comp();