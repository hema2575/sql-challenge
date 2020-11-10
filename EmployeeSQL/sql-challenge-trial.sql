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

CREATE TABLE titles (
  title_id varchar(20) NOT NULL Primary key,
  title varchar NOT NULL
);
CREATE TABLE departments (
  dept_no int NOT NULL Primary key,
  dept_name varchar NOT NULL
);

CREATE TABLE dept_emp (
  emp_no int Primary key,
  dept_no int,
  FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);
CREATE TABLE dept_manager (
  dept_no int,
  emp_no int,
  FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
  Foreign key (emp_no) References employees	
);
CREATE TABLE salaries (
  emp_no int Primary key,
  salary int
);