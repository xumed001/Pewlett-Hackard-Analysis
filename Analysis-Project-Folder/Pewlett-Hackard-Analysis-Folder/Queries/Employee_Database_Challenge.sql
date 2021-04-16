-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date
--INTO retiring_emps
FROM employees AS e
JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


/*-- NON Unique 
SELECT e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date
--INTO retiring_emps_0
FROM employees AS e
JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, e.birth_date DESC;
*/

-- Retiring titles 
SELECT COUNT(title) as "count", title
--INTO retiring_titles
from retiring_emps
Group by title
Order by "count" Desc;


-- Mentorship eligibility  
SELECT Distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, ti.title
--INTO mentorship_eligibility
FROM employees as e
JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

-- # of roles needed to be filled
select count(emp_no)
from retiring_emps
-- # of qualified mentors 
select count(emp_no)
from mentorship_eligibility



















