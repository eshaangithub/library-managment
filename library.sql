-- Create the library database
CREATE DATABASE library;


USE library;

-- Create the Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- Create the Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Create the Books table
CREATE TABLE Books (
    ISBN VARCHAR(13) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3), -- 'yes' for available, 'no' for not available
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

-- Create the Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- Create the IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(13),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- Create the ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(13),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

SELECT B.Book_title, C.Customer_name
FROM IssueStatus IS
JOIN Books B ON IS.Isbn_book = B.ISBN
JOIN Customer C ON IS.Issued_cust = C.Customer_Id;


SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;



SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;


SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;


SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';



SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;
