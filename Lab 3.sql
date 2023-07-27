--1
SELECT first_name, last_name, department_name
FROM employees e, departments d
WHERE  e.department_id = d.department_id AND
    first_name LIKE 'A%';
    
--2
SELECT first_name || ' ' || last_name "Full Name", job_id "Job Title ", department_name "Department Name"
FROM employees e, departments d
WHERE  e.department_id = d.department_id
ORDER BY last_name ASC;

--3
SELECT first_name || ' ' || last_name "Full Name", department_name "Department Name", salary, city
FROM employees e, departments d, locations l
WHERE  e.department_id = d.department_id 
AND d.location_id = l.location_id 
AND salary > '12000'
ORDER BY salary DESC;

--4
SELECT department_id, department_name, street_address, postal_code, city, state_province, region_name
FROM departments d, locations l, regions r, countries c
WHERE c.region_id = r.region_id 
AND d.location_id = l.location_id
AND c.COUNTRY_ID = l.COUNTRY_ID 
AND c.region_id IN ('1', '4');

--5
SELECT first_name || ' ' || last_name "Full Name", email || '@MEGACORP.COM' "Email", department_name "Department Name", city || ', ' || country_name "Full Address"
FROM employees e, departments d, locations l, countries c
WHERE e.department_id = d.department_id 
AND d.location_id = l.location_id 
AND l.country_id = c.country_id
ORDER BY last_name ASC;

--6
SELECT first_name || ' ' || last_name "Full Name", email || '@MEGACORP.COM' "Email", department_name "Department Name", city || ', ' || country_name "Full Address"
FROM employees e, departments d, locations l, countries c
WHERE e.department_id = d.department_id 
AND d.location_id = l.location_id 
AND l.country_id = c.country_id 
AND c.country_name = '&country_name'
ORDER BY last_name ASC;

--7
SELECT first_name || ' ' || last_name "Full Name", department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id;

--8
SELECT e.first_name || ' ' || e.last_name "Full Name", e.employee_id "Employee #", e.manager_id "Manager #", m.first_name ||' '||m.last_name "Manager Name"
FROM employees e, employees m
WHERE e.manager_id = m.employee_id;

--9
-- Not all employees have an manager associated to them and therefore it only shows for 106 employees.

--10
SELECT e.first_name || ' ' || e.last_name "Full Name", e.employee_id "Employee #", e.manager_id "Manager #", m.first_name ||' '||m.last_name "Manager Name"
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+);