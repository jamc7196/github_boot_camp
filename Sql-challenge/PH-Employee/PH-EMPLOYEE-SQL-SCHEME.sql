--STUDENT "Jorge-Alberto-Muozcano-Castro" 
--"SQL-Challenge-Pewlett-Hackard-ERD" 

-- PART B) DATA ENGINEERING

DROP TABLE departments
DROP TABLE dept_emp
DROP TABLE dept_manager
DROP TABLE employees
DROP TABLE salaries
DROP TABLE titles

--*FROM THE SQL SCHEME GENERATED FROM THE ERD, CREATE ON PGADMIN THE RESPECTIVE TABLE

CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dep_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "irst_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" INT   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

-- ADD THE FOREIGN KEY ON EACH TABLE WITH NEXT QUERRIES GENERATED IN THE ERD
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

--*IMPORT EACH CSV FILE INTO PGADMIN AND FILL EACH TABLE
--START IMPORTING FIRST DEPARTMENTS AND EMPLOYEES CSV FILES AS THEY HAVE ATTRIBUTES SET AS PRIMARY KEY THEN THE REST OF THE FILES.
--1) 
SELECT * FROM departments
--2)
SELECT * FROM dept_emp
--3)
SELECT * FROM dept_manager
--4)
SELECT * FROM employees
--5)
SELECT * FROM salaries
--6)
SELECT * FROM titles

------------------------------------------------------------------------------
-- C)DATA ANALYSIS

DROP VIEW employees_salary
DROP VIEW employees_1986
DROP VIEW dept_manager_schedule
DROP VIEW departments_team
DROP VIEW Employees_name_Hercules_db
DROP VIEW sales_department
DROP VIEW sales_development_department
DROP VIEW last_name_frquency_count

--1) List the following details of each employee: employee number, last name, first name, gender, and salary.
CREATE VIEW employees_salary AS
SELECT employees.emp_no,employees.last_name,employees.irst_name,
employees.gender, salaries.salary FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

--2) List employees who were hired in 1986.
CREATE VIEW employees_1986 AS
SELECT emp_no, last_name, irst_name, hire_date FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3)List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
CREATE VIEW dept_manager_schedule AS
SELECT departments.dept_no,departments.dep_name,dept_manager.emp_no,
employees.last_name,employees.irst_name,dept_manager.from_date, 
dept_manager.to_date FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

--4)List the department of each employee with the following information: employee number, last name, first name, and department name.
CREATE VIEW departments_team AS
SELECT dept_emp.emp_no, employees.last_name,
employees.irst_name,departments.dep_name FROM dept_emp
JOIN employees ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no;

--5) List all employees whose first name is "Hercules" and last names begin with "B."
CREATE VIEW Employees_name_Hercules_db AS
SELECT irst_name, last_name FROM employees
WHERE irst_name ='Hercules' AND last_name LIKE 'B%';


--6) List all employees in the Sales department, including their employee number, last name, first name, and department name.
CREATE VIEW sales_department AS
SELECT dept_emp.emp_no, employees.last_name,
employees.irst_name,departments.dep_name FROM dept_emp
JOIN employees ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dep_name = 'Sales';

--7)List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW sales_development_department AS
SELECT dept_emp.emp_no, employees.last_name,
employees.irst_name,departments.dep_name FROM dept_emp
JOIN employees ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dep_name = 'Sales'
OR departments.dep_name ='Development';

--8)In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
CREATE VIEW last_name_frquency_count AS
SELECT last_name, COUNT(last_name) 
AS "last name frequency count" FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

--VIEWS FOR EACH ANSWER
--1)
SELECT * FROM employees_salary
--2)
SELECT * FROM employees_1986
--3)
SELECT * FROM dept_manager_schedule
--4)
SELECT * FROM departments_team
--5)
SELECT * FROM Employees_name_Hercules_db
--6)
SELECT * FROM sales_department
--7)
SELECT * FROM sales_development_department
--8)
SELECT * FROM last_name_frquency_count