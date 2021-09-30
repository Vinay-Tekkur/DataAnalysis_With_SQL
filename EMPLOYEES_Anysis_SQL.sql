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

-- Get Employees who works on department which not exists on department table 
SELECT first_name, last_name FROM employees
WHERE department NOT IN (SELECT department FROM departments)

-- Get department which does not exists on departments table
SELECT DISTINCT department FROM employees
WHERE department NOT IN (SELECT department FROM departments)

-- Get Employees who work on Electronic Division
SELECT first_name, last_name, department FROM employees e
WHERE e.department IN (SELECT department FROM departments WHERE division = 'Electronics')

-- Get Employees who work on 'Asia' and 'Canada' and their salart more than $100,000
SELECT * FROM employees
WHERE region_id IN (SELECT region_id FROM regions WHERE country = 'Asia' OR  country = 'Canada')
AND salary > 130000

SELECT * FROM employees
WHERE region_id IN (SELECT region_id FROM regions WHERE country IN ('Asia', 'Canada'))
AND salary > 130000

-- Get employees whos salary less than max salary of employees
SELECT first_name, last_name, department, 
(SELECT MAX(salary) FROM employees) - salary AS emp_salary_compared_with_maxempl_al
FROM employees
WHERE region_id IN (SELECT region_id FROM regions WHERE country IN ('Asia', 'Canada'))


-- Write a query that returns all of those employees that work in the kids division AND the dates at which
-- those employees were hired is greater than all of the hire_dates of employees who work in the maintenance
-- department
SELECT * FROM employees
WHERE department IN (SELECT department 
					 FROM departments 
					 WHERE division = 'Kids') 
AND
hire_date > ALL(SELECT hire_date 
				FROM employees 
				WHERE department = 'Maintenance')

-- Most Frequent salaries and get order results by Decending order
SELECT salary, COUNT(salary)
FROM employees
GROUP BY salary
HAVING COUNT(salary) > 1
ORDER BY salary DESC
LIMIT 1


--------------------------------------------------------- STUDENTS DATABASE QUERIES ------------------------------------------------------------------

-- Using subqueries only, write a SQL statement that returns the names 
-- of those students that are taking the courses Physics and US History.
SELECT student_name
FROM students
WHERE student_no IN
(SELECT student_no FROM student_enrollment WHERE course_no IN 
 (SELECT course_no FROM courses WHERE course_title IN ('Physics', 'US History')))


-- Using subqueries only, write a query that returns the name of the student that is taking the 
-- highest number of courses.
SELECT student_name
FROM students
WHERE student_no IN
(
SELECT student_no
FROM student_enrollment
WHERE course_no IN (SELECT course_no FROM courses)
GROUP BY student_no
ORDER BY COUNT(*) DESC
LIMIT 1
)


-- Write a query to find the student that is the oldest. 
-- You are not allowed to use LIMIT or the ORDER BY clause to solve this problem
SELECT student_name, age
FROM students
WHERE age IN (SELECT MAX(age) FROM students)

