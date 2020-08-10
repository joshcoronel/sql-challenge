-- Link to schema: https://app.quickdatabasediagrams.com/#/d/G0m7jP

-- Drop tables
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Dept_Employee;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Dept_Manager;
DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Titles;


-- Create Tables
CREATE TABLE Titles (
    title_id varchar NOT NULL,
    title varchar NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE Departments (
    dept_no varchar NOT NULL,
    dept_name varchar NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE Employee (
    emp_no int NOT NULL,
    emp_title_id varchar NOT NULL,
    birth_date varchar NOT NULL,
    first_name varchar NOT NULL,
    last_name varchar NOT NULL,
    sex varchar NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

CREATE TABLE Dept_Employee (
    emp_no int NOT NULL,
    dept_no VARCHAR NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES Departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employee (emp_no)
);

CREATE TABLE Dept_Manager (
    dept_no VARCHAR NOT NULL,
    emp_no int NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES Departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employee (emp_no)
);

CREATE TABLE Salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employee (emp_no)
);


