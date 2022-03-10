create database mydatabase
use mydatabase

                 ------DDL-----
alter table employee add emp_address varchar(45) not null
drop table employee

create table employee
(	
		emp_id int identity(1,1) primary key,
		emp_name varchar(55),
		emp_salary int,
		emp_address varchar(55),
		start_date datetime
		)
truncate TABLE employee 

			----------DQL---------
select * from employee

			----------DML---------
insert into employee(emp_name,emp_salary,emp_address,start_date)values('Tanay',200000,'Pune',GETDATE())
insert into employee(emp_name,emp_salary,emp_address,start_date)values('Raunak',700000,'Mumbai',GETDATE())
insert into employee(emp_name,emp_salary,emp_address,start_date)values('Jay',300000,'Chennai',GETDATE())
insert into employee(emp_name,emp_salary,emp_address,start_date)values('Roshan',400000,'Gujarat',GETDATE())
insert into employee(emp_name,emp_salary,emp_address,start_date)values('Ram',600000,'Punjab',GETDATE())
insert into employee(emp_name,emp_salary,emp_address,start_date)values('Rohit',600000,'Punjab',GETDATE())
insert into employee(emp_name,emp_salary,emp_address,start_date)values('Aniket',600000,'Chennai',GETDATE())


update employee set emp_address='Alaska'where emp_id=5

delete from employee where emp_address='mumbai'

               -------UNIQUE CONSTRAINTS-----

	CREATE TABLE persons(
    person_id INT IDENTITY PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    UNIQUE(email)
)
select * from persons
INSERT INTO persons(first_name, last_name, email)
VALUES('John','Doe','tanay7614@gmail.com');
INSERT INTO persons(first_name, last_name, email)
VALUES('Tanay','Doe','tanay7614@gmail.com');

CREATE TABLE person_skills (
    id INT IDENTITY(1,3) PRIMARY KEY,
    person_id int,
    skill_id int,
    updated_at DATETIME,
    UNIQUE (person_id, skill_id)
);
select * from person_skills
INSERT INTO person_skills(person_id,skill_id,updated_at)
VALUES(2,6,GETDATE());
INSERT INTO person_skills(person_id,skill_id,updated_at)
VALUES(3,7,GETDATE());


           ------- forgein key, primary key constraints ------

		   CREATE TABLE employee1 (Emp_ID INT NOT NULL PRIMARY KEY,
		                           Emp_Name VARCHAR (40),
								   Emp_Salary VARCHAR (40)
								   )
		   CREATE TABLE department(Dept_ID INT NOT NULL PRIMARY KEY,
		                           Dept_Name VARCHAR(40), 
								   Emp_ID INT NOT NULL,
								   FOREIGN KEY(Emp_ID) REFERENCES employee1(Emp_ID)
								   )  
		   select * from department 

		   --------GROUP BY ORDER BY CLAUSE------

		SELECT emp_address,AVG(emp_salary)
		FROM employee  
		GROUP BY  emp_address  
		ORDER BY emp_address ASC;  

		SELECT emp_address,SUM(emp_salary)
		FROM employee  
		GROUP BY  emp_address  
		ORDER BY emp_address ASC; 

		SELECT emp_address,COUNT(*)as CountNO
		FROM employee  
		GROUP BY  emp_address  
		ORDER BY emp_address DESC; 
		
		 --------SUBQUERIES-------

        SELECT * FROM employee 
        WHERE emp_ID IN (SELECT emp_ID 
        FROM  employee
        WHERE emp_salary < 600000)

        UPDATE persons 
        SET last_name = 'smith'
        WHERE person_id IN (SELECT emp_id FROM employee WHERE emp_address = 'Chennai' )

        select * from persons
           