-- Create Database
CREATE DATABASE Pharmacy;

-- Use Database
USE Pharmacy;

-- Create Table
CREATE TABLE Tablets (
    Tablet_ID INT PRIMARY KEY,
    Tablet_Name VARCHAR(100),
    Tablet_Weight DECIMAL(5,2),
    Disease VARCHAR(100),
    Symptom VARCHAR(100)
);

-- Add Cost column
ALTER TABLE Tablets
ADD Cost DECIMAL(10,2);

-- Rename Cost to Tablet_Cost
ALTER TABLE Tablets
RENAME COLUMN Cost TO Tablet_Cost;

-- Insert Sample Records (20 Records)

INSERT INTO Tablets VALUES
(1,'Paracetamol',500,'Fever','High Fever',0),
(2,'Dolo 650',650,'Fever','Body Pain',0),
(3,'Crocin',500,'Cold','Headache',0),
(4,'Azithromycin',250,'Infection','Sore Throat',0),
(5,'Cetirizine',10,'Allergy','Sneezing',0),
(6,'Pantoprazole',40,'Acidity','Stomach Pain',0),
(7,'Omeprazole',20,'Ulcer','Acidity',0),
(8,'Ibuprofen',400,'Pain','Joint Pain',0),
(9,'Amoxicillin',500,'Bacterial Infection','Fever',0),
(10,'Vitamin C',500,'Vitamin Deficiency','Weakness',0),
(11,'Metformin',500,'Diabetes','High Sugar',0),
(12,'Aspirin',325,'Heart Disease','Chest Pain',0),
(13,'Cough Syrup Tablet',300,'Cough','Dry Cough',0),
(14,'Levocetirizine',5,'Allergy','Itching',0),
(15,'Diclofenac',50,'Pain','Back Pain',0),
(16,'Naproxen',250,'Arthritis','Joint Pain',0),
(17,'Ranitidine',150,'Acidity','Heart Burn',0),
(18,'Zinc Tablet',50,'Immunity','Weakness',0),
(19,'Calcium Tablet',500,'Bone Weakness','Bone Pain',0),
(20,'Albendazole',400,'Worm Infection','Stomach Pain',0);

-- Update Tablet_Cost values

UPDATE Tablets SET Tablet_Cost = 10 WHERE Tablet_ID = 1;
UPDATE Tablets SET Tablet_Cost = 15 WHERE Tablet_ID = 2;
UPDATE Tablets SET Tablet_Cost = 12 WHERE Tablet_ID = 3;
UPDATE Tablets SET Tablet_Cost = 50 WHERE Tablet_ID = 4;
UPDATE Tablets SET Tablet_Cost = 18 WHERE Tablet_ID = 5;
UPDATE Tablets SET Tablet_Cost = 22 WHERE Tablet_ID = 6;
UPDATE Tablets SET Tablet_Cost = 25 WHERE Tablet_ID = 7;
UPDATE Tablets SET Tablet_Cost = 20 WHERE Tablet_ID = 8;
UPDATE Tablets SET Tablet_Cost = 45 WHERE Tablet_ID = 9;
UPDATE Tablets SET Tablet_Cost = 30 WHERE Tablet_ID = 10;
UPDATE Tablets SET Tablet_Cost = 35 WHERE Tablet_ID = 11;
UPDATE Tablets SET Tablet_Cost = 28 WHERE Tablet_ID = 12;
UPDATE Tablets SET Tablet_Cost = 24 WHERE Tablet_ID = 13;
UPDATE Tablets SET Tablet_Cost = 16 WHERE Tablet_ID = 14;
UPDATE Tablets SET Tablet_Cost = 26 WHERE Tablet_ID = 15;
UPDATE Tablets SET Tablet_Cost = 32 WHERE Tablet_ID = 16;
UPDATE Tablets SET Tablet_Cost = 18 WHERE Tablet_ID = 17;
UPDATE Tablets SET Tablet_Cost = 20 WHERE Tablet_ID = 18;
UPDATE Tablets SET Tablet_Cost = 40 WHERE Tablet_ID = 19;
UPDATE Tablets SET Tablet_Cost = 22 WHERE Tablet_ID = 20;

-- Delete one column
ALTER TABLE Tablets
DROP COLUMN Disease;

-- Add Age_Group column
ALTER TABLE Tablets
ADD Age_Group VARCHAR(20);

-- Update Age_Group values

UPDATE Tablets SET Age_Group='Children' WHERE Tablet_ID IN (1,3,5,10,18);
UPDATE Tablets SET Age_Group='Adults' WHERE Tablet_ID IN (2,4,6,7,8,9,11,13,15,17,20);
UPDATE Tablets SET Age_Group='Senior' WHERE Tablet_ID IN (12,14,16,19);

-- HAVING Clause
SELECT Age_Group, COUNT(*) AS Total_Tablets
FROM Tablets
GROUP BY Age_Group
HAVING COUNT(*) >= 3;

-- GROUP BY Symptom
SELECT Symptom, COUNT(*) AS Total
FROM Tablets
GROUP BY Symptom;

-- Display all records
SELECT * FROM Tablets;

-- Minimum and Maximum Tablet Weight
SELECT
MIN(Tablet_Weight) AS Minimum_Weight,
MAX(Tablet_Weight) AS Maximum_Weight
FROM Tablets;

-- Add Quantity Column
ALTER TABLE Tablets
ADD Qty INT;

-- Update Quantity
UPDATE Tablets SET Qty=10 WHERE Tablet_ID=1;
UPDATE Tablets SET Qty=15 WHERE Tablet_ID=2;
UPDATE Tablets SET Qty=12 WHERE Tablet_ID=3;
UPDATE Tablets SET Qty=20 WHERE Tablet_ID=4;
UPDATE Tablets SET Qty=25 WHERE Tablet_ID=5;
UPDATE Tablets SET Qty=18 WHERE Tablet_ID=6;
UPDATE Tablets SET Qty=10 WHERE Tablet_ID=7;
UPDATE Tablets SET Qty=8 WHERE Tablet_ID=8;
UPDATE Tablets SET Qty=14 WHERE Tablet_ID=9;
UPDATE Tablets SET Qty=16 WHERE Tablet_ID=10;
UPDATE Tablets SET Qty=20 WHERE Tablet_ID=11;
UPDATE Tablets SET Qty=9 WHERE Tablet_ID=12;
UPDATE Tablets SET Qty=11 WHERE Tablet_ID=13;
UPDATE Tablets SET Qty=30 WHERE Tablet_ID=14;
UPDATE Tablets SET Qty=13 WHERE Tablet_ID=15;
UPDATE Tablets SET Qty=17 WHERE Tablet_ID=16;
UPDATE Tablets SET Qty=12 WHERE Tablet_ID=17;
UPDATE Tablets SET Qty=22 WHERE Tablet_ID=18;
UPDATE Tablets SET Qty=14 WHERE Tablet_ID=19;
UPDATE Tablets SET Qty=10 WHERE Tablet_ID=20;

-- Total Weight
SELECT
Tablet_ID,
Tablet_Name,
(Tablet_Weight * Qty) AS Total_Weight,
Symptom
FROM Tablets;

-- WHERE with AND operator
SELECT
Tablet_ID,
Tablet_Name,
Tablet_Weight,
Age_Group,
Symptom
FROM Tablets
WHERE Age_Group='Adults'
AND Tablet_Weight>=250;