-- Create retirement_titles table
	-- Retrieve the emp_no, first_name, last_name columns from the Employees table
	-- Retrieve the title, from_date, to_date columns from the Titles table
	-- Create a new table using the INTO clause
	-- Join both tables on the primary key
	-- Filter the data on the birth_date column to retrieve employees born between 1952 and 1955; then order by the employee number

SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	t.title, 
	t.from_date, 
	t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM retirement_titles;


-- Create unique_titles table using DISTINCT with ORDER BY to remove duplicate rows
SELECT DISTINCT ON (emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;


-- Create retiring titles table to group the count of employees retiring by job title
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title 
ORDER BY COUNT DESC;

SELECT * FROM retiring_titles;


-- Create mentorship_eligibility table
	-- Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table
	-- Retrieve the from_date and to_date columns from the Department Employee table
	-- Retrieve the title column from the Titles table
	-- Use a DISTINCT ON statement to retrieve the first occurence of the employee number
	-- Create a new table using the INTO clause
	-- Join the Employees and Department Employee tables on the primary key; then join the Employees and Titles tables on the primary key
	-- Filter the data on the to_date column; and filter data on the birth_date columns
	-- Order the table by the employee number

SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	e.first_name,
	e.last_name, 
	e.birth_date,
	de.from_date, 
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no = de.emp_no
LEFT JOIN titles AS ti
ON e.emp_no = ti.emp_no
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no, ti.title;

SELECT * FROM mentorship_eligibility;
