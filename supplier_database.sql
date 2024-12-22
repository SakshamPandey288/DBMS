create database supplier_database;
use supplier_database;

CREATE TABLE Supplier (
    sid INT PRIMARY KEY,
    sname VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Parts (
    pid INT PRIMARY KEY,
    pname VARCHAR(50),
    color VARCHAR(20)
);

CREATE TABLE Catalog (
    sid INT,
    pid INT,
    cost DECIMAL(10, 2),
    PRIMARY KEY (sid, pid),
    FOREIGN KEY (sid) REFERENCES Supplier(sid),
    FOREIGN KEY (pid) REFERENCES Parts(pid)
);

INSERT INTO Supplier VALUES (10001, 'Acme Widget', 'Bangalore');
INSERT INTO Supplier VALUES (10002, 'Johns', 'Kolkata');
INSERT INTO Supplier VALUES (10003, 'Vimal', 'Mumbai');
INSERT INTO Supplier VALUES (10004, 'Reliance', 'Delhi');
INSERT INTO Supplier VALUES (10005, 'Mahindra', 'Mumbai');

INSERT INTO Parts VALUES (20001, 'Book', 'Red');
INSERT INTO Parts VALUES (20002, 'Pen', 'Red');
INSERT INTO Parts VALUES (20003, 'Pencil', 'Green');
INSERT INTO Parts VALUES (20004, 'Mobile', 'Green');
INSERT INTO Parts VALUES (20005, 'Charger', 'Black');

INSERT INTO Catalog VALUES (10001, 20001, 10);
INSERT INTO Catalog VALUES (10001, 20002, 10);
INSERT INTO Catalog VALUES (10001, 20003, 30);
INSERT INTO Catalog VALUES (10001, 20004, 10);
INSERT INTO Catalog VALUES (10001, 20005, 10);
INSERT INTO Catalog VALUES (10002, 20001, 10);
INSERT INTO Catalog VALUES (10002, 20002, 20);
INSERT INTO Catalog VALUES (10003, 20003, 30);
INSERT INTO Catalog VALUES (10004, 20003, 40);

select * from supplier;

select * from parts;

select * from catalog;

SELECT DISTINCT pname
FROM Parts
WHERE pid IN (SELECT pid FROM Catalog);

SELECT sname
FROM Supplier
WHERE NOT EXISTS (
    SELECT pid 
    FROM Parts
    WHERE pid NOT IN (
        SELECT pid 
        FROM Catalog 
        WHERE Catalog.sid = Supplier.sid
    )
);

SELECT sname
FROM Supplier
WHERE NOT EXISTS (
    SELECT pid
    FROM Parts
    WHERE color = 'Red' AND pid NOT IN (
        SELECT pid
        FROM Catalog
        WHERE Catalog.sid = Supplier.sid
    )
);

SELECT pname
FROM Parts
WHERE pid IN (
    SELECT pid
    FROM Catalog
    WHERE sid = (SELECT sid FROM Supplier WHERE sname = 'Acme Widget Suppliers')
)
AND pid NOT IN (
    SELECT pid
    FROM Catalog
    WHERE sid != (SELECT sid FROM Supplier WHERE sname = 'Acme Widget Suppliers')
);

SELECT DISTINCT c.sid
FROM Catalog c
JOIN (
    SELECT pid, AVG(cost) AS avg_cost
    FROM Catalog
    GROUP BY pid
) avg_table ON c.pid = avg_table.pid
WHERE c.cost > avg_table.avg_cost;

SELECT p.pname, s.sname
FROM Parts p
JOIN Catalog c ON p.pid = c.pid
JOIN Supplier s ON c.sid = s.sid
WHERE (p.pid, c.cost) IN (
    SELECT pid, MAX(cost)
    FROM Catalog
    GROUP BY pid
);
