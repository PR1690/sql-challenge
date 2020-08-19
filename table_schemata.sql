--Create table for Departments:
CREATE TABLE Departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
	PRIMARY KEY (dept_no)
);

--Show table
select * from Departments;

--Create table for Titles:
CREATE TABLE Titles (
	title_id VARCHAR  NOT NULL,
    title VARCHAR   NOT NULL,
	PRIMARY KEY (title_id)
);

--Show table
SELECT * from Titles;

--Create table for employees:
CREATE TABLE Employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR NOT NULL,
	birth_date date not null,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date date   NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

--Show table
SELECT * from Employees;

--Create table for Department_Employees:
CREATE TABLE Department_Employees (
    emp_no INT   NOT NULL,
	dept_no VARCHAR   NOT NULL,
   	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

--Show table
select * from Department_Employees;

--Create table for Department_Manager:
CREATE TABLE Department_Manager(
    dept_no VARCHAR NOT NULL,
    emp_no INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

--Show table
SELECT * from Department_Manager;

--Create table for Salaries:
CREATE TABLE Salaries (
    emp_no INT NOT NULL,
	salary INTEGER NOT NULL, 
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

--Show table
SELECT * from Salaries;