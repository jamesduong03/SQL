--1
SELECT 
    CONCAT(UPPER(last_name) || ', ', first_name) "Full Name", 
    LOWER(CONCAT(email, '@megacorp.com')) "Email"
FROM employees
ORDER BY last_name;

--2
SELECT last_name, 'NZD ' || TO_CHAR (salary, '99,999'), NVL(commission_pct, 0) "commission %", NVL(TO_CHAR(commission_pct * salary), 'No Commission') "Commission"
FROM employees
ORDER BY last_name;

--3
SELECT first_name || ' ' || last_name "Full Name", LENGTH(first_name) + LENGTH(last_name) || ' Char.' "Name Length",
    TO_CHAR(hire_date, 'DAY') "Hire DAY", TO_CHAR(hire_date, 'MONTH') "Hire Date", TO_CHAR(hire_date, 'DD YYYY') " "
FROM employees
WHERE commission_pct > 0
AND job_id NOT LIKE 'SA_MAN';

--4
SELECT first_name || ' ' || last_name "Full Name", job_id "Job Title" , LOWER(CONCAT(email, '@megacorp.com')) "Email"
FROM employees
WHERE first_name = INITCAP('&first_name');

--5
SELECT MIN(salary) "Minimum Salary", MAX(salary) "Maximum Salary", ROUND(AVG(salary),2) "Avg Salary", ROUND(STDDEV(salary),2) "StdDev of Salary"
FROM employees;

--6
SELECT job_id "Job Title", COUNT(job_id)
FROM employees
GROUP BY job_id
ORDER BY COUNT(job_id) DESC;

--7
SELECT MIN(salary) "Minimum Salary", MAX(salary) "Maximum Salary", ROUND(AVG(salary),2) "Avg Salary", ROUND(STDDEV(salary),2) "StdDev of Salary"
FROM employees
WHERE department_id = 80;


--8
SELECT e.department_id "Department No", d.department_name "Department Name", ROUND(AVG(salary),2) "Avg Salary"
FROM employees e, departments d 
WHERE  e.department_id = d.department_id
group by e.department_id, d.department_name
HAVING AVG(salary) > 0
ORDER BY AVG(salary) DESC;

--9
SELECT e.department_id "Department No", d.department_name "Department Name", ROUND(AVG(salary),2) "Avg Salary"
FROM employees e, departments d 
WHERE  e.department_id = d.department_id
group by e.department_id, d.department_name
HAVING AVG(salary) > 6000
ORDER BY AVG(salary) DESC;

--10
SELECT first_name || ' ' || last_name "Full Name", j.job_title "Job Title", d.department_name "Department Name", 
    start_date "Start Date", end_date "End Date", ROUND(MONTHS_BETWEEN(TO_DATE(end_date, 'DD-MM-YYYY'), TO_DATE(start_date, 'DD-MM-YYYY'))) "# of Months in Position"
FROM employees e, job_history h , jobs j, departments d
WHERE e.department_id = d.department_id
AND e.employee_id = h.employee_id
AND j.job_id = h.job_id;