---------------------------------------------- RETRIEVE COMMANDS ------------------------------------------

-- DESCRIBE COMMAND --
desc teacher_info;

-- INFORMATION COMMAND --
info teacher_info;
info+ teacher_info;

-- SELECT COMMAND --
select * from teacher_info;
select id,email from teacher_info;
select id UserId,email UserEmail from teacher_info;
select id as UserId,email as UserEmail from teacher_info;

-- DUAL TABLE --
select * from dual;
select 'My Name is adam' from dual;
select 'My Name is adam' as "Output" from dual;
select q'[My Name is adam]' as "Quote Operator" from dual;

-- DISTINCT & UNIQUE COMMAND --
select distinct email from teacher_info;
select unique email from teacher_info;
select distinct email,id from teacher_info;

-- CONCATINATION OPERATOR --
select 'My Name is ' || name from teacher_info;
select id || ',' || email || ',' || name  as "Full Information"  from teacher_info;

-- Demo Table --

create table employee(
id number(10) primary key,
name varchar2(100),
salary number(10),
email varchar2(100),
hire_date date
);
select * from employee;
insert into employee values(14,'mahesh',80000,'don@gmail.com',null);
commit;


-- Arithematic Expression --
select id,name,email,hire_date,salary+100*12 from employee;
select id,name,email,hire_date,(salary+100)*12 from employee;

-- Date Values --
select sysdate from dual;
select sysdate + 10 from dual;
select id,hire_date from employee;
select salary + null from employee;

-------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------  RESTRICT & SORTING COMMANDS --------------------------------------------------------------------------

----- Where Clause ------
select * from employee where salary > 500000;
select * from employee where email='mahesh@gmail.com';
select * from employee where salary <700000;
select * from employee where hire_date > '22-MAY-22';
select * from employee where hire_date = '13-MAY-22';
select * from employee where id <> 1;
select * from employee where id != 1;
select * from employee where id = 1;
select * from employee where salary between 30000 AND 50000;
select * from employee where hire_date between '01-JAN-2020' AND '01-JAN-2023';
select * from employee where id IN (1,2,3);
select * from employee where name IN ('mahesh','akash');
select * from employee where hire_date IN ('13-MAY-23','30-JUN-19');
select * from employee where name like 'sa%';
select * from employee where name like '%sa';
select * from employee where name like '%sa%';
select * from employee where name like '_h%';
select * from employee where name like '__p%';
select * from employee where hire_date=null;
select * from employee where hire_date is null;
select * from employee where hire_date is not null;
select * from employee where salary >=10000 AND salary <=50000;
select * from employee where name like 'sa%' OR salary<30000;
select * from employee where name not like 'sa%';
select * from employee where name NOT IN('akash','mahesh','nabin','hari');
select * from employee where (name='mahesh' OR name ='akash') and salary>40000;

-- SORTING COMMANDS --
select id,name,salary,email,hire_date from employee order by name asc;
select * from employee order by salary desc;
select id,name,salary,email,hire_date from employee order by 1 asc;
select * from employee order by 2 desc;
select * from employee order by name asc,salary asc;
select * from employee order by hire_date asc;
select * from employee order by hire_date asc NULLS FIRST;
select * from employee order by hire_date asc NULLS LAST;

-- ROWID AND ROWNUM --
select id,name,salary,email,hire_date,rowid,rownum from employee;
select * from employee  order by salary desc OFFSET 5 ROW FETCH FIRST 5 ROWS ONLY;
select * from employee  order by salary desc OFFSET 5 ROW FETCH FIRST 5 ROWS WITH TIES;
select * from employee  order by salary desc  FETCH FIRST 5 ROWS ONLY;
select * from employee  order by salary desc OFFSET 5 ROW;

----------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------USING SUBSITITUTION VARIABLES ------------------------------------------------------
select * from employee where salary=&salary_val;
select * from employee where name='&name';
select id,name,salary,email,&column_name from &table_name where &condition order by &clause_name;
select * from employee where salary between &sal AND &sal + 10000;
select * from employee where salary between &&esal AND &&esal + 10000;
select id,name,&&salary,email from employee order by &salary;

DEFINE emp_num = 5;
def emp_num = 5;
select * from employee where id=&emp_num;
UNDEFINE emp_num;
undef emp_num;
define;
undefine;

ACCEPT id PROMPT 'Please enter an valid id';
select * from employee where id=&id;
undef id;

SET VERIFY ON
select * from employee where id=&id;

SET VERIFY OFF
select * from employee where id=&id;
----------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------ SINGLE ROW FUNCTIONS --------------------------------------------------------------

-- CHARACTER FUNCTIONS --

--CASE CONVERSION FUNCTIONS --
select lower(name),upper(email) from employee;
select initcap(email) from employee;
select * from employee where name=lower('MAHESH');

-- CHARACTER MANIPULATION FUNCTIONS --
select name,substr(name,1,3),substr(name,4),length(name) from employee;
select concat(name,email) from employee;
select concat(name,concat(' ',email)) from employee;
select instr('I am learning how to use functions in oralce','o') from dual;
select instr('I am learning how to use functions in oralce','o',17) from dual;
select instr('I am learning how to use functions in oralce','o',17,3) from dual;
select instr('I am learning how to use functions in oralce','o',-1,3) from dual;

select trim('   my name is mahesh    ') as trimmed_text from dual;
select ltrim('   my name is mahesh    ') as trimmed_text from dual;
select rtrim('   my name is mahesh    ') as trimmed_text from dual;

select email,replace(email,'@gmail.com') from employee;
select email,replace(email,'gmail','yahoo') from employee;
select name,replace(name,'a','z') from employee;

select LPAD('MAHESH',10,'-') from dual;
select RPAD('MAHESH',10,'-') from dual;

-- NUMERIC FUNCTIONS --
select ROUND(12.556) from dual;
select ROUND(12.136,2) from dual;
select TRUNCATE(12.136,2) from dual;
select CEIL(12.22) from dual;
select FLOOR(12.88) from dual;
select MOD(11,3) from dual;

-- NESTED FUNCTIONS ---
select LPAD(UPPER(CONCAT(name,email)),30,'-') as "NESTED FUNCTIONS" from employee;


-- DATE VALUES AND FORMAT IN ORACLE --
select SYSDATE,CURRENT_DATE,SESSIONTIMEZONE,SYSTIMESTAMP,CURRENT_TIMESTAMP from dual;
select sysdate from dual;
select sysdate,sysdate+5 from dual;
select sysdate,sysdate-5 from dual;
select sysdate,sysdate + 1/24 from dual;
select id,hire_date,sysdate,trunc(sysdate-hire_date) as "Working Days" from employee order by id;
select id,hire_date,sysdate,trunc((sysdate-hire_date)/360) as "Working Days" from employee order by id;

select sysdate,add_months(sysdate,3) from dual;
select sysdate,add_months(sysdate,-3) from dual;
select months_between(sysdate,'21-JAN-2020') from dual;
select hire_date,trunc(hire_date,'MONTH'),round(hire_date,'MONTH') from employee;
select extract(year from sysdate) as "Extracted Result" from dual;
select extract(month from sysdate) as "Extracted Result" from dual;
select extract(day from sysdate) as "Extracted Result" from dual;
select next_day(sysdate,'SUNDAY') from dual;
select last_day(sysdate) from dual;
------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------- CONVERSION FUNCTIONS -------------------------------------------------------------------------

---Implicit Conversion---

-- Implicit Conversion from a VARCHAR2 value to a NUMBER value -------
select * from employee where salary > '30000';

-- Implicit Conversion from a VARCHAR2 value to a DATE value ------
select * from employee where hire_date='13-MAY-23';

-- Implicit Conversion from a NUMBER value to a VARCHAR2 value ---
select id || name from employee;

-- Implicit Conversion from a DATE value to a VARCHAR2 value ---
select name || hire_date from employee;

-- Explicit Converison --

--TO_CHAR Function--
select name,hire_date,to_char(hire_date,'YYYY') from employee;
select name,hire_date,to_char(hire_date,'RR') from employee;
select name,hire_date,to_char(hire_date,'YEAR') from employee;
select name,hire_date,to_char(hire_date,'MM') from employee;
select name,hire_date,to_char(hire_date,'MM-YYYY') from employee;
select name,hire_date,to_char(hire_date,'MON-YYYY') from employee;
select name,hire_date,to_char(hire_date,'Mon-YYYY') from employee;
select name,hire_date,to_char(hire_date,'mon-YYYY') from employee;
select name,hire_date,to_char(hire_date,'MONTH') from employee;
select name,hire_date,to_char(hire_date,'Month') from employee;
select name,hire_date,to_char(hire_date,'DD') from employee;
select name,hire_date,to_char(hire_date,'DY') from employee;
select name,hire_date,to_char(hire_date,'Dy') from employee;
select name,hire_date,to_char(hire_date,'DAY-Month') from employee;
select name,hire_date,to_char(hire_date,'Day-Month-YYYY HH24') from employee;
select name,hire_date,to_char(hire_date,'Day-Month-YYYY HH24:MI') from employee;
select name,hire_date,to_char(hire_date,'Day-Month-YYYY HH24:MI:SS') from employee;
select name,hire_date,to_char(hire_date,'Day-Month-YYYY HH24:MI:SS') from employee;
select name,hire_date,to_char(hire_date,'DDTH-Month-YYYY HH24:MI:SS') from employee;

select salary,to_char(salary,'$9,99,999.99') from employee;
select salary,to_char(salary,'L9,99,999.99') from employee;
select salary,to_char(salary,'099,999.99') from employee;
select salary,to_char(salary,'0000099,999.99') from employee;

-- TO_NUMBER FUNCTION --
select TO_NUMBER('$6,152.21','$99,999.99') as "Formatted Number" from dual;
select id,name,email,to_char(hire_date,'DD-Mon-YYYY') from employee where hire_date > to_date('Jun 12, 2020','Mon DD, YYYY');


---NULL RELATED FUNCTION ---
select id,name,email,hire_date,NVL(hire_date,'15-OCT-22') as NVL_HIRE_DATE from employee;
select id,name,email,hire_date,NVL2(hire_date,'has','has not') as NVL_HIRE_DATE from employee;
select id,name,nullif(hire_date,null) from employee;
select coalesce(null,null,1,2,3) from dual;


-------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------  CONDITIONAL EXPRESSIONS -------------------------------------------------------
-- CASE EXPRESSION ON SELECT --
SELECT
  id,
  name,
  salary,
  email,
  hire_date,
  CASE
    WHEN salary < 30000 THEN 1.20 * salary
    WHEN salary < 20000 THEN 1.50 * salary
    WHEN salary < 10000 THEN 2 * salary
    ELSE salary
  END AS "updated salary"
FROM
  employee;
  
  
  SELECT
  id,
  name,
  salary,
  email,
  hire_date,
  CASE salary
    WHEN 30000 THEN 1.20 * salary
    WHEN 20000 THEN 1.50 * salary
    WHEN 10000 THEN 2 * salary
    ELSE salary
  END AS "updated salary"
FROM
  employee;

--- CASE WITH WHERE CLAUSE ---
select id,name,email,salary,hire_date from employee where (
CASE 
    WHEN hire_date > '13-MAY-2020' AND salary > 40000 THEN 1
    ELSE 0
    END 
) = 1;

-- DECODE FUNCTION --
  SELECT
  id,
  name,
  salary,
  email,
  hire_date,
  DECODE(salary,30000,1.20 * salary,20000,1.50 * salary,10000,2 * salary,salary) AS "updated salary"
FROM
  employee;
-----------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------- GROUP FUNCTIONS -------------------------------------------------------------------------
-- AVG FUNCTION --
select avg(salary),avg(all salary),avg(distinct salary) from employee;

--COUNT FUNCTION --
select count(id) as "ID SUM" from employee;
select count(salary),count(all salary),count(distinct salary) from employee;

-- MAX FUNCTION --
select max(salary) from employee;
select max(hire_date) from employee;
select max(name) from employee;

--MIN FUNCTION --
select min(salary) from employee;
select min(hire_date) from employee;
select min(name) from employee;

-- SUM FUNCTION --
select sum(salary),sum(all salary),sum(distinct salary) from employee;

-- LISTAGG FUNCTION --
select listagg(name,',') within group (order by name) "Employees" from employee;

-------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------- GROUPING DATA -------------------------------------------------------------------
--GROUP BY CLAUSE --
select name,avg(salary) from employee group by name;
select name,avg(salary) from employee group by name order by avg(salary);
select name,sum(salary) from employee group by name;
select id,name,sum(salary) from employee group by name,id;
select avg(salary) from employee group by name;
select name,avg(salary),sum(salary),max(salary),min(salary), count(*) from employee group by name;
select name,avg(salary),sum(salary),max(salary),min(salary), count(*) from employee  where name in ('mahesh','akash','nabin','shyam') group by name;
select name,avg(salary),sum(salary),max(salary),min(salary), count(*) from employee group by name having avg(salary) > 40000;
select max(avg(salary)) from employee group by name;
------------------------------------------------------------------------------------------------------------------------------------------------------
--- CREATING TABLE FOR JOIN OPERATION ----
create table employee(
employee_id number(10) primary key,
first_name varchar2(100),
last_name varchar2(100),
phone_number number(10),
salary number(10),
email varchar2(100),
hire_date date,
job_id varchar2(100),
commission_pct number(10,2),
manager_id number(10),
department_id number(10)
);

create table department(
department_id number(10) primary key,
department_name varchar2(100),
manager_id number(10),
location_id number(10)
);

create table locations(
location_id number(10) primary key,
street_address varchar2(100),
postal_code number(10),
city varchar2(100),
state_province varchar2(100)
);
insert into locations values(1700,'krishna mandir',4333,'lalitpur','bagmati');
-----------------------------------------------------------------------------------------------------------------------------------------
select * from department;
select * from employee;
select * from employee natural join department;
select first_name,last_name from employee natural join department;
select * from employee join department using (department_id);
select * from employee join department using (department_id,manager_id);
select first_name,last_name,department_name,e.manager_id from employee e join department d using (department_id);
select first_name,last_name,department_name,e.manager_id as employee_manager_id,d.manager_id as department_manager_id from employee e join department d using (department_id);
select e.first_name,e.last_name,d.manager_id,d.department_name from employee e join department d on (e.department_id = d.department_id AND e.manager_id = d.manager_id);
select e.first_name,e.last_name,manager_id,d.department_name from employee e join department d using (department_id,manager_id);
-- during on clause joining column name must not be same but for using clasuse joining column name must be same
select * from employee e join department d on e.department_id = d.department_id join locations l on l.location_id = d.location_id;
select * from employee e join department d on e.department_id = d.department_id join locations l on l.location_id = d.location_id where d.department_id=10;
select * from employee e join department d on e.department_id = d.department_id join locations l on l.location_id = d.location_id AND e.employee_id=10;
select * from employee;
select * from department;
select worker.employee_id,worker.first_name,worker.last_name,worker.phone_number,worker.manager_id,manager.employee_id,manager.first_name,manager.last_name from employee worker join employee manager on worker.manager_id = manager.employee_id;
select worker.employee_id,worker.first_name,worker.last_name,worker.phone_number,d.department_name,d.location_id,worker.salary from employee worker join department d on worker.salary > d.location_id;
select e.employee_id,e.first_name,d.department_id,d.department_name from employee e left outer join department d on e.employee_id = d.department_id;
select e.employee_id,e.first_name,d.department_id,d.department_name from employee e right outer join department d on e.employee_id = d.department_id;
select e.employee_id,e.first_name,d.department_id,d.department_name from employee e full outer join department d on e.employee_id = d.department_id;
select e.employee_id,e.first_name,d.department_id,d.department_name from employee e cross join department d ;
----------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------- SUB QUERIES -------------------------------------------------------------------------

select * from employee;
-- SUB QUERY --
select * from employee where salary=  (select salary from employee where employee_id = 2);

-- SINGLE ROW SUB QUERY --
select * from employee where department_id = (select department_id from employee where employee_id = 8);
select * from employee where department_id = (select department_id from employee where employee_id = 8) and salary >=  (select salary from employee where employee_id =3);
select * from employee where hire_date > (select min(hire_date) from employee);
select * from employee where hire_date = (select max(hire_date) from employee);

-- MULTIPLE ROW SUB QUERIES --
select min(salary),department_id from employee group by department_id;
select first_name,last_name,department_id,salary from employee where salary in (select min(salary) from employee group by department_id);
select first_name,last_name,department_id,salary from employee where salary > any (select salary from employee where last_name='lamichhane' );
select first_name,last_name,department_id,salary from employee where salary < all (select salary from employee where last_name='lamichhane' );

-- MULTIPLE COLUMN SUB QUERIES --
select employee_id,first_name,last_name,department_id,salary from employee where department_id IN 
(select department_id from employee where employee_id in (1,5))
and salary in (select salary from employee where employee_id in (1,5));

select employee_id,first_name,last_name,department_id,salary from employee where (department_id,salary) IN 
(select department_id,salary from employee where employee_id in (1,5,9));

-- SUB QUERIES AS TABLE --
select * from ( select employee_id,first_name,last_name from employee join department using (manager_id));
select first_name from ( select employee_id,first_name,last_name from employee join department using (manager_id));

-- SCALAR SUB QUERIES --
select employee_id,first_name,last_name from employee where department_id = (select department_id from employee where first_name='mahesh');

-- CORELATED SUB QUERIES --

select employee_id,first_name,last_name,manager_id,department_id from employee where
(department_id,manager_id) in (select department_id,manager_id from employee where last_name='lamichhane');
select employee_id,first_name,last_name from employee  e where salary = (select max(salary) from employee b where b.department_id = e.department_id);
select * from employee;
select *from department;

-- EXISTS OPERATOR AND SEMIJOINS --
select employee_id,first_name,last_name,department_id from employee a where EXISTS(select 1, employee_id from employee where manager_id= a.employee_id);
select * from department d where not exists (select department_id from employee e where e.department_id = d.department_id);

---------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------- SET OPERATIONS --------------------------------------------------------------------------------
create table employee2(
employee_id number(10) primary key,
first_name varchar2(100),
last_name varchar2(100),
phone_number number(10),
salary number(10),
email varchar2(100),
hire_date date,
job_id varchar2(100),
commission_pct number(10,2),
manager_id number(10),
department_id number(10)
);

select * from employee;
insert into employee2 values(1,'mahesh','lamichhane',9818567284,60000,'mahesh@gmail.com','12-JAN-22','12',5.2,8,10);
insert into employee2 values(2,'akash','lamichhane',9818567284,60000,'mahesh@gmail.com','12-JAN-22','12',5.2,8,10);

select * from employee union select * from employee2;
select * from employee union all select * from employee2;
select * from employee intersect select * from employee2;
select * from employee minus select * from employee2;
select first_name,last_name from employee minus select first_name,last_name from employee2;
select first_name,last_name,salary from employee minus select first_name,last_name,null from employee2;
select employee_id,salary from employee  union select employee_id,salary from employee2  order by salary;

select * from employee union select * from employee2 minus select * from employee;

--- DDL OPERATIONS --
create table employee200 as select * from employee;
create table employee100 as select * from employee where employee_id=1;
create table employee10(first_name,last_name) as select first_name,last_name from employee;
select * from employee10;

alter table employee10 add salary number(10,2);
alter table employee10 add (phone number(10),emial varchar2(100));
desc employee10;

alter table employee10 modify last_name varchar2(200) default 'hello' not null ;
alter table employee10 modify (last_name varchar2(300) ,first_name varchar2(300));

alter table employee10 drop column first_name;
alter table employee10 drop  (first_name,last_name);

alter table employee10 rename column first_name to full_name;
rename employee10 to employee10_backup;
alter table employee10 rename to backup_employee;

alter table employee10 set unused column first_name;
alter table employee10 set unused (last_name,email);

alter table employee10 READ ONLY;
alter table employee10 READ WRITE;

drop table employee10 ;

drop table employee10 purge ;
flashback table employee10 to before drop;

delete from employee_10;
truncate table employee_10;
--------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------    CREATING CONSTRAINTS ---------------------------------------------------------------------


clear screen;









