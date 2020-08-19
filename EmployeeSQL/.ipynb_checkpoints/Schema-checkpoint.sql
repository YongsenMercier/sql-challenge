-- we have to create this table first before creating some others based on the constraints

create table titles (
	title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(25) not null
);

create table departments (
	dept_no VARCHAR(10) primary key,
	dept_name VARCHAR(35) not null
);

create table employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(10),
	birth_date DATE not null,
	first_name CHAR(25) not null,
	last_name CHAR(25) not null,
	sex CHAR(6) not null,
	hire_date DATE not null,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

create table dept_emp (
	emp_no INT,
	dept_no varchar(10),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

create table salaries (
	emp_no INT,
	salary int not null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

create table dept_manager (
	dept_no varchar(10),
	emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
