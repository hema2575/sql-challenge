# sql-challenge

## The ERD of the Employees DB
![alt tag](https://github.com/hema2575/sql-challenge/blob/main/EmployeeSQL/QuickDBD-ERD-data_modeling.png)


## Employees DB - Data Engineering

1. Creating employees table
-----------------------------------------------------

CREATE TABLE employees (
  emp_no int NOT NULL,
  emp_title_id varchar(20) NOT NULL,
  birth_date date NOT NULL,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  sex varchar(5),
  hire_date date not null
);
ALTER TABLE employees
ADD PRIMARY KEY (emp_no);

2. Creating titles table
-----------------------------------------------------

CREATE TABLE titles (
  title_id varchar(20) NOT NULL Primary key,
  title varchar NOT NULL
);

3. Creating departments table
-----------------------------------------------------

CREATE TABLE departments (
  dept_no varchar NOT NULL Primary key,
  dept_name varchar NOT NULL
);

4. Creating dept_emp table
-----------------------------------------------------

CREATE TABLE dept_emp (
  emp_no int Primary key,
  dept_no varchar,
  FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);
ALTER TABLE dept_emp
DROP CONSTRAINT dept_emp_Pkey;

5. Creating dept_manager table
-----------------------------------------------------

CREATE TABLE dept_manager (
  dept_no varchar,
  emp_no int
  --FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
  --Foreign key (emp_no) References employees	
);
ALTER TABLE dept_manager
DROP CONSTRAINT dept_no_Fkey;

6. Creating salaries table
-----------------------------------------------------
CREATE TABLE salaries (
  emp_no int Primary key,
  salary int
);

## Data Analysis:
-- 1. List the following details of each employee: employee number,last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex,
salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT emp_no, first_name, last_name, hire_date from employees
WHERE hire_date >= '1985-12-31'
AND hire_date < '1987-01-01';

-- 3. List the manager of each department with the following information
--: department number, department name, the manager's employee number, 
--last name, first name.

SELECT dept_manager.dept_no, 
	   dept_manager.emp_no,
	   departments.dept_name,
	   employees.last_name,
	   employees.first_name
FROM dept_manager
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no;


-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.emp_no, 
	   employees.last_name, 
	   employees.first_name,
	   departments.dept_name
FROM employees
INNER JOIN dept_manager ON
employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no;


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, 
departments.dept_name
from employees 
INNER JOIN dept_emp ON
 employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
 dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments,including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, 
departments.dept_name
from employees 
INNER JOIN dept_emp ON
 employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
 dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Sales', 'Development') 


SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp ON
e.emp_no = dept_emp.emp_no
INNER JOIN departments AS d ON
dept_emp.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR 
	  dept_name = 'Development';


-- 8. In descending order, list the frequency count of employee last names,i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) FROM employees
GROUP BY last_name
ORDER BY count(last_name) desc;



## Histogram and Barchart

![alt tag](https://github.com/hema2575/sql-challenge/  .png)


