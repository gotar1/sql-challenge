-- 1. query for: employee number, last name, first name, sex, and salary. 
-- am using a left join between employees and salaries tables using employee number as common id.

SELECT 
e.emp_no,
e.first_name, 
e.last_name, 
e.sex,
s.salary
FROM employees e
LEFT JOIN salaries s ON s.emp_no = e.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986. 
--  am using the 'BETWEEN' operator to query the data for selected year. 

SELECT 
first_name,
last_name,
hire_date
FROM employees e
WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- as an added token, I decided do count total number of employees hired in 1986. 
SELECT 
COUNT(e.first_name) AS "Total Hiring '1986'"
FROM employees e
WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List the manager of each department with the following information: department number, 
    -- department name, the manager's employee number, last name, first name.
-- using left joint, we joined the departments table to the dept_manager table and we then joined the employee
-- table to account for all the information needed. join operation done based on our tables constraints.

SELECT
d.dept_no, 
d.dept_name,
dm.emp_no,
e.last_name,
e.first_name
FROM dept_manager dm
LEFT JOIN employees e
ON e.emp_no = dm.emp_no
	LEFT JOIN departments d
	ON d.dept_no = dm.dept_no;
	
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
-- following tables constraints, dept_emp rable left joined with employees table and then departments table left joined with dept_emp
  -- to extract needed informations.

SELECT 
e.emp_no,
e.last_name,
e.first_name, 
d.dept_name
FROM dept_emp de
LEFT JOIN employees e
ON e.emp_no = de.emp_no
	LEFT JOIN departments d
	ON d.dept_no = de.dept_no;
	
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B".
-- we used where and like operators for string search. the special operator 'B%' indicate begin with a 'B'. 

SELECT
e.first_name,
e.last_name,
e.sex
FROM employees e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- we use left join to extract all information we need and then used the where operator to look for sales department..

SELECT 
e.emp_no,
e.last_name,
e.first_name, 
d.dept_name
FROM dept_emp de
LEFT JOIN employees e
ON e.emp_no = de.emp_no
	LEFT JOIN departments d
	ON d.dept_no = de.dept_no
	WHERE dept_name = 'Sales';
	
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- once again same procedure as above query was used and then used the where operator coupled with OR to look for sales and development departments..

SELECT 
e.emp_no,
e.last_name,
e.first_name, 
d.dept_name
FROM dept_emp de
LEFT JOIN employees e
ON e.emp_no = de.emp_no
	LEFT JOIN departments d
	ON d.dept_no = de.dept_no
	WHERE dept_name = 'Sales' OR dept_name = 'Development';
	
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
-- we used count unique operator 'count(*)' and grouped data by last name, then we order it in a descending order.

SELECT
last_name,
count(*) AS frequency_count
FROM employees e
GROUP BY last_name
ORDER BY frequency_count DESC;
