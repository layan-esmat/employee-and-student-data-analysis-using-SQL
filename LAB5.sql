CREATE DATABASE Lab5;
USE lab5;
CREATE TABLE Employees (
EmpID INT PRIMARY KEY, 
EmpName VARCHAR(20) UNIQUE NOT NULL,
Nationality VARCHAR(20) NOT NULL,
Qualification VARCHAR(20),
Salary DECIMAL(7,2),
AppointmentDate DATE NOT NULL);

INSERT INTO Employees (EmpID, EmpName, Nationality, Qualification, Salary, AppointmentDate)
VALUES
(1001, 'Ahmed Saleh', 'Saudi', 'BA', 5000.00, '2020-05-01'),
(1002, 'Kaled Al Ahmadi', 'Saudi', 'Master', 7500.00, '2021-07-15'),
(1003, 'Fahad Abdullah', 'Syrian', 'BA', 7000.00, '2022-01-20'),
(1004, 'Adel Ahmad', 'Egyptian', 'phD', 9000.00, '2021-09-12'),
(1005, 'Rami Omar', 'Saudi', 'phD', 11500.00, '2018-03-25'),
(1006, 'Samer Mohmad', 'Sysrian', 'phD', 9500.00, '2021-09-12');

-- count all employees
SELECT COUNT(*) AS TotalEmployees FROM Employees;

-- count employees with known salary
SELECT COUNT(Salary) AS CountWithSalary FROM Employees;

-- count by nationality
SELECT Nationality, COUNT(*) AS CountPerNatonality
FROM Employees
GROUP BY Nationality;

-- count saudi employees only
SELECT COUNT(*) AS SaudiEmployees 
FROM Employees
WHERE Nationality = 'Saudi';

-- count nationalities (saudi only)
SELECT Nationality, COUNT(*) AS NumPerNationality 
FROM Employees
WHERE Nationality = 'Saudi'
GROUP BY Nationality;

-- for each nationality with more than one employee
SELECT Nationality, COUNT(*) AS EmployeeCount
FROM Employees 
GROUP BY Nationality
HAVING COUNT(*) > 1;

-- modify table 
ALTER TABLE Employees
ADD COLUMN Department VARCHAR(20);

-- INSERT DEPARTMENT DATA
UPDATE Employees SET Department = 'HR' WHERE EmpID IN (1001, 1002);
UPDATE Employees  SET Department = 'IT' WHERE EmpId IN (1003,1004);
UPDATE Employees  SET Department = 'Finance' WHERE EmpId IN (1005,1006);

-- count employees per department
SELECT Department, COUNT(*) AS NumEmployees
FROM Employees
GROUP BY Department;

-- average salary 
SELECT AVG(Salary) AS AverageSalary FROM Employees;

-- average salary with alias
SELECT AVG(Salary) AS 'متوسط الرواتب' FROM Employees;

-- Employees earning above average salary
SELECT EmpName, Nationality, Qualification, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- maximum salary
SELECT MAX(Salary) AS MaxSalary FROM Employees;

-- minimum salary
SELECT MIN(Salary) AS MinSalary FROM Employees;

-- Employee(s) with maximum salary
SELECT EmpName, Salary
FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);

-- toal salary sum
SELECT SUM(Salary) AS TotalSalaries FROM Employees;

-- EXERCISE 
CREATE TABLE Students(
ID VARCHAR(10) PRIMARY KEY,
FirstName VARCHAR(20),
LastName VARCHAR(20),
Mark INT);

INSERT INTO Students (ID, FirstName, LastName, Mark)
VALUES
('0613077', 'Amera', 'Majed', 98),
('0513114', 'Wafa', 'Ahmad', 56),
('0713013', 'Abeer', 'Salem', 96),
('0513098', 'Ohood', 'Ahmad', 86);

-- Display students with marks above average
SELECT * FROM Students
WHERE Mark > (SELECT AVG(Mark) FROM Students);

-- Count total number of students
SELECT COUNT(*) AS TotalStudents FROM Students;

-- Display students with A+ (mark ≥ 95)
SELECT ID FROM Students WHERE Mark >= 95;

-- Display student(s) with minimum mark
SELECT FirstName, LastName
FROM Students
WHERE Mark = (SELECT MIN(Mark) FROM Students);