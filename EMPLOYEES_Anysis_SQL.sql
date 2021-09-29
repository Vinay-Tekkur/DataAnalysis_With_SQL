-- Get All salaries by departments
SELECT department, SUM(salary) 
FROM employees
GROUP BY department

-- Get count of all employees by department
SELECT department, COUNT(*) as number_of_employees
FROM employees
GROUP BY department

-- Get Count of employees, Average salary of employees, Max and min salaries by department
SELECT department, COUNT(*) total_emp,
ROUND(AVG(salary),2) avg_sal, MAX(salary) as max_sal, MIN(salary) min_sal
FROM employees
GROUP BY department
ORDER BY total_emp DESC

SELECT department, COUNT(*) total_emp,
ROUND(AVG(salary),2) avg_sal, MAX(salary) as max_sal, MIN(salary) min_sal
FROM employees
WHERE salary > 70000
GROUP BY department
ORDER BY total_emp DESC

-- Get the total number of employees categorized by gender on each department
SELECT department, gender, COUNT(*) total_employees
FROM employees
GROUP BY department, gender
ORDER BY department

-- Get departments which has more than 35 employees works
SELECT department, COUNT(*) as total_emp
FROM employees
GROUP BY department
HAVING COUNT(*) > 35

-- Get employees who has same type of first_name
SELECT first_name, COUNT(*) as emp_count
FROM employees
GROUP BY first_name
HAVING COUNT(*) > 2
ORDER BY emp_count DESC

-- Get unique depatment names without using DISTINCT
SELECT department FROM employees
GROUP BY department

-- Get employees count based on domain names 
SELECT SUBSTRING(email from POSITION('@' in email)+1) AS domain_name, COUNT(email) AS count_emp
FROM employees
WHERE email IS NOT NULL
GROUP BY domain_name
ORDER BY count_emp DESC

-- Get employees works on different regions by gender of employees
SELECT gender, region_id, MIN(salary) min_salary,
MAX(salary) max_salary,
ROUND(AVG(salary)) avg_sal
FROM employees
GROUP BY  gender, region_id
ORDER BY gender, region_id















