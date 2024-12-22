create database bank;
use bank;

CREATE TABLE branch (
    branch_name VARCHAR(30),
    branch_city VARCHAR(25),
    assets INT,
    PRIMARY KEY (branch_name)
);

CREATE TABLE bankaccount (
    accno INT,
    branch_name VARCHAR(30),
    balance INT,
    PRIMARY KEY (accno),
    FOREIGN KEY (branch_name)
        REFERENCES branch (branch_name)
);

CREATE TABLE bankcustomer (
    customername VARCHAR(20),
    customer_street VARCHAR(30),
    customer_city VARCHAR(35),
    PRIMARY KEY (customername)
);

CREATE TABLE depositer (
    customername VARCHAR(20),
    accno INT,
    PRIMARY KEY (customername , accno),
    FOREIGN KEY (accno)
        REFERENCES bankaccount (accno),
    FOREIGN KEY (customername)
        REFERENCES bankcustomer (customername)
);

CREATE TABLE loan (
    loan_number INT,
    branch_name VARCHAR(30),
    amount INT,
    PRIMARY KEY (loan_number),
    FOREIGN KEY (branch_name)
        REFERENCES branch (branch_name)
);

CREATE TABLE borrower (
    loan_number INT,
    customername VARCHAR(20),
    PRIMARY KEY (loan_number),
    FOREIGN KEY (loan_number)
        REFERENCES loan (loan_number),
    FOREIGN KEY (customername)
        REFERENCES bankcustomer (customername)
);

insert into branch values("SBI_Chamrajpet","Bangalore",50000);
insert into branch values("SBI_ResidencyRoad","Bangalore",10000);
insert into branch values("SBI_ShivajiRoad","Bombay",20000);
insert into branch values("SBI_Parliamentroad","Delhi",10000);
insert into branch values("SBI_Jantarmantar","Delhi",20000);

insert into bankaccount values(1,"SBI_Chamrajpet",2000);
insert into bankaccount values(2,"SBI_ResidencyRoad",5000);
insert into bankaccount values(3,"SBI_ShivajiRoad",6000);
insert into bankaccount values(4,"SBI_Parliamentroad",9000);
insert into bankaccount values(5,"SBI_Jantarmantar",8000);
insert into bankaccount values(6,"SBI_ShivajiRoad",4000);
insert into bankaccount values(8,"SBI_ResidencyRoad",4000);
insert into bankaccount values(9,"SBI_Parliamentroad",3000);
insert into bankaccount values(10,"SBI_ResidencyRoad",5000);
insert into bankaccount values(11,"SBI_Jantarmantar",2000);
                                
insert into bankcustomer values("Avinash","BUll_temple_Road","Bangalore");
insert into bankcustomer values("Dinesh","Bannergatta_Road","Bangalore");
insert into bankcustomer values("Mohan","NationaCollege_Road","Bangalore");
insert into bankcustomer values("Nikil","Akbar_Road","Delhi");
insert into bankcustomer values("Ravi","Prithviraj_Road","Delhi");


insert into depositer values("Avinash",1);
insert into depositer values("Dinesh",2);
insert into depositer values("Nikil",4);
insert into depositer values("Ravi",5);
insert into depositer values("Avinash",8);
insert into depositer values("Nikil",9);
insert into depositer values("Dinesh",10);
insert into depositer values("Nikil",11);

insert into loan values(1,"SBI_Chamrajpet",1000);
insert into loan values(2,"SBI_ResidencyRoad",2000);
insert into loan values(3,"SBI_ShivajiRoad",3000);
insert into loan values(4,"SBI_Parliamentroad",4000);
insert into loan values(5,"SBI_Jantarmantar",5000);

insert into borrower values(1,"Mohan");
insert into borrower values(2,"Avinash");
insert into borrower values(3,"Dinesh");
insert into borrower values(4,"Mohan");
insert into borrower values(5,"Nikil");

select * from branch;

select * from bankaccount;

select * from bankcustomer;

select * from depositer;

select * from loan;

select * from borrower;

select branch_name,(assets/100000) as assets_in_lakhs from branch;

SELECT 
    d.customername
FROM
    depositer d,
    bankaccount b
WHERE
    b.branch_name = 'SBI_ResidencyRoad'
        AND d.accno = b.accno
GROUP BY d.customername
HAVING COUNT(d.accno) >= 2;


select d.customername from depositer d,bankaccount b
where d.accno=b.accno
group by d.customername having count(d.accno)>=2;


SELECT 
    branch_name, SUM(amount) AS Total_loan_amount
FROM
    loan
GROUP BY branch_name;


create view sum_of_loan
as select branch_name,sum(amount) from loan
group by branch_name;


select * from sum_of_loan;


select distinct s.customername from depositer s
where not exists ((select branch_name from branch where branch_city="Delhi") except (select r.branch_name from depositer t, bankaccount r 
where t.accno=r.accno and
s.customername=t.customername));


select distinct customername from borrower
where customername not in (select customername from depositer);


SELECT DISTINCT
    b.customername
FROM
    borrower b,
    loan l,
    depositer d,
    branch br
WHERE
    b.loan_number = l.loan_number
        AND l.branch_name = br.branch_name
        AND br.branch_city = 'Bangalore'
        AND b.customername IN (SELECT 
            customername
        FROM
            depositer);


SELECT 
    branch_name
FROM
    branch
WHERE
    assets > ALL (SELECT 
            assets
        FROM
            branch
        WHERE
            branch_city = 'Bangalore');


DELETE FROM bankaccount 
WHERE
    branch_name IN (SELECT 
        branch_name
    FROM
        branch
    
    WHERE
        branch_city = "Bombay");


select * from bankaccount;


UPDATE bankaccount 
SET 
    balance = balance * 1.05;

select * from bankaccount;

commit;
