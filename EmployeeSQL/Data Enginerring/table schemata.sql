CREATE TABLE Titles (
  Title_id VARCHAR(10) NOT NULL PRIMARY KEY,
  Title VARCHAR(20) NOT NULL
);

select * from titles;
SELECT COUNT(*) FROM titles;


CREATE TABLE Departments (
  Dept_no CHAR(4) NOT NULL PRIMARY KEY,
  Dept_name VARCHAR(20) NOT NULL
);

select * from departments;
SELECT COUNT(*) FROM departments;

CREATE TABLE Employees (
  Emp_no INT NOT NULL PRIMARY KEY,
  Emp_title_id VARCHAR(10) NOT NULL,
  Birth_date DATE NOT NULL,
  First_name VARCHAR(50) NOT NULL,
  Last_name VARCHAR(50) NOT NULL,
  Sex CHAR(1) NOT NULL CHECK (Sex IN ('M', 'F')),
  Hire_date DATE NOT NULL,
  FOREIGN KEY (Emp_title_id) REFERENCES Titles(Title_id)
);

select * from employees;
SELECT COUNT(*) FROM employees;

CREATE TABLE DepartmentEmployee (
  Emp_no INT NOT NULL,
  Dept_no CHAR(4) NOT NULL,
  PRIMARY KEY (Emp_no, Dept_no),
  FOREIGN KEY (Emp_no) REFERENCES Employees(Emp_no),
  FOREIGN KEY (Dept_no) REFERENCES Departments(Dept_no)
);

select * from departmentemployee;
SELECT COUNT(*) FROM departmentemployee;

CREATE TABLE DepartmentManager (
  Dept_no CHAR(4) NOT NULL,
  Emp_no INT NOT NULL,
  PRIMARY KEY (Dept_no, Emp_no),
  FOREIGN KEY (Dept_no) REFERENCES Departments(Dept_no),
  FOREIGN KEY (Emp_no) REFERENCES Employees(Emp_no)
);

select * from departmentmanager;
select count (*) from departmentmanager;

CREATE TABLE Salaries (
  Emp_no INT NOT NULL,
  Salary INT NOT NULL,
  FOREIGN KEY (Emp_no) REFERENCES Employees(Emp_no)
);

select * from salaries;
select count (*) from salaries;
