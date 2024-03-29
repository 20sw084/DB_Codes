-- First Create Database named truck_company_db manually. (https://dev.mysql.com/doc/workbench/en/wb-getting-started-tutorial-creating-a-model.html)

use truck_company_db;
CREATE TABLE trucks(
truckNumber char(10) PRIMARY KEY,
Lease BOOL,
companyOwned BOOL,
driverOwner int,
lifting decimal(10,3),
CHECK( Lease OR companyOwned OR (driverOwner IS NOT NULL))
);
select * from trucks;

CREATE TABLE drivers(
driverID int PRIMARY KEY,
firstname varchar(30),
lastname varchar(30)  NOT NULL,
street varchar(50),
city varchar(50),
zip char(5),
state char(2),
primaryPhone char(14)  NOT NULL,
email varchar(100),
truckNumber char(10), 
FOREIGN KEY(truckNumber) REFERENCES trucks(truckNumber)
);

CREATE TABLE clients(
clientID int PRIMARY KEY,
companyName varchar(70)  NOT NULL,
street varchar(50),
city varchar(50),
zip char(5),
state char(2),
primaryPhone char(14) NOT NULL,
email varchar(100)
);

CREATE TABLE repair(
repairID int AUTO_INCREMENT PRIMARY KEY,
truckNumber char(10)  NOT NULL,
timeIn datetime NOT NULL,
workDescription varchar(200),
timeOut datetime,
charge DECIMAL(10,2),
FOREIGN KEY(truckNumber) REFERENCES trucks(truckNumber)
);


CREATE TABLE loads(
loadID int AUTO_INCREMENT PRIMARY KEY,
delivaryDate date NOT NULL,
delivaryTime time NOT NULL,
clientID int,
driverID int NOT NULL,
deliveryAddress varchar(200) NOT NULL,
descriptionOfLoad varchar(200),
pickupAddress varchar(200)  NOT NULL,
cost decimal(10,2) CHECK (cost>=0),
FOREIGN KEY(driverID) REFERENCES drivers(driverID)
);

-- 4. a, b Tables
-- Add at least 2 different defaults
ALTER TABLE repair MODIFY COLUMN timeIn datetime DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE repair MODIFY COLUMN  charge DECIMAL(10,2) default 0;

-- 5. a Constraints
-- Add a not null constraint
ALTER TABLE loads MODIFY COLUMN clientID int not null;

-- 6 a Constraints
-- Add at least 1 check constraints using ENUM or check constraint
alter table repair add constraint repair_charge_chk check (charge>=0);
alter table repair add constraint repair_dates_chk check ((timeOut is NULL) OR (timeIn<=timeOut));

-- 7. a – e Constraints
-- look tables and this one
alter table trucks add constraint trucks_owner_fk FOREIGN KEY(driverOwner) REFERENCES drivers(driverID);
alter table loads add constraint loads_clients_fk FOREIGN KEY(clientID) REFERENCES clients(clientID);

-- 8 a, b Tables
-- Create a table from another table – structure and data 
-- Drop the created table
CREATE TABLE clients_copy
 AS 
 SELECT * 
 FROM clients;

-- drop table:
DROP TABLE clients_copy;

-- 9. a
-- Insert at least 10 records into 3 of the tables 
-- Use the follow at least once
-- VARCHAR, INT, DATE, FLOAT/DECIMAL/DOUBLE
INSERT INTO trucks(truckNumber,Lease,companyOwned,driverOwner,lifting) VALUES 
('ZY71300',0,1,NULL,300),
('ZU91184',0,1,NULL,400),
('ZU32296',1,0,NULL,100),
('ZU11185',1,0,NULL,150),
('ZX22495',0,1,NULL,230),
('ZY62629',0,1,NULL,370),
('ZZ72031',0,1,NULL,380),
('ZY72265',0,1,NULL,460),
('ZU72357',0,1,NULL,245),
('989CYZ',1,0,NULL,370);


INSERT INTO drivers(driverID,firstname,lastname,street,city,zip,state,primaryPhone,email,truckNumber) VALUES 
(1,'Maria','Anderson','4602 Coal Road','Lock Haven','17745','PA','570-605-5189','MariaPAnderson@jourrapide.com','ZY71300'),
(2,'Robert','McDowell','2020 New Creek Road','Fort Wayne','46865','IN','260-227-7962','RobertMMcDowell@teleworm.us','989CYZ'),
(3,'Glen','Bushong','2864 Norma Avenue','Alto','75925','TX','936-879-7975','GlenBBushong@teleworm.us','ZU91184'),
(4,'William','Davis','1056 Karen Lane','Louisville','40207','KY','502-891-0948','WilliamRDavis@armyspy.com','ZU32296'),
(5,'Melissa','Morgan','3522 Shobe Lane','Denver','80202','CO','970-440-4419','MelissaIMorgan@dayrep.com','ZX22495'),
(6,'Cathy','Jones','1311 Ripple Street','Bridgeport','48722','MI','989-770-1727','CathyRJones@teleworm.us','ZU72357'),
(7,'Regina','Echeverria','1976 Five Points','Baltimore','21201','MD','443-291-9381','ReginaJEcheverria@jourrapide.com',NULL),
(8,'Brant','Morrow','326 Stiles Street','Portland','97205','OR','412-625-7702','BrantCMorrow@armyspy.com','ZU11185'),
(9,'Joel','Miner','2267 Boone Crockett Lane','Elma','98541','OR','360-482-7171','JoelDMiner@armyspy.com','ZU11185'),
(10,'Joyce','Lee','4468 Stratford Park','Evansville','47711','MI','812-868-9706','JoyceTLee@dayrep.com','ZZ72031');


INSERT INTO repair(truckNumber,timeIn,workDescription,timeOut,charge) VALUES 
('ZY71300','2021-08-12 12:34','Something knocks','2021-08-12 17:34',120),
('ZU91184','2021-08-12 14:40','Something knocks','2021-08-12 17:50',120),
('ZY71300','2021-09-11 12:40','Brake does not work','2021-09-11 12:40',230),
('ZY71300','2021-10-15 09:34','Engine does not work','2021-10-16 16:14',1200),
('ZY71300','2021-10-25 10:00','Problems with this iron trough again',NULL,NULL),
('ZU32296','2021-10-26 12:34','Change of oil','2021-10-26 17:34',70),
('ZU11185','2021-10-26 14:40','Change of oil','2021-10-26 17:50',70),
('ZX22495','2021-10-26 12:40','Change of oil','2021-10-26 12:40',70),
('ZX22495','2021-10-27 09:34','Wheel change',NULL,NULL),
('ZY72265','2021-10-27 10:00','Change of oil',NULL,NULL);


-- insert into clients:
INSERT INTO clients(clientID,companyName,street,city,zip,state,primaryPhone,email) VALUES
(1, 'Atlas Architectural Designs','4630 Custer Street','Altoona','16601','PA','814-946-2259','ArianaFHelm@rhyta.com'),
(2,'Endicott Johnson','4282 Hart Country Lane','Columbus','31901','KY','706-555-4090','RayIAbreu@teleworm.us'),
(3,'Strength Gurus','3356 Rockford Road','Reno','89501','OR','775-216-6242','EleanorGSchisler@teleworm.us');

INSERT INTO loads(delivaryDate,delivaryTime,clientID,driverID,deliveryAddress,descriptionOfLoad,pickupAddress,cost) VALUES
('2021-10-01','10:00',1,1,'4884 Thrash Trail, Hallsville','Cats','404 Thrash Trail, Hallsville',25),
('2021-10-01','14:00',1,1,'404 Thrash Trail, Hallsville','Cats','4884 Thrash Trail, Hallsville',27),
('2021-10-03','10:00',1,2,'323 Jones Street, Roanoke','Goods','4884 Thrash Trail, Hallsville',35),
('2021-10-04','10:00',2,3,'627 Michael Street, Sugar Land',NULL,'4545 Victoria Court, South China',1200);


-- 10 a-c Data	Update at least 3 records
UPDATE trucks
SET driverOwner=2,Lease=0, companyOwned=0
WHERE truckNumber='989CYZ';

UPDATE trucks
SET driverOwner=3,Lease=0, companyOwned=0
WHERE truckNumber='ZU72357';

UPDATE repair
SET charge=240, timeOut=DATE_ADD(timeIn, INTERVAL 4 HOUR)
WHERE repairID=10;

-- 11 a, b, c
-- Functions	Group  by functions 
-- Query with: 
-- sum and average
-- a) find total charge spend on repairs
SELECT sum(charge) 'total charge'
FROM repair;
-- b) count: how many repairs was made by trucs:
SELECT truckNumber, COUNT(*) numberRepairs
FROM repair
GROUP BY truckNumber;

-- min and max -  use group by and having
-- minimal and maximal charge of the repair per month when repairs were make more then once:
SELECT MONTH(timeIn), MIN(charge) minCharge, MAX(charge) maxCharge
FROM repair
GROUP BY MONTH(timeIn)
HAVING COUNT(*)>1;


-- 12 a-n
-- Queries to restrict rows using criteria and compound criteria 
-- a) Range criteria (between) 
--  repairs which was made in the second half of the October 2021
SELECT *
FROM repair
WHERE timeIn BETWEEN '2021-10-16' AND '2021-10-31';
-- b) Using IN operator 
-- select drivers in the TX, OR, IN
SELECT *
FROM drivers
WHERE state IN ('TX', 'OR','IN');
-- c) Using LIKE operator with wildcards 
-- select loads to city Hallsville:
SELECT *
FROM loads
WHERE DeliveryAddress LIKE '%Hallsville%';

-- d) Range criteria (between) 
-- trucks' lifting from 200 to 300:
SELECT *
FROM trucks
WHERE lifting BETWEEN 200 AND 300;

-- e) Use column alias 
-- find driver's full name, email truckNumber which live in the TX, OR, IN
SELECT CONCAT(firstname,' ',lastname) as fullname, email, truckNumber
FROM drivers
WHERE state IN ('TX', 'OR','IN');


-- f) Perform basic arithmetic operations 
-- company pays 30% of repairs which cost more then 150$
SELECT repairID, timeIn,workDescription, charge*0.3 compensation, charge
FROM repair
WHERE charge>150;

-- g) Concatenate when reporting data
-- Make full name and address of the drivers with cars:
SELECT CONCAT(firstname,' ',lastname) as fullname, CONCAT(street,', ',city,' ',zip,', ',state) address
FROM drivers
WHERE truckNumber IS NOT NULL;

-- h) Use Distinct keyword 
-- unique clients which asks for loads:
SELECT DISTINCT l.clientID, companyName
FROM clients c INNER JOIN loads l ON c.clientID=l.clientID;

-- i) Order the output 
-- show repairs in October from expensive to cheap:
SELECT truckNumber, timeIn,workDescription, charge
FROM repair
WHERE timeIn BETWEEN '2021-10-01' AND '2021-10-31'
ORDER BY charge DESC;

-- j) List all the records with null values
-- SELECT drivers without cars:
SELECT *
FROM drivers
WHERE truckNumber IS NULL;

-- k) Extract the month from the date
-- show repairs by month and year:
SELECT MONTH(timeIn) monthRepair, YEAR(timeIn) yearRepair, SUM(charge) totalCharge
FROM repair
GROUP BY MONTH(timeIn), YEAR(timeIn)
ORDER BY YEAR(timeIn),MONTH(timeIn);


-- l) Use SUBSTR to pull out something
-- queries which show initial and name for driver which make loads:
SELECT deliveryAddress, delivaryDate, CONCAT(lastname,', ',substr(firstname,1,1),'.') driver, cost
FROM loads l INNER JOIN drivers d ON l.driverID=d.driverID;

-- m) Create a column that provides the length of one of your columns
-- n) Round output from one of your columns to 1 digit 
-- find average cost of the delivering by driver:
SELECT CONCAT(lastname,', ',substr(firstname,1,1),'.') driver, ROUND(AVG(cost),1) averageCost
FROM loads l INNER JOIN drivers d ON l.driverID=d.driverID
GROUP BY CONCAT(lastname,', ',substr(firstname,1,1),'.');

-- 13 a
-- If/Case statement
-- calculate cost of the repair with 30% discount from the company (only for cars which was repair):

SELECT repairID, timeIn, workDescription,charge, IF(charge>150, charge*0.3, 0) discount, charge-IF(charge>150, charge*0.3, 0) total
FROM repair
WHERE timeOut IS NOT NULL;

-- 14 a-d
-- Joins
-- a) Query that joins 3 tables and limits output
-- show information about drivers, loads and trucks, which was not repaired:
SELECT CONCAT(lastname,', ',substr(firstname,1,1),'.') driver, t.truckNumber, lifting, cost, delivaryDate, deliveryAddress
FROM (loads l INNER JOIN drivers d ON l.driverID=d.driverID)
			INNER JOIN trucks t ON d.truckNumber=t.truckNumber
WHERE d.truckNumber NOT IN (SELECT truckNumber
FROM repair);

-- b) Query with an outer join
-- select all drivers and trucks (including drivers without truck and truck without drivers:)
(SELECT firstname, lastname, t.truckNumber
FROM drivers d LEFT JOIN trucks t ON d.truckNumber=t.truckNumber)
UNION
(SELECT firstname, lastname, t.truckNumber
FROM drivers d RIGHT JOIN trucks t ON d.truckNumber=t.truckNumber);

-- c) Query with a non-equality join
-- show all trucks and coreesponding repair:
SELECT t.truckNumber, SUM(charge) totalCharge
FROM trucks t LEFT JOIN repair r ON t.truckNumber=r.truckNumber
GROUP BY t.truckNumber
ORDER BY SUM(charge) DESC;


-- Query using a set operation (Union, union all)
-- trucks which were used in repair or loads:
(SELECT truckNumber
FROM repair)
UNION 
(SELECT truckNumber
FROM loads l INNER JOIN drivers d ON l.driverID=d.driverID);









-- My Code-- 

-- 5	Formatting date and math 

-- 5.1.	Use your date column, either calculate the number of days from the date to today or if you have 2 date columns, subtract 1 date from another

SELECT
  timeIn,
  timeOut,
  IF(repair.timeOut Like '%-%' ,(DATEDIFF(timeOUT, timeIn) ),(DATEDIFF( Current_Timestamp,TIMEin)) ) AS days_difference 
FROM repair;

-- 5.2.	Round numeric data to 2 decimals
SELECT truckNumber, Lease, companyOwned, driverOwner, ROUND(lifting, 2) AS RoundedLifting
FROM trucks;

-- 5.3.	Display your date data. Format the date to the day name, month name, date, and 4-digit year
sELECT DATE_FORMAT(timeIn, "%W %M %e %Y") FROM repair;

-- 5.4.	Display your time zone		8
SELECT @@global.time_zone;

-- 6. Subqueries and merge statements:  Write a query for each of the tasks below.  In other words, do not combine two tasks in the same query
6.1.	Create a subquery that calculates the average of the numeric column with nulls and then if the row has a null, replace the null with the average number
SELECT AVG(charge) AS charge
From truck_company_db.repair;

	SELECT truckid,
		 ISNULL(charge, AVG(charge)) As charge
	From truck_company_db.repair;
UPDATE truck_company_db.repair
    SET 
    AVG(charge)
WHERE charge = null;
Avg(Coalesce(weightinmgs,0));


6.2.	Create a subquery  with  where and order by clauses
SELECT companyName
FROM truck_company_db.clients
WHERE city = 'Reno'
ORDER BY city;


6.3.	Create a subquery with a that extract data from one table and use it to limit data from another table (for examples look at Chapter 7’s lecture notes, page 1 the vendor ID example)
	

6.4.	driversUse a subquery with a not in operator
Select * from repair
WHERE timeIn NOT IN ('2021-08-12 14:40:00', '2021-10-26 12:40:00', '2021-10-26 12:34:00')

6.5.	Use a subquery in a DML action
SELECT  companyName,street,city
FROM clients
where city='Reno' OR city='Columbus'

6.6.	Create a query with a CTE (with statement)
WITH
  work_description (idwork_desc, work_desc)
  AS
  (
    SELECT REPAIRID, TRUCKNUMBER, TIMEIN, IDWORK_DESC, TIMEOUT
    FROM repair
    WHERE idwork_desc IS NULL
    UNION ALL
    SELECT t.REPAIRID, t.TRUCKNUMBER, t.TIMEIN, 
       r.idwork_desc + 1 , t.TIMEOUT
    FROM repair t
      INNER JOIN work_description r
        ON t.RepairID = r.idwork_desc
  )
SELECT
  trucknumber AS TruckNumber, 
  timeIn,
  (SELECT trucknumber FROM repair 
    WHERE idwork_desc = work_description.idwork_desc) AS WorkDescription
FROM work_description 
ORDER BY idwork_desc, work_description.idwork_desc 
	
    
 --  7.  Views
7.1.	Create a simple view
CREATE VIEW truck_company_db.repair_sales
AS
SELECT
	truckNumber,
    year(timeIN) AS y,
    month(timeIN) AS m,
    day(timeIN) AS d,
    i.idwork_Desc,
    timeOut,
	charge AS repair
FROM
    truck_company_db.repair AS o
INNER JOIN truck_company_db.work_description AS i
    ON o.idwork_desc = i.idwork_desc;

SELECT 
    * 
FROM 
    truck_company_db.repair_sales
ORDER BY
    y, m, d ;

7.2 	Create a view with a check option
CREATE OR REPLACE VIEW repair_sales AS
    SELECT 
        truckNumber,
        timeIN,
        idwork_desc,
        timeOut,
        charge
    FROM
        repair
    WHERE
        truckNumber LIKE '%U9%' 
WITH CHECK OPTION;

7.3.	Create a complex view

CREATE VIEW LoadswithDesc
AS
SELECT ld.loadID, 
        ld.DelivaryDate, 
        ld.DelivaryTime, 
        client.clientID as companyName,
        ld.driverId,
        ld.deliveryAddress,
        ld.idload_desc,
        ld.pickupAddress,
        ld.cost
FROM loads ld
INNER JOIN clients client
ON ld.clientID = client.clientID

SELECT 
    * 
FROM 
    truck_company_db.loadswithdesc
ORDER BY
    loadId;

7.4.	Update a record in a simple view
use truck_company_db;
UPDATE repair_sales
SET charge='130'
WHERE timeOut = '2021-08-12 17:50:00';


7.5.	Display only the to 10 records in one of your tables
select * from Clients ORDER BY ClientId LIMIT 10;


8. 	Indexes
8.1.	Create an index (other than unique or primary key)
	CREATE INDEX Contents
ON work_description (idwork_desc, work_desc);

8.2.	List all indexes using a query
SELECT
     ix.name as [IndexName],
     tab.name as [Table Name],
     COL_NAME(ix.object_id, ixc.column_id) as [Column Name],
     ix.type_desc,
     ix.is_disabled
FROM
     sys.indexes ix 
INNER JOIN
     sys.index_columns ixc 
        ON  ix.object_id = ixc.object_id 
        and ix.index_id = ixc.index_id
INNER JOIN
     sys.tables tab 
        ON ix.object_id = tab.object_id 
WHERE
     ix.is_primary_key = 0          /* Remove Primary Keys */
     AND ix.is_unique = 0           /* Remove Unique Keys */
     AND ix.is_unique_constraint = 0 /* Remove Unique Constraints */
     AND tab.is_ms_shipped = 0      /* Remove SQL Server Default Tables */
ORDER BY
    ix.name, tab.name

10.1.	Create and call a stored procedure that reads data from a table

USE `truck_company_db`;
DROP procedure IF EXISTS `all_clients`;

DELIMITER $$
USE `truck_company_db`$$
CREATE PROCEDURE `all_clients` ()
BEGIN
Select * FROM clients;
END$$

DELIMITER ;


CALL all_clients

10.2.	Create and call a stored procedure that has a case statement
		USE `truck_company_db`;
DROP procedure IF EXISTS `case_procedure`;

DELIMITER $$
USE `truck_company_db`$$
CREATE PROCEDURE `case_procedure` ()
BEGIN
 DECLARE v_state CHAR(3);
    SET v_state = state;

    CASE  v_state
      WHEN 'PA' THEN
        UPDATE state SET statename = 'S1';
      WHEN 'KY' THEN
        UPDATE state SET statename = 'S2';
      ELSE
        UPDATE state SET statename = 'S3';
      END CASE;
END$$

DELIMITER ;

call case_procedure

10.3.	Create and call a stored procedure that has an if statement
BEGIN 
 DECLARE chrge INT Default 0;
 SELECT  
        chrge=charge
    FROM
        repair
    WHERE
        idwork_desc = 6;
    SELECT chrge;
    IF chrge > 100
    BEGIN THEN
        PRINT 'Great! The charges amount in greater than 100';
    END
END


10.4.	Create and call a stored procedure that has a conditional handler for SQLWARNING
USE `truck_company_db`;
DROP procedure IF EXISTS `handlerdemo`;

DELIMITER $$
USE `truck_company_db`$$
CREATE PROCEDURE `handlerdemo` ()
       BEGIN
         DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET @x2 = 1;
         SET @x = 1;
         INSERT INTO clients.t VALUES (1);
         SET @x = 2;
         INSERT INTO clients.t VALUES (1);
         SET @x = 3;
       END;$$

DELIMITER ;

USE `truck_company_db`;
call handlerdemo

10.5.	Create a procedure that has a transaction
CREATE PROCEDURE [truck_company_db].[InsertPersonalDetailsAndAccount]
       -- Add the parameters for the stored procedure here
       @FirstName varchar(50),
       @LastName varchar(50),
       @Age smallint,
       @Active bit,
       @Salary money,
       @PPFDeduction money
AS
BEGIN
       -- SET NOCOUNT ON added to prevent extra result sets from
       -- interfering with SELECT statements.
       SET NOCOUNT ON;

       BEGIN TRAN
              BEGIN TRY
                     -- Insert into PersonalDetails table first
                     INSERT INTO PersonalDetails
                            (FirstName, LastName, Age, Active)
                     VALUES
                            (@FirstName, @LastName, @Age, @Active)

                     DECLARE @pdId int
                     SET @pdId = SCOPE_IDENTITY()
                     -- now insert into Accounts table
                     INSERT INTO Accounts
                            (Salary, PPFDeduction, PersonalDetailsId)
                     VALUES
                            (@Salary, @PPFDeduction, @pdId)
                     
              -- if not error, commit the transcation
              COMMIT TRANSACTION
       END TRY
       BEGIN CATCH
              -- if error, roll back any chanegs done by any of the sql statements
              ROLLBACK TRANSACTION
       END CATCH
END



10.6.	Create and use a stored function
USE `truck_company_db`;
DROP procedure IF EXISTS `all_clients`;

DELIMITER $$
USE `truck_company_db`$$
CREATE PROCEDURE `all_clients` ()
BEGIN
Select * FROM clients;
END$$

DELIMITER ;


CALL all_clients


11.1.	Create and use an update trigger
DELIMITER $$

CREATE TRIGGER after_sales_update
AFTER UPDATE
ON clients FOR EACH ROW
BEGIN
    IF OLD.quantity <> new.quantity THEN
        INSERT INTO SalesChanges(salesId,beforeQuantity, afterQuantity)
        VALUES(old.id, old.quantity, new.quantity);
    END IF;
END$$

DELIMITER ;

11.2. 	Create and use a trigger that saves data to a separate table 


12.1		Show a rollback using a set point
BEGIN TRANSACTION
 
  INSERT INTO InsertPersonalDetailsAndAccount 
  VALUES (20, 'Jonny', 'Cat5', 2000)
 
  UPDATE InsertPersonalDetailsAndAccount
  SET price = '25' WHERE id = 20
 
  DELETE from InsertPersonalDetailsAndAccount
  WHERE id = 20
 
COMMIT TRANSACTION



13.1.	What users would you create?

CREATE USER Jonny
    IDENTIFIED BY AZ3BC2
    DEFAULT TABLESPACE data_ts
    QUOTA 100M ON test_ts
    QUOTA 500K ON data_ts
    TEMPORARY TABLESPACE temp_ts
    PROFILE clerk;
GRANT create session TO Jonny;

CREATE USER John
    IDENTIFIED BY AZ4BC2
    DEFAULT TABLESPACE data_ts
    QUOTA 100M ON test_ts
    QUOTA 500K ON data_ts
    TEMPORARY TABLESPACE temp_ts
    PROFILE clerk;
GRANT create session TO John;

CREATE USER Jonny
    IDENTIFIED BY AZ3BC2
    DEFAULT TABLESPACE data_ts
    QUOTA 100M ON test_ts
    QUOTA 500K ON data_ts
    TEMPORARY TABLESPACE temp_ts
    PROFILE clerk;
GRANT create session TO Jonny;

CREATE USER Jonny
    IDENTIFIED BY AZ3BC2
    DEFAULT TABLESPACE data_ts
    QUOTA 100M ON test_ts
    QUOTA 500K ON data_ts
    TEMPORARY TABLESPACE temp_ts
    PROFILE clerk;
GRANT create session TO Jonny;
	
    13.2.	What roles would you create?
CREATE PROFILE clerk LIMIT
    SESSIONS_PER_USER 1
    IDLE_TIME 30
    CONNECT_TIME 600;

CREATE USER jfee
    IDENTIFIED BY wildcat
    DEFAULT TABLESPACE users
    TEMPORARY TABLESPACE temp_ts
    QUOTA 500K ON users
    PROFILE clerk;

CREATE USER dcranney
    IDENTIFIED BY bedrock
    DEFAULT TABLESPACE users
    TEMPORARY TABLESPACE temp_ts
    QUOTA unlimited ON users;

CREATE USER userscott
     IDENTIFIED BY scott1;






select * from truck_company_db.clients;
select  * from truck_company_db.drivers;
select  * from truck_company_db.repair ;
select  * from truck_company_db.loads;
select  * from truck_company_db.load_description;
select  * from truck_company_db.work_description;
select  * from truck_company_db.trucks;
select * from pharmacydb.userrecord;
select * from pharmacydb.stock;
select * from pharmacydb.salerecord;
