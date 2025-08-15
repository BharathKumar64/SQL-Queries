CREATE DATABASE ASSIGNMENT1;
USE ASSIGNMENT1;
CREATE TABLE DEPARTMENTS(Deptid INT PRIMARY KEY,Deptname VARCHAR(20));
CREATE TABLE EMPLOYEES(Empid INT PRIMARY KEY,Empname VARCHAR(20),Deptid INT,salary INT,Hiredate DATE,FOREIGN KEY (Deptid) REFERENCES DEPARTMENTS(Deptid));
INSERT INTO DEPARTMENTS VALUES(1,'HR'),(2,'IT'),(3,'Sales');
INSERT INTO EMPLOYEES VALUES(101,'john',1,50000,'2018-02-12'),
(102,'Alice',2,60000,'2019-07-10'),
(103,'Bob',1,55000,'2020-05-05'),
(104,'Carol','3',45000,'2017-09-20');
-- Display all records from the EMPLOYEES TABLE.
SELECT * FROM EMPLOYEES;
-- Display only EMPNAME and SALARY of all employees.
SELECT Empname,salary FROM EMPLOYEES;
-- Find all employees who belong to the IT department.
SELECT Empname,Deptname FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.Deptid=d.Deptid WHERE d.Deptname='IT';
-- List employees whose salary is greater than 50000.
SELECT * FROM EMPLOYEES WHERE salary>50000;
-- Find employees hired before 2020-01-01.
SELECT * FROM EMPLOYEES WHERE Hiredate<'2020-01-01';
-- Display employees in descending order of salary.
SELECT * FROM EMPLOYEES ORDER BY salary DESC;
-- Count total number of employees.
SELECT COUNT(*) FROM EMPLOYEES;
-- Find the average salary of all employees.
SELECT AVG(salary) AS AVERAGE_SALARY FROM EMPLOYEES;
-- Find the maximum salary in each department.
SELECT d.Deptname,MAX(e.salary) AS MAX_SALARY FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.Deptid=d.Deptid GROUP BY d.Deptname;
-- Find departments having more than 1 employee.
SELECT d.Deptname,COUNT(e.Empid) AS EMPLOYEE_COUNT FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.Deptid=d.Deptid GROUP BY d.Deptname HAVING COUNT(e.Empid)>1;
-- Display employees whose names start with 'A'.
SELECT Empname FROM EMPLOYEES WHERE Empname LIKE 'A%';
-- Find employees whose salary is between 45000 and 60000.
SELECT * FROM EMPLOYEES WHERE salary BETWEEN 45000 AND 60000;
-- Show the department name of each employee(JOIN query).
SELECT e.Empname,d.Deptname FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.Deptid=d.Deptid;
-- Find the number of employees in each department.
SELECT d.Deptname,COUNT(e.Empid) AS EMPLOYEE_COUNT FROM DEPARTMENTS d LEFT JOIN EMPLOYEES e ON d.Deptid=e.Deptid GROUP BY d.Deptname;
-- Display all employees ,including those without a department(LEFT JOIN).
SELECT e.Empname,d.Deptname FROM EMPLOYEES e LEFT JOIN DEPARTMENTS d ON e.Deptid=d.Deptid;