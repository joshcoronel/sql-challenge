-- Data Analysis

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name,e.first_name, e.sex, s.salary
FROM employee AS e
    JOIN Salaries as s
    on (e.emp_no = s.emp_no);
	
-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employee
WHERE hire_date BETWEEN '$1986-01-01' AND '$1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
	JOIN departments AS d
	on (dm.dept_no = d.dept_no)
		JOIN employee as e
		on(dm.emp_no = e.emp_no);

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_employee as de
	JOIN departments as d
	on (de.dept_no = d.dept_no)
		JOIN employee as e
		on(de.emp_no = e.emp_no);
		
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employee
WHERE first_name='Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments as d
	JOIN dept_employee as de
	on (d.dept_no = de.dept_no)
		JOIN employee as e
		on (de.emp_no = e.emp_no)
		WHERE d.dept_name = 'Sales';
		
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments as d
	JOIN dept_employee as de
	on (d.dept_no = de.dept_no)
		JOIN employee as e
		on (de.emp_no = e.emp_no)
		WHERE d.dept_name IN ('Sales','Development');

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) AS "last name count"
FROM employee
GROUP BY last_name
ORDER BY "last name count" DESC;

