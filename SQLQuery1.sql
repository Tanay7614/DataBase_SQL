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

delete from employee where emp_name='ram'

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
INSERT INTO persons(first_name, last_name, email)
VALUES('shubham','gol','shubh45687@gmail.com');
INSERT INTO persons(first_name, last_name, email)
VALUES('Rohan','dol','rokokula45@gmail.com');

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
								   INSERT INTO department(Dept_ID,Dept_Name,Emp_ID )
                                   VALUES(1,'hr',1)
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
           
		   ---------Left Join-------
	 SELECT emp_ID, emp_NAME,emp_address,first_name,email  
	 FROM employee  
     LEFT JOIN persons  
     ON employee.emp_ID = persons.person_id;

	       ----------Right join------
	 SELECT emp_ID, emp_NAME,emp_address,first_name,email  
	 FROM employee  
     Right JOIN persons  
     ON employee.emp_ID = persons.person_id;

	      ----------Full outer join------
	 SELECT emp_ID, emp_NAME,emp_address,first_name,email  
	 FROM employee  
     Full outer JOIN persons  
     ON employee.emp_ID = persons.person_id;

	      ----------INNER join------
	 SELECT emp_ID, emp_NAME,emp_address,first_name,email  
	 FROM employee  
     INNER JOIN persons  
     ON employee.emp_ID = persons.person_id;

	       ----------MULTIPLE join------

     CREATE TABLE student(st_ID INT PRIMARY KEY,
		                  st_Name VARCHAR(40) Not Null, 
						  st_lastName varchar(30) NOT NULL
						  )
	 INSERT INTO student(st_ID,st_Name,st_lastName) VALUES(1,'Maxwell','Warner')
	 INSERT INTO student(st_ID,st_Name,st_lastName) VALUES(2,'Virat','Kohli')
	 INSERT INTO student(st_ID,st_Name,st_lastName) VALUES(3,'Mahi','Dhoni')

	 SELECT emp_id,emp_salary, emp_address,first_name,email,st_Name
	 FROM employee  
     JOIN persons  
     ON employee.emp_ID = persons.person_id 
	 join student
	 on student.st_ID=persons.person_id

	 SELECT emp_address,sum(emp_salary) TotalSalary
	 FROM employee  
     JOIN persons  
     ON employee.emp_ID = persons.person_id 
	 join student
	 on student.st_ID=persons.person_id
	 group by emp_address

	 SELECT emp_address,count(*) TotalEmployee
	 FROM employee  
     JOIN persons  
     ON employee.emp_ID = persons.person_id 
	 join student
	 on student.st_ID=persons.person_id
	 group by emp_address
	 
	 select * from student
	 select * from persons
     SELECT * FROM employee 

	                --------Cast Function--------
	 SELECT CAST('2017-08-25' AS datetime);
	 SELECT CAST(25.65 AS varchar);
	 SELECT CAST(25.65 AS smallint);
	 SELECT CAST(25.65 AS tinyint);
	
	 SELECT CAST(25.65 AS numeric);
	 SELECT CAST(25.65 AS  datetime);
	 SELECT CAST(25.65 AS varchar);
	 SELECT CAST(25 AS binary);
	 select emp_id,emp_name,start_date,CAST(start_date as varchar)as convertedDataType from employee
	 

	                  -------Convert Function-------

     SELECT CONVERT(nvarchar, '2017-08-25');
	 SELECT CONVERT(int, 12.5);
	 SELECT * FROM employee 
	 select emp_id,emp_name,start_date,convert( nvarchar ,start_date,103)as convertedDataType from employee
	

	                  -------Like Operator-------
	                   
	 select Emp_Name from Employee where Emp_Name like 'R%'

     select emp_name from employee where emp_name like '%ha%'

     select emp_address from employee where emp_address like '_h%'

	 select emp_address from employee where emp_address like 'm__%'
	 SELECT * FROM employee 

	                   --------View Operator-------

	 Create View viewempDepartment
     as
	 SELECT emp_id,emp_salary, emp_address,first_name,email,st_Name
	 FROM employee  
     JOIN persons  
     ON employee.emp_ID = persons.person_id 
	 join student on
	 student.st_ID=persons.person_id
	 select * from viewempDepartment

	 Create View viewempDepaPer
     as
	 SELECT emp_address,sum(emp_salary) TotalSalary
	 FROM employee  
     JOIN persons  
     ON employee.emp_ID = persons.person_id 
	 join student
	 on student.st_ID=persons.person_id
	 group by emp_address
	 select * from viewempDepaPer

	                     ---------Delete Cascade-------

	 select * from persons
     CREATE TABLE school(sc_ID INT PRIMARY KEY,
		                  sc_Name VARCHAR(40) Not Null,
						  emp_id int,
						  foreign key (emp_ID) references employee(emp_ID)
	                      On delete set null
						  )
     INSERT INTO school(sc_ID,sc_Name,emp_id) VALUES(1,'Private',1)
	 INSERT INTO school(sc_ID,sc_Name,emp_id) VALUES(2,'gov',2)
	 INSERT INTO school(sc_ID,sc_Name,emp_id) VALUES(3,'Bharat',3)
     select * from school
	 SELECT * FROM employee 
	 delete from employee where emp_name='raunak'
	 delete from employee where emp_id=3

	                     ---------Update Cascade---------

      CREATE TABLE company1(cmp_ID INT PRIMARY KEY,
		                  cmp_Name VARCHAR(40) Not Null,
						  st_id int,
						  foreign key (st_ID) references student(st_ID)
	                      On update cascade
						  )
	  INSERT INTO company1(cmp_ID,cmp_Name,st_id) VALUES(1,'KPMG',1)
	  INSERT INTO company1(cmp_ID,cmp_Name,st_id) VALUES(2,'Tata',2)
	  INSERT INTO company1(cmp_ID,cmp_Name,st_id) VALUES(3,'Jaro',3) 
	  update student set st_id=4 where st_name='Maxwell' 
	  SELECT * FROM student
	  SELECT * FROM company1

	                     ---------Derived Table--------

	 select * from 
     (
     SELECT emp_address,sum(emp_salary) TotalSalary
	 FROM employee  
     JOIN persons  
     ON employee.emp_ID = persons.person_id 
	 join student
	 on student.st_ID=persons.person_id
	 group by emp_address
	 ) As derivedtable


	                    ---------Stored Procedure--------
 
     CREATE PROCEDURE SelectAllemplyoee
     AS
     SELECT * FROM employee
     GO;
	 EXEC SelectAllemplyoee;
	    
		               ------------Stored Procedure With One Parameter----------

	 CREATE PROCEDURE SelectAllemp @City nvarchar(30)
     AS
     SELECT * FROM employee WHERE emp_address = @City
     GO
	 EXEC SelectAllemp @City = 'pune'

	                   ----------Stored Procedure With Multiple Parameters------
	 CREATE PROCEDURE SelectAllempl @City nvarchar(30), @name nvarchar(10)
     AS
     SELECT * FROM employee WHERE emp_address = @City AND emp_name = @name
     GO
	 EXEC SelectAllempl @city='gujarat', @name='roshan'

	                  