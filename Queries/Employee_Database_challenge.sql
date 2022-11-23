-- Deliverable 1

-- Create retirement table by titles
SELECT emp.emp_no, emp.first_name, emp.last_name,
ti.title, ti.from_date, ti.to_date

INTO retirement_titles
FROM employees as emp
INNER JOIN titles AS ti
ON (ti.emp_no = emp.emp_no) 
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp.emp_no, ti.title DESC;


-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp.emp_no) emp.emp_no, emp.first_name, emp.last_name,
ti.title

INTO unique_titles
FROM employees as emp
INNER JOIN titles AS ti
ON (ti.emp_no = emp.emp_no) 
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (ti.to_date = '9999-01-01')
ORDER BY emp.emp_no ASC, ti.to_date DESC;

-- Use Count to determine number of retirement-eligible employees are in each title
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY (title)
ORDER BY count DESC;

-- Deliverable 2

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp.emp_no) emp.emp_no, emp.first_name, emp.last_name, 
emp.birth_date, de.from_date, de.to_date, ti.title
INTO mentorship_eligibility
FROM employees as emp
INNER JOIN dept_emp AS de
ON (emp.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (emp.emp_no = ti.emp_no) 
WHERE (ti.to_date = '9999-01-01')
AND (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp.emp_no ASC;

Select * from retiring_titles;
Select * from employees;
select * from unique_titles;
Select * from mentorship_eligibility;
Select * from titles;
Select * from salaries;
Select * from departments;
select * from retirement_info;
select count(*)
from retirement_titles
select count(*)
from mentorship_eligibility