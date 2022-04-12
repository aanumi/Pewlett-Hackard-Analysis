-- Creating tables for PH-EmployeeDB
CREATE TABLE departments(
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(40) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);

-- Creating table for Employees
CREATE TABLE employees(
	emp_no INT NOT NULL,
	birth_date VARCHAR NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
	);
	
-- Creating table for Dept_Manager
CREATE TABLE dept_mgr(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- Creating table for salaries
CREATE TABLE salaries(
	emp_no INT not null,
	salary INT not null,
	from_date DATE not null,
	to_date DATE not null,
foreign key (emp_no) references employees (emp_no),
	primary key (emp_no)
);

-- Querying for confirmation
select * from departments;
