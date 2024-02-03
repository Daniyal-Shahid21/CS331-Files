*
    ****************************************************************************************************
    Inserting values into tables
*
ALTER TABLE Branch 
    DROP Constraint BranchMgrFK;
ALTER TABLE Branch 
    DROP Constraint BranchAssistMgrFK;
-- branch insertions **********************************************************
INSERT INTO Branch (BranchId, BranchName, BranchAddress, Assets, BranchMgrSSN, AssistMgrSSN) 
            VALUES (5678,  'BranchOne', 'B1Add', 'B1Assets', 111111111, 101010101);
INSERT INTO Branch (BranchId, BranchName, BranchAddress, Assets, BranchMgrSSN, AssistMgrSSN) 
            VALUES (4321,  'BranchTwo', 'B2Add', 'B2Assets', 222222222, 202020202);
INSERT INTO Branch (BranchId, BranchName, BranchAddress, Assets, BranchMgrSSN, AssistMgrSSN) 
            VALUES (8765,  'BranchThree', 'B3Add', 'B3Assets', 333333333, 303030303);
INSERT INTO Branch (BranchId, BranchName, BranchAddress, Assets, BranchMgrSSN, AssistMgrSSN) 
            VALUES (6014,  'BranchFour', 'B4Add', 'B4Assets', 444444444, 404040404);
INSERT INTO Branch (BranchId, BranchName, BranchAddress, Assets, BranchMgrSSN, AssistMgrSSN) 
            VALUES (3474,  'BranchFive', 'B5Add', 'B5Assets', 555555555, 505050505);

-- employee insertions **********************************************************
INSERT INTO Employees (EmpSSN, EmpName, Phone, StartDate, BranchId, EmpMgrSSN) -- branch1 emps
            VALUES (111111111, 'Emp1', 5551234567, '2003-04-15', 5678, NULL);
INSERT INTO Employees (EmpSSN, EmpName, Phone, StartDate, BranchId, EmpMgrSSN) 
            VALUES (101010101, 'Emp2', 5552345678, '2003-07-22', 5678, NULL);
INSERT INTO Employees (EmpSSN, EmpName, Phone, StartDate, BranchId, EmpMgrSSN) 
            VALUES (345678901, 'Emp3', 5553456789, '2003-11-08', 5678, NULL);
INSERT INTO Employees (EmpSSN, EmpName, Phone, StartDate, BranchId, EmpMgrSSN) 
            VALUES (456789012, 'Emp4', 5554567890, '2004-02-14', 5678, 345678901);
INSERT INTO Employees (EmpSSN, EmpName, Phone, StartDate, BranchId, EmpMgrSSN) -- branch2 emps
            VALUES (222222222, 'Emp5', 5555678901, '2004-05-20', 4321, NULL);
INSERT INTO Employees (EmpSSN, EmpName, Phone, StartDate, BranchId, EmpMgrSSN) 
            VALUES (202020202, 'Emp6', 5556789012, '2004-09-30', 4321, NULL);
INSERT INTO Employees (EmpSSN, EmpName, Phone, StartDate, BranchId, EmpMgrSSN) 
            VALUES (789012345, 'Emp7', 5557890123, '2005-01-12', 4321, NULL);
INSERT INTO Employees (EmpSSN, EmpName, Phone, StartDate, BranchId, EmpMgrSSN) 
            VALUES (890123456, 'Emp8', 5558901234, '2005-05-28', 4321, 789012345);
INSERT INTO Employees (EmpSSN, EmpName, Phone, StartDate, BranchId, EmpMgrSSN) 
            VALUES (901234567, 'Emp9', 5559012345, '2005-09-18', 4321, 789012345);
INSERT INTO Employees (EmpSSN, EmpName, Phone, StartDate, BranchId, EmpMgrSSN) -- branch3 emps
            VALUES (333333333, 'Emp10', 5551122334, '2006-01-22', 8765, NULL);
INSERT INTO Employees (EmpSSN, EmpName, Phone, StartDate, BranchId, EmpMgrSSN) 
            VALUES (303030303, 'Emp11', 5552233445, '2006-05-05', 8765, 333333333);
INSERT INTO Employees (EmpSSN, EmpName, Phone, StartDate, BranchId, EmpMgrSSN) 
            VALUES (334455667, 'Emp12', 5553344556, '2006-10-11', 8765, NULL);
INSERT INTO Employees (EmpSSN, EmpName, Phone, StartDate, BranchId, EmpMgrSSN) -- branch4 emps
            VALUES (444444444, 'Emp13', 5554455667, '2007-01-02', 6014, NULL);
INSERT INTO Employees (EmpSSN, EmpName, Phone, StartDate, BranchId, EmpMgrSSN) 
            VALUES (404040404, 'Emp14', 5555566778, '2007-03-19', 6014, NULL);
INSERT INTO Employees (EmpSSN, EmpName, Phone, StartDate, BranchId, EmpMgrSSN) 
            VALUES (667788990, 'Emp15', 5556677889, '2007-07-07', 6014, 444444444);
INSERT INTO Employees (EmpSSN, EmpName, Phone, StartDate, BranchId, EmpMgrSSN) 
            VALUES (778899001, 'Emp16', 5557788990, '2007-09-14', 6014, 444444444);
INSERT INTO Employees (EmpSSN, EmpName, Phone, StartDate, BranchId, EmpMgrSSN) -- branch5 emps
            VALUES (555555555, 'Emp17', 5558899001, '2007-11-28', 3474, NULL);
INSERT INTO Employees (EmpSSN, EmpName, Phone, StartDate, BranchId, EmpMgrSSN) 
            VALUES (505050505, 'Emp18', 5559900112, '2007-02-03', 3474, NULL);
INSERT INTO Employees (EmpSSN, EmpName, Phone, StartDate, BranchId, EmpMgrSSN) 
            VALUES (100112233, 'Emp19', 5551001123, '2007-04-09', 3474, NULL);
INSERT INTO Employees (EmpSSN, EmpName, Phone, StartDate, BranchId, EmpMgrSSN) 
            VALUES (101122334, 'Emp20', 5551011224, '2007-06-26', 3474, NULL);

ALTER TABLE Branch
    ADD CONSTRAINT BranchMgrFK
        FOREIGN KEY(BranchMgrSSN) REFERENCES Employees(EmpSSN);
ALTER TABLE Branch
    ADD CONSTRAINT BranchAssistMgrFK
        FOREIGN KEY(AssistMgrSSN) REFERENCES Employees(EmpSSN);


-- DEPENDENTS insertions **********************************************************
INSERT INTO Dependents(DepenName, EmpSSN)
            VALUES ('Dep1Emp3', 345678901);
INSERT INTO Dependents(DepenName, EmpSSN)
            VALUES ('Dep2Emp3', 345678901);
INSERT INTO Dependents(DepenName, EmpSSN)
            VALUES ('Dep3Emp3', 345678901);
INSERT INTO Dependents(DepenName, EmpSSN)
            VALUES ('Dep1Emp6', 202020202);
INSERT INTO Dependents(DepenName, EmpSSN)
            VALUES ('Dep1Emp7', 789012345);
INSERT INTO Dependents(DepenName, EmpSSN)
            VALUES ('Dep1Emp13', 444444444);
INSERT INTO Dependents(DepenName, EmpSSN)
            VALUES ('Dep1Emp19', 100112233);
INSERT INTO Dependents(DepenName, EmpSSN)
            VALUES ('Dep2Emp19', 100112233);


-- CUSTOMER insertions **********************************************************       
INSERT INTO Customers (CustSSN, CustName, CustState, CustCity, StNumber, AptNumber, Zipcode, PersBankerSSN, BranchId) -- branch1 custs
                VALUES (307531658, 'Cust1', 'NJ', 'Bayonne', 34, 2, 07002, 456789012, 5678);
INSERT INTO Customers (CustSSN, CustName, CustState, CustCity, StNumber, AptNumber, Zipcode, PersBankerSSN, BranchId)
                VALUES (456789012, 'Cust2', 'NY', 'New York', 45, NULL, 10001, 101010101, 5678);
INSERT INTO Customers (CustSSN, CustName, CustState, CustCity, StNumber, AptNumber, Zipcode, PersBankerSSN, BranchId)
                VALUES (789012345, 'Cust3', 'CA', 'Los Angeles', 123, 5, 90001, 101010101, 5678);
INSERT INTO Customers (CustSSN, CustName, CustState, CustCity, StNumber, AptNumber, Zipcode, PersBankerSSN, BranchId) -- branch2 custs
                VALUES (123456789, 'Cust4', 'TX', 'Houston', 789, NULL, 77002, 789012345, 4321);
INSERT INTO Customers (CustSSN, CustName, CustState, CustCity, StNumber, AptNumber, Zipcode, PersBankerSSN, BranchId)
                VALUES (987654321, 'Cust5', 'FL', 'Miami', 876, 8, 33101, 789012345, 4321);
INSERT INTO Customers (CustSSN, CustName, CustState, CustCity, StNumber, AptNumber, Zipcode, PersBankerSSN, BranchId)
                VALUES (111223344, 'Cust6', 'IL', 'Chicago', 567, NULL, 60601, 890123456, 4321);
INSERT INTO Customers (CustSSN, CustName, CustState, CustCity, StNumber, AptNumber, Zipcode, PersBankerSSN, BranchId) -- branch3 custs
                VALUES (444555666, 'Cust7', 'CO', 'Denver', 789, 3, 80202, NULL, 8765);
INSERT INTO Customers (CustSSN, CustName, CustState, CustCity, StNumber, AptNumber, Zipcode, PersBankerSSN, BranchId)
                VALUES (222333444, 'Cust8', 'OR', 'Portland', 987, NULL, 97201, NULL, 8765);
INSERT INTO Customers (CustSSN, CustName, CustState, CustCity, StNumber, AptNumber, Zipcode, PersBankerSSN, BranchId)
                VALUES (666777888, 'Cust9', 'PA', 'Philadelphia', 876, 15, 19102, NULL, 8765);
INSERT INTO Customers (CustSSN, CustName, CustState, CustCity, StNumber, AptNumber, Zipcode, PersBankerSSN, BranchId) -- branch4 custs
                VALUES (123321456, 'Cust10', 'MI', 'Detroit', 234, 7, 48201, NULL, 6014);
INSERT INTO Customers (CustSSN, CustName, CustState, CustCity, StNumber, AptNumber, Zipcode, PersBankerSSN, BranchId)
                VALUES (567432789, 'Cust11', 'MN', 'Minneapolis', 876, NULL, 55401, 667788990, 6014);
INSERT INTO Customers (CustSSN, CustName, CustState, CustCity, StNumber, AptNumber, Zipcode, PersBankerSSN, BranchId)
                VALUES (287654321, 'Cust12', 'NV', 'Las Vegas', 543, 20, 89101, NULL, 6014);
INSERT INTO Customers (CustSSN, CustName, CustState, CustCity, StNumber, AptNumber, Zipcode, PersBankerSSN, BranchId)
                VALUES (555777888, 'Cust13', 'UT', 'Salt Lake City', 123, NULL, 84101, 404040404, 6014);
INSERT INTO Customers (CustSSN, CustName, CustState, CustCity, StNumber, AptNumber, Zipcode, PersBankerSSN, BranchId) -- branch5 custs
                VALUES (111333555, 'Cust14', 'OH', 'Columbus', 876, 30, 43201, 100112233, 3474);
INSERT INTO Customers (CustSSN, CustName, CustState, CustCity, StNumber, AptNumber, Zipcode, PersBankerSSN, BranchId)
                VALUES (333555777, 'Cust15', 'WI', 'Milwaukee', 987, NULL, 53201, 100112233, 3474);


-- ACCOUNTS insertions **********************************************************
INSERT INTO Accounts (AccNumber, Balance, RecAccessDate)
            VALUES (1, 1205.16, '2023-06-01');
INSERT INTO Accounts (AccNumber, Balance, RecAccessDate)
            VALUES (2, 2300.45, '2023-06-10');
INSERT INTO Accounts (AccNumber, Balance, RecAccessDate)
            VALUES (3, 1500.78, '2023-06-20');
INSERT INTO Accounts (AccNumber, Balance, RecAccessDate)
            VALUES (4, 3200.90, '2023-07-05');
INSERT INTO Accounts (AccNumber, Balance, RecAccessDate)
            VALUES (5, 1800.25, '2023-07-15');
INSERT INTO Accounts (AccNumber, Balance, RecAccessDate)
            VALUES (6, 2700.60, '2023-07-25');
INSERT INTO Accounts (AccNumber, Balance, RecAccessDate)
            VALUES (7, 2100.95, '2023-08-08');
INSERT INTO Accounts (AccNumber, Balance, RecAccessDate)
            VALUES (8, 4200.30, '2023-08-18');
INSERT INTO Accounts (AccNumber, Balance, RecAccessDate)
            VALUES (9, 3100.65, '2023-08-28');
INSERT INTO Accounts (AccNumber, Balance, RecAccessDate)
            VALUES (10, 2800.40, '2023-09-05');
INSERT INTO Accounts (AccNumber, Balance, RecAccessDate)
            VALUES (11, 1900.75, '2023-09-12');
INSERT INTO Accounts (AccNumber, Balance, RecAccessDate)
            VALUES (12, 3500.10, '2023-09-20');
INSERT INTO Accounts (AccNumber, Balance, RecAccessDate)
            VALUES (13, 2600.35, '2023-10-02');
INSERT INTO Accounts (AccNumber, Balance, RecAccessDate)
            VALUES (14, 1800.70, '2023-10-10');
INSERT INTO Accounts (AccNumber, Balance, RecAccessDate)
            VALUES (15, 3300.05, '2023-10-18');
INSERT INTO Accounts (AccNumber, Balance, RecAccessDate)
            VALUES (16, 2400.30, '2023-06-02');
INSERT INTO Accounts (AccNumber, Balance, RecAccessDate)
            VALUES (17, 1600.65, '2023-06-12');
INSERT INTO Accounts (AccNumber, Balance, RecAccessDate)
            VALUES (18, 2900.90, '2023-06-22');
INSERT INTO Accounts (AccNumber, Balance, RecAccessDate)
            VALUES (19, 2000.25, '2023-07-06');
INSERT INTO Accounts (AccNumber, Balance, RecAccessDate)
            VALUES (20, 3700.50, '2023-07-16');


-- SAVINGSACC insertions **********************************************************
INSERT INTO SavingsAcc (AccNumber, SAFixedIntRate)
            VALUES (1, 4.5068);
INSERT INTO SavingsAcc (AccNumber, SAFixedIntRate)
            VALUES (2, 3.7892);
INSERT INTO SavingsAcc (AccNumber, SAFixedIntRate)
            VALUES (3, 5.2315);
INSERT INTO SavingsAcc (AccNumber, SAFixedIntRate)
            VALUES (4, 4.0023);
INSERT INTO SavingsAcc (AccNumber, SAFixedIntRate)
            VALUES (5, 3.2567);


-- CHECKINGSACC insertions **********************************************************
INSERT INTO CheckingsAcc (AccNumber, Overdrafts)
            VALUES (6, 6.3451);
INSERT INTO CheckingsAcc (AccNumber, Overdrafts)
            VALUES (7, 8.2156);
INSERT INTO CheckingsAcc (AccNumber, Overdrafts)
            VALUES (8, 5.1023);
INSERT INTO CheckingsAcc (AccNumber, Overdrafts)
            VALUES (9, 6.2100);
INSERT INTO CheckingsAcc (AccNumber, Overdrafts)
            VALUES (10, 8.8750);


-- MONEYMARKETACC insertions **********************************************************
INSERT INTO MoneyMarketAcc (AccNumber, VarIntRate)
            VALUES (11, 2.5500);
INSERT INTO MoneyMarketAcc (AccNumber, VarIntRate)
            VALUES (12, 1.9500);
INSERT INTO MoneyMarketAcc (AccNumber, VarIntRate)
            VALUES (13, 4.8087);
INSERT INTO MoneyMarketAcc (AccNumber, VarIntRate)
            VALUES (14, 4.9500);
INSERT INTO MoneyMarketAcc (AccNumber, VarIntRate)
            VALUES (15, 5.1023);


-- LOAN insertions **********************************************************
INSERT INTO Loan (LoanNumber, LoanMonthlyAm, LoanAmount, LoanFixIntRate, BranchId, AccNumber)
            VALUES (1, 12540.61, 5026.83, 5.3578, 5678, 16);
INSERT INTO Loan (LoanNumber, LoanMonthlyAm, LoanAmount, LoanFixIntRate, BranchId, AccNumber)
            VALUES (2, 9500.75, 3800.30, 4.8023, 4321, 17);
INSERT INTO Loan (LoanNumber, LoanMonthlyAm, LoanAmount, LoanFixIntRate, BranchId, AccNumber)
            VALUES (3, 14230.40, 5692.16, 6.2150, 8765, 18);
INSERT INTO Loan (LoanNumber, LoanMonthlyAm, LoanAmount, LoanFixIntRate, BranchId, AccNumber)
            VALUES (4, 11780.90, 4712.36, 5.0023, 4321, 19);
INSERT INTO Loan (LoanNumber, LoanMonthlyAm, LoanAmount, LoanFixIntRate, BranchId, AccNumber)
            VALUES (5, 13690.25, 5476.10, 5.7500, 6014, 20);


-- HAS insertions **********************************************************
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (307531658, 1); 
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (307531658, 13); -- ssn not unique
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (307531658, 14); -- ssn not unique
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (456789012, 2);
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (789012345, 3);
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (789012345, 16);
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (789012345, 17);
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (789012345, 18);
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (123321456, 18);
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (123456789, 4);
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (987654321, 5);
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (111223344, 5);
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (444555666, 5);
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (222333444, 6);
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (222333444, 15); -- ssn not unique
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (666777888, 15);
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (666777888, 7);
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (123321456, 8);
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (123321456, 19);
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (333555777, 19);
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (567432789, 9);
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (287654321, 10);
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (555777888, 10);
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (555777888, 11); -- ssn not unique 
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (111333555, 11);
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (111333555, 20);
INSERT INTO HAS (CustSSN, AccNumber)
            VALUES (333555777, 12);


INSERT INTO Transaction(Code, TypeName, TransCode, TransAmount, TransDate, TransHour, AccNumber) 
            VALUES('WD1', 'Withdraw', 'WD', 145.20, '2023-07-13', 4, 3);
INSERT INTO Transaction (Code, TypeName, TransCode, TransAmount, TransDate, TransHour, AccNumber)
            VALUES ('CD1', 'Customer Deposit', 'CD', 200.50, '2023-08-05', 9, 8);
INSERT INTO Transaction (Code, TypeName, TransCode, TransAmount, TransDate, TransHour, AccNumber)
            VALUES ('WD2', 'Withdraw', 'WD', 75.80, '2023-09-18', 12, 14);
INSERT INTO Transaction (Code, TypeName, TransCode, TransAmount, TransDate, TransHour, AccNumber)
            VALUES ('Z1', 'Zelle', 'Z', 300.25, '2023-10-02', 15, 19);
INSERT INTO Transaction (Code, TypeName, TransCode, TransAmount, TransDate, TransHour, AccNumber)
            VALUES ('CD2', 'Customer Deposit', 'CD', 120.10, '2023-10-15', 18, 5);


*
    ******************************************************************
    SQL Queries (all queries are completed with original database, no updates or deletes)
*
-- Get the Branch IDs and the number of employees at each.
SELECT BranchID, COUNT(*)
FROM Employees
GROUP BY BranchID;


-- Get the SSNs of employees that are personal bankers to more than one customer.
SELECT Employees.EmpSSN
FROM Employees INNER JOIN Customers 
                ON Customers.PersBankerSSN = Employees.EmpSSN
GROUP BY Employees.EmpSSN
HAVING COUNT(*) > 1;


-- Get the SSNs for Employees who work at Branches whose BranchID's are greater than 5000
SELECT EmpSSN
FROM Employees
WHERE BranchId > ALL (
    SELECT BranchId
    FROM Branch
    WHERE BranchId < 5000
);


-- Get Accounts that are connected to loan accounts where the fixed rate is greater than 5.
SELECT AccNumber, Balance, RecAccessDate
FROM Accounts
WHERE AccNumber IN (
    SELECT AccNumber
    FROM Loan
    WHERE LoanFixIntRate > 5
);


*
    ******************************************************************
    UPDATING columns
*
UPDATE Branch
SET BranchMgrSSN = 100112233
WHERE BranchId = 3474;


UPDATE Employees
SET Phone = 2015555555
WHERE EmpName = 'Emp9';


UPDATE Dependents
SET EmpSSN = 555555555
WHERE DepenName = 'Dep3Emp3';


UPDATE Customers
SET PersBankerSSN = 778899001
WHERE CustName = 'Cust12';


UPDATE Accounts
SET RecAccessDate = '2023-09-20'
WHERE AccNumber = 3;


UPDATE SavingsAcc
SET SAFixedIntRate = 4.0421
WHERE AccNumber = 2;


UPDATE CheckingsAcc
SET Overdrafts = 6.3918
WHERE AccNumber = 7;


UPDATE MoneyMarketAcc
SET VarIntRate = 3.5806
WHERE AccNumber = 12;


UPDATE Loan
SET LoanFixIntRate = 4.0421
WHERE AccNumber = 17;


UPDATE HAS
SET CustSSN = 456789012
WHERE CustSSN = 307531658 AND AccNumber = 14;


UPDATE Transaction
SET TransAmount = 200.31
WHERE Code = 'CD2';


*
    ******************************************************************
    DELETING Rows
*
-- deletes Branch3 from Branch
-- also deletes Emps 10,11,12
DELETE FROM Branch
WHERE BranchId = 8765;


-- deletes previous Branch5 MGR(Emp17) from Employee
DELETE FROM Employees
WHERE EmpSSN = 555555555;


-- deletes Emp3's 2nd dependent
DELETE FROM Dependents
WHERE DepenName = 'Dep2Emp3';


-- deletes cust1
DELETE FROM Customers 
WHERE CustSSN = 307531658;


-- deletes cust2 with account 14 from HAS
DELETE FROM HAS 
WHERE CustSSN = 456789012 AND AccNumber = 2;


-- deletes Account 1 and subsequent subclass accounts
DELETE FROM Accounts
WHERE AccNumber = 1;


-- deletes Savings Account
DELETE FROM SavingsAcc
WHERE AccNumber = 3;


-- deletes Checking Account
DELETE FROM CheckingsAcc
WHERE AccNumber = 6;


-- deletes MoneyMarket Account
DELETE FROM MoneyMarketAcc
WHERE AccNumber = 11;


-- deletes Loan Account
DELETE FROM Loan
WHERE AccNumber = 16;


-- deletes Transaction
DELETE FROM Transaction 
WHERE Code = 'WD1';

