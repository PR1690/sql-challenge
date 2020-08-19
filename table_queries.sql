-- DATA ANALYSIS

-- Question 1. Details of each employee: employee number, last name, first name, sex, and salary.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex,
Salaries.salary
FROM Employees
INNER JOIN Salaries ON
Employees.emp_no = Salaries.emp_no;

-- Question 2. List first name,last name, and hire date for employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date from Employees
WHERE hire_date >= '12/31/1985'
AND hire_date < '01/01/1987';

-- Question 3. List the manager of each department with the following information: 
				-- department number, department name, the manager's employee number, 
				-- last name, first name.
SELECT dm.dept_no, 
	   d.dept_name,
	   dm.emp_no,
	   e.last_name,
	   e.first_name
FROM Department_Manager AS dm
INNER JOIN Departments AS d ON
dm.dept_no = d.dept_no
INNER JOIN Employees AS e ON
dm.emp_no = e.emp_no;

-- Question 4. List the department of each employee with the following information: 
	-- employee number, last name, first name, and department name.
SELECT e.emp_no, 
	   e.last_name, 
	   e.first_name,
	   d.dept_name
FROM Employees as e
INNER JOIN Department_Manager AS dm ON
e.emp_no = dm.emp_no
INNER JOIN Departments AS d ON
dm.dept_no = d.dept_no;

-- Question 5. List first name,last name, and sex for employees whose first name is Hercules" and 
	   --last names begin with "B."
SELECT Employees.first_name,Employees.last_name, Employees.sex FROM Employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--Question 6. List all employees in the Sales department, 
	--including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employees AS e
JOIN Department_Employees AS de ON
e.emp_no = de.emp_no
INNER JOIN Departments AS d ON
de.dept_no = d.dept_no
WHERE dept_name = 'Sales';

--Question 7. List all employees in the Sales and Development departments, 
	-- including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employees AS e
JOIN Department_Employees AS de ON
e.emp_no = de.emp_no
INNER JOIN Departments AS d ON
de.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR 
	  dept_name = 'Development';

--Question 8. In descending order, list the frequency count of employee last names, 
	-- i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) FROM Employees
GROUP BY last_name
ORDER BY count(last_name) desc;  