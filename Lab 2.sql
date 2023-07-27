--1
SELECT first_name, last_name, commission_pct, job_id
FROM employees
Where commission_pct > 0.25;

--2
SElECT first_name, last_name, job_id, salary
FROM employees
WHERE salary BETWEEN 7000 AND 9000;

--3
SElECT first_name, last_name, job_id, salary
FROM employees
WHERE salary NOT BETWEEN 7000 AND 9000;

--4
--BETWEEN operator will give values between given values. NOT BETWEEN will give values outside the given values.

--5
SElECT first_name || ' ' || last_name "Ful Name", job_id, hire_date
FROM employees
WHERE last_name IN ('Atkinson', 'Greenberg');

--6
SELECT street_address, postal_code, city, country_id
FROM locations
WHERE country_id IN ('Brazil', 'United Kingdom');

--7
SELECT first_name, last_name, 'Email: ' || email || 'Phone: ' || phone_number
FROM employees
WHERE hire_date BETWEEN '01/08/1998' AND '31/08/1999'
ORDER BY first_name;

--8
SELECT first_name || ' ' || last_name "Full Name" , 'Email: ' || email || 'Phone: ' || phone_number "Contact Details"
FROM employees
WHERE hire_date > '01/12/1999'
ORDER BY hire_date DESC;

--9
SELECT * FROM employees
WHERE first_name LIKE 'S%n';

--10
SELECT first_name, last_name, job_id
FROM employees
WHERE job_id IN ('AC_MGR', 'AD_VP', 'FI_MGR', 'HR_REP', 'PR_REP');

--11
SELECT employee_id, last_name, salary, department_id
FROM   employees
WHERE  department_id = &department_num;
--90 = 3
--50 = 45
--60 = 5
--110 = 2
