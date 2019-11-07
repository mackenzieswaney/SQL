--List employee number, last name, first name, gender, and salary
SELECT employees.emp_no, employees.last_name, 
	employees.first_name, employees.gender, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

--List employees who were hired in 1986
SELECT * From employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department w/department number, department name, 
--manager's employee number, last name, first name, start and end employment dates
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--List the department of each employee w/ employee number, last name, first name,department name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

--List first name="Hercules" and last names="B."
SELECT * FROM employees
WHERE first_name='Hercules'
AND last_name LIKE 'B%';

--Sales department w/employee number, last name, first name,department name
SELECT departments.dept_name, dept_emp.emp_no, dept_emp.dept_no, employees.last_name, employees.first_name FROM departments
JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales';

--List Sales and Development departments w/employee number, last name, first name, department name
SELECT  departments.dept_name, dept_emp.emp_no, dept_emp.dept_no, employees.last_name, employees.first_name FROM departments
JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name LIKE 'Development'
OR departments.dept_name LIKE 'Sales';

--In descending order, list the frequency count of employee last names
--i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "frequency" FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;