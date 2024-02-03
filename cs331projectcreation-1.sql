ALTER SESSION SET nls_date_format='yyyy-mm-dd';

CREATE TABLE Branch (
    BranchId        INT             NOT NULL,
    BranchName      VARCHAR(20)     NOT NULL,
    BranchAddress   VARCHAR(200)    NOT NULL,
    Assets          VARCHAR(200)    NOT NULL,
    
    BranchMgrSSN    CHAR(9)         NOT NULL,
    AssistMgrSSN    CHAR(9)         NOT NULL,
    
    PRIMARY KEY(BranchId));
/

CREATE TABLE Employees (
    EmpSSN          CHAR(9)         NOT NULL,
    EmpName         VARCHAR(20)     NOT NULL,
    Phone           CHAR(10),
    StartDate       DATE            NOT NULL,
    
    BranchId        INT             NOT NULL,
    EmpMgrSSN       CHAR(9),

    PRIMARY KEY(EmpSSN),
    CONSTRAINT EmpBranchFK
        FOREIGN KEY(BranchId) REFERENCES Branch(BranchId)
            ON DELETE CASCADE,
    CONSTRAINT EmpEmpMgrFK
        FOREIGN KEY(EmpMgrSSN) REFERENCES Employees(EmpSSN));
/
ALTER TABLE Branch
    ADD CONSTRAINT BranchMgrFK
        FOREIGN KEY(BranchMgrSSN) REFERENCES Employees(EmpSSN);
ALTER TABLE Branch
    ADD CONSTRAINT BranchAssistMgrFK
        FOREIGN KEY(AssistMgrSSN) REFERENCES Employees(EmpSSN);

CREATE TABLE Dependents (
    DepenName       VARCHAR(20)     NOT NULL,

    EmpSSN          CHAR(9)         NOT NULL,

    PRIMARY KEY(DepenName, EmpSSN),
    CONSTRAINT DependentEmpMultivalueFK
        FOREIGN KEY(EmpSSN) REFERENCES Employees(EmpSSN)
            ON DELETE CASCADE);
/

CREATE TABLE Customers (
    CustSSN         CHAR(9)         NOT NULL,
    CustName        VARCHAR(20)     NOT NULL,
    CustState       VARCHAR(20)     NOT NULL,
    CustCity        VARCHAR(20)     NOT NULL,
    StNumber        INT             NOT NULL,
    AptNumber       INT,
    Zipcode         CHAR(5)         NOT NULL,
    
    PersBankerSSN   CHAR(9),
    BranchId        INT             NOT NULL,

    PRIMARY KEY(CustSSN),
    CONSTRAINT CustEmpBankerFK
        FOREIGN KEY(PersBankerSSN) REFERENCES Employees(EmpSSN),
    CONSTRAINT CustBranchFK
        FOREIGN KEY(BranchId) REFERENCES Branch(BranchId)
            ON DELETE CASCADE);
/

CREATE TABLE Accounts (
    AccNumber       INT             NOT NULL,
    Balance         DECIMAL(10,2)   NOT NULL,
    RecAccessDate   DATE,
    
    PRIMARY KEY(AccNumber));
/

CREATE TABLE SavingsAcc (
    AccNumber       INT             NOT NULL,
    
    SAFixedIntRate  DECIMAL(10,4)   NOT NULL,

    CONSTRAINT SavingsAccSub    
        FOREIGN KEY(AccNumber) REFERENCES Accounts(AccNumber) 
            ON DELETE CASCADE);
/

CREATE TABLE CheckingsAcc (
    AccNumber       INT             NOT NULL,
    
    Overdrafts      DECIMAL(10,4)   NOT NULL,

    CONSTRAINT CheckingsAccSub    
        FOREIGN KEY(AccNumber) REFERENCES Accounts(AccNumber) 
            ON DELETE CASCADE);
/

CREATE TABLE MoneyMarketAcc (
    AccNumber       INT             NOT NULL,
    
    VarIntRate      DECIMAL(10,4)   NOT NULL,

    CONSTRAINT MoneyMarketAccSub    
        FOREIGN KEY(AccNumber) REFERENCES Accounts(AccNumber) 
            ON DELETE CASCADE);
/

CREATE TABLE Loan (
    LoanNumber      INT             NOT NULL,
    LoanMonthlyAm   DECIMAL(10,2),
    LoanAmount      DECIMAL(10,2),
    LoanFixIntRate  DECIMAL(10,4)   NOT NULL,

    BranchId        INT             NOT NULL,
    AccNumber       INT             NOT NULL,

    PRIMARY KEY(LoanNumber),
    CONSTRAINT LoanAccSub    
        FOREIGN KEY(AccNumber) REFERENCES Accounts(AccNumber) 
            ON DELETE CASCADE,
    CONSTRAINT LoanBranchFK
        FOREIGN KEY(BranchId) REFERENCES Branch(BranchId)
            ON DELETE CASCADE);
/

CREATE TABLE HAS (
    CustSSN         CHAR(9)         NOT NULL,
    AccNumber       INT             NOT NULL,

    PRIMARY KEY(CustSSN, AccNumber),
    CONSTRAINT Cust_HAS    
        FOREIGN KEY(CustSSN) REFERENCES Customers(CustSSN)
            ON DELETE CASCADE,
    CONSTRAINT HAS_Account    
        FOREIGN KEY(AccNumber) REFERENCES Accounts(AccNumber)
            ON DELETE CASCADE);
/

CREATE TABLE Transaction (
    Code            CHAR(10)        NOT NULL,
    TypeName        VARCHAR(50)     NOT NULL,

    TransCode       CHAR(10)        NOT NULL,
    TransAmount     DECIMAL(10,2)   NOT NULL,
    TransDate       DATE            NOT NULL,
    TransHour       INT             NOT NULL,

    AccNumber       INT             NOT NULL,

    PRIMARY KEY(Code),
    CONSTRAINT TransactionAccountFK    
        FOREIGN KEY(AccNumber) REFERENCES Accounts(AccNumber)
            ON DELETE CASCADE);
/
