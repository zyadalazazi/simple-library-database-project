CREATE DATABASE IF NOT EXISTS ZyadProject;

Use ZyadProject;


CREATE TABLE IF NOT EXISTS Borrower (
    NationalID int  NOT NULL ,
    FullName char(50)  NOT NULL ,
    PhoneNumber char(9)  NOT NULL ,
    Address char(70)  NOT NULL ,
    PRIMARY KEY (NationalID),
    INDEX(FullName)
);

CREATE TABLE IF NOT EXISTS Employee (
    EmployeeID int  NOT NULL auto_increment,
    FullName char(50)  NOT NULL ,
    PhoneNumber char(9)  NOT NULL ,
    Salary decimal  NOT NULL ,
    PRIMARY KEY (EmployeeID),
    INDEX(FullName)
);

CREATE TABLE IF NOT EXISTS Book (
    BookID int NOT NULL,
    BookName char(50) NOT NULL,
    Author char(50)  NOT NULL ,
    Category char(50)  NOT NULL ,
    PRIMARY KEY (BookID),
    INDEX (BookName)
);

CREATE TABLE IF NOT EXISTS Location (
	Book_ID int NOT NULL UNIQUE,
    Section varchar(2)  NOT NULL ,
    Box int  NOT NULL ,
    Shelf int  NOT NULL,
    FOREIGN KEY (Book_ID)
    REFERENCES Book(BookID)
);

CREATE TABLE IF NOT EXISTS Receipt (
	National_ID int  NOT NULL ,
	Employee_ID int  NOT NULL,
    Book_ID int NOT NULL,
    ReceiptID int NOT NULL DEFAULT 1,
    ReturnDate date NOT NULL,
    PRIMARY KEY (ReceiptID),
    FOREIGN KEY (National_ID)
    REFERENCES Borrower(NationalID),
    FOREIGN KEY (Employee_ID)
    REFERENCES Employee(EmployeeID),
    FOREIGN KEY (Book_ID)
    REFERENCES Book(BookID)
);


INSERT INTO Borrower(NationalID, FullName, PhoneNumber, Address) VALUES(111111, "Jason Jordan", "777777777", "50th Street");
INSERT INTO Borrower(NationalID, FullName, PhoneNumber, Address) VALUES(222222, "Michael Droup", "733333333", "51th Street");
INSERT INTO Borrower(NationalID, FullName, PhoneNumber, Address) VALUES(333333, "Trevor Noah", "700000000", "52th Street");

INSERT INTO Employee(FullName, PhoneNumber, Salary) VALUES("Worker1", "722222222", 500.0);
INSERT INTO Employee(FullName, PhoneNumber, Salary) VALUES("Worker2", "766666666", 400.0);
INSERT INTO Employee(FullName, PhoneNumber, Salary) VALUES("Worker3", "744444444", 100.0);

INSERT INTO Book(BookID, BookName, Author, Category) VALUES(1, "Zoo", "author 1", "Category 3");
INSERT INTO Book(BookID, BookName, Author, Category) VALUES(2, "Business Administration", "author 2", "Category 2");
INSERT INTO Book(BookID, BookName, Author, Category) VALUES(3, "Bla Bla", "author 3", "Category 3");

INSERT INTO Location(Book_ID, Section, Box, Shelf) VALUES(1, "2a", 3, 3);
INSERT INTO Location(Book_ID, Section, Box, Shelf) VALUES(2, "3a", 2, 1);
INSERT INTO Location(Book_ID, Section, Box, Shelf) VALUES(3, "4a", 1, 5);

INSERT INTO Receipt(National_ID, Employee_ID, Book_ID, ReturnDate) VALUES(111111, 1, 1, '2020-03-28');


-- SELECT *
-- FROM Location;




