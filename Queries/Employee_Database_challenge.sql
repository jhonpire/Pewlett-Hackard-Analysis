--Generate Retirement Titles table
SELECT DISTINCT ON (e.emp_no)t.emp_no,
	first_name,
	last_name,
	title,
	from_date,
	to_date
INTO retirement_titles
FROM employees AS e
LEFT JOIN titles AS t ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31');

SELECT * FROM retirement_titles;

--Generate Unique Titles Table
SELECT DISTINCT ON (emp_no)emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, from_date DESC;

SELECT * FROM unique_titles WHERE title = 'Manager';

SELECT * FROM unique_titles;

--Generate Retiring Titles Table
SELECT COUNT(title),
title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

Select * FROM retiring_titles;

--Generate Mentorship Eligibility Table
SELECT DISTINCT ON (e.emp_no)ti.emp_no,
	first_name,
	last_name,
	birth_date,
	from_date,
	to_date,
	title
INTO mentorship_eligibilty
FROM employees as e
LEFT JOIN titles AS ti ON e.emp_no = ti.emp_no
WHERE to_date = '9999-01-01' and (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no ASC;

SELECT * FROM mentorship_eligibilty;