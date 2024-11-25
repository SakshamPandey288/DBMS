create database INSURANCE
USE INSURANCE;
CREATE TABLE PERSON (
    driver_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100)
);

CREATE TABLE CAR (
    reg_num VARCHAR(20) PRIMARY KEY,
    model VARCHAR(50),
    year INT
);

CREATE TABLE ACCIDENT (
    report_num INT PRIMARY KEY,
    accident_date DATE,
    location VARCHAR(100)
);

CREATE TABLE OWNS (
    driver_id VARCHAR(20),
    reg_num VARCHAR(20),
    PRIMARY KEY (driver_id, reg_num),
    FOREIGN KEY (driver_id) REFERENCES PERSON(driver_id),
    FOREIGN KEY (reg_num) REFERENCES CAR(reg_num)
);

CREATE TABLE PARTICIPATED (
    driver_id VARCHAR(20),
    reg_num VARCHAR(20),
    report_num INT,
    damage_amount INT,
    PRIMARY KEY (driver_id, reg_num, report_num),
    FOREIGN KEY (driver_id) REFERENCES PERSON(driver_id),
    FOREIGN KEY (reg_num) REFERENCES CAR(reg_num),
    FOREIGN KEY (report_num) REFERENCES ACCIDENT(report_num)
);
INSERT INTO PERSON VALUES
('A01', 'Richard', 'Srinivas Nagar'),
('A02', 'Pradeep', 'Rajaji Nagar'),
('A03', 'Smith', 'Ashok Nagar'),
('A04', 'Venu', 'N R Colony'),
('A05', 'John', 'Hanumanth Nagar');
INSERT INTO CAR VALUES
('KA052250', 'Indica', 1990),
('KA031181', 'Lancer', 1957),
('KA095477', 'Toyota', 1998),
('KA053408', 'Honda', 2008),
('KA041702', 'Audi', 2005);
INSERT INTO ACCIDENT VALUES
(101, '2023-06-15', 'MG Road'),
(102, '2023-07-01', 'Brigade Road'),
(103, '2023-07-15', 'Mall Road'),
(104, '2023-08-10', 'Whitefield'),
(105, '2023-08-25', 'Koramangala');
INSERT INTO OWNS VALUES
('A01', 'KA052250'),
('A02', 'KA031181'),
('A03', 'KA095477'),
('A04', 'KA053408'),
('A05', 'KA041702');
INSERT INTO PARTICIPATED VALUES
('A01', 'KA052250', 101, 10000),
('A02', 'KA031181', 102, 25000),
('A03', 'KA095477', 103, 15000),
('A04', 'KA053408', 104, 30000),
('A05', 'KA041702', 105, 5000);
SELECT accident_date, location FROM ACCIDENT;
UPDATE PARTICIPATED
SET damage_amount = 25000
WHERE reg_num = 'KA053408' AND report_num = 104;
INSERT INTO ACCIDENT VALUES
(106, '2024-01-10', 'Jayanagar');
SELECT accident_date, location FROM ACCIDENT;
SELECT DISTINCT P.driver_id, PER.name, PER.address
FROM PARTICIPATED P
JOIN PERSON PER ON P.driver_id = PER.driver_id
WHERE P.damage_amount >= 25000;
