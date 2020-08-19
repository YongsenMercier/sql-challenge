-- List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.

select E.emp_no AS "Employee ID", E.last_name as "Last Name", E.first_name as "First Name", 
	E.sex as "Gender", S.salary as "Salary"
	from employees as E
	left join salaries as S
	on E.emp_no = S.emp_no;
	
--List first name, last name, and hire date for employees who were hired in 1986.

select first_name as "First Name", last_name as "First Name", hire_date as "Hire Date"
	from employees
	where extract(year from hire_date) = '1986';
	
--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

select DM.dept_no as "Department Number", D.dept_name as "Department Name", 
	DM.emp_no as "Employee Number", E.last_name as "Last Name", E.first_name as "First Name"
	from departments as D
	left join dept_manager as DM
	on D.dept_no = DM.dept_no
	left join employees as E
	on DM.emp_no = E.emp_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
	
select E.emp_no as "Employee Number", E.last_name as "Last Name", E.first_name as "First Name",
	D.dept_name as "Department Name"
	from employees as E
	left join dept_emp as DE
	on E.emp_no = DE.emp_no
	left join departments as D
	on D.dept_no = DE.dept_no;
	
--List first name, last name, and sex for employees whose 
--first name is "Hercules" and last names begin with "B."
	
select first_name as "First Name", last_name as "Last Name", sex as "Gender"
	from employees
	where first_name = 'Hercules' and last_name like 'B%';
	
--List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.
	
select E.emp_no as "Employee Number", E.last_name as "Last Name", E.first_name as "First Name",
	D.dept_name as "Department Name"
	from employees as E
	left join dept_emp as DE
	on E.emp_no = DE.emp_no
	left join departments as D
	on D.dept_no = DE.dept_no
	where D.dept_name = 'Sales';
	
--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
	
select E.emp_no as "Employee Number", E.last_name as "Last Name", E.first_name as "First Name",
	D.dept_name as "Department Name"
	from employees as E
	left join dept_emp as DE
	on E.emp_no = DE.emp_no
	left join departments as D
	on D.dept_no = DE.dept_no
	where D.dept_name = 'Sales' or D.dept_name = 'Development' ;
	
	
--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
	
select count(last_name) as "Name Count", last_name as "Last Name"
	from employees
	group by last_name
	order by "Name Count" DESC;
	
	

	
	
	
	