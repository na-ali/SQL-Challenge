--list employee details and salary.
SELECT e.Emp_no, e.Last_name, e.First_name, e.Sex, s.Salary
FROM Employees e
JOIN Salaries s ON e.Emp_no = s.Emp_no;

--Employees hired in 1986.
SELECT First_name, Last_name, Hire_date
FROM Employees
WHERE EXTRACT(YEAR FROM Hire_date) = 1986;

--List department managers.
SELECT dm.Dept_no, d.Dept_name, dm.Emp_no, e.Last_name, e.First_name
FROM DepartmentManager dm
JOIN Departments d ON dm.Dept_no = d.Dept_no
JOIN Employees e ON dm.Emp_no = e.Emp_no;


--Department number for each employee.
SELECT de.Dept_no, e.Emp_no, e.Last_name, e.First_name, d.Dept_name
FROM DepartmentEmployee de
JOIN Employees e ON de.Emp_no = e.Emp_no
JOIN Departments d ON de.Dept_no = d.Dept_no;


--Employees named Hercules with last names starting with B.
SELECT First_name, Last_name, Sex
FROM Employees
WHERE First_name = 'Hercules' AND Last_name LIKE 'B%';


-- Employees in the Sales department.
SELECT e.Emp_no, e.Last_name, e.First_name
FROM Employees e
JOIN DepartmentEmployee de ON e.Emp_no = de.Emp_no
JOIN Departments d ON de.Dept_no = d.Dept_no
WHERE d.Dept_name = 'Sales';


-- Employees in Sales and Development departments.
SELECT e.Emp_no, e.Last_name, e.First_name, d.Dept_name
FROM Employees e
JOIN DepartmentEmployee de ON e.Emp_no = de.Emp_no
JOIN Departments d ON de.Dept_no = d.Dept_no
WHERE d.Dept_name IN ('Sales', 'Development');


--Frequency counts of last names.
SELECT Last_name, COUNT(*) as Frequency
FROM Employees
GROUP BY Last_name
ORDER BY Frequency DESC;
