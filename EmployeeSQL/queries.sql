-- 1- query for: employee number, last name, first name, sex, and salary. 
-- am using a left join between employees and salaries tables using employee number as common id.

SELECT 
e.emp_no,
e.first_name, 
e.last_name, 
e.sex,
s.salary
FROM employees e
LEFT JOIN salaries s ON s.emp_no = e.emp_no;

-- 2- List first name, last name, and hire date for employees who were hired in 1986. 
--  am using the 'BETWEEN operator' to query the data for selected year. 
SELECT 
first_name,
last_name,
hire_date
FROM employees e
WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- to count total number of employees hired in 1986, we used count operator.
SELECT 
count(e.first_name) AS "Total Hiring '1986'"
FROM employees e
WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3- List the manager of each department with the following information: department number, 
    -- department name, the manager's employee number, last name, first name.
-- using left joint, we joined the departments table to the dept_manager table and we then joined the employee
-- table to account for all the information needed. 

SELECT
d.dept_no, 
d.dept_name,
dm.emp_no,
e.first_name, 
e.last_name
FROM dept_manager dm
LEFT JOIN employees e
ON e.emp_no = dm.emp_no
	LEFT JOIN departments d
	ON d.dept_no = dm.dept_no;
	

