drop table departments;
drop table dept_emp;
drop table dept_manager;
drop table dept_manager;

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

select * from departments
select * from dept_emp
select * from dept_manager
select * from employees
select * from salaries
select * from titles






