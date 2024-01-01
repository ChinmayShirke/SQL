---chinu_notes
.

---Creating table
create table emp(
user_id int ,
name char(20),
age int
);


--Alter table :
alter table emp2 add name char(20);
alter table emp2 drop column name;
alter table emp2 modify name varchar(12);
alter table u1 rename amount to paisa


--Deleting the table
drop table emp2   


--deleting all records
truncate table emp2   


--select
select * from emp where name='chinmay'
select age from emp where age=20


--update 
update emp set age=32,name='chiu' where user_id='7'


--delete
delete from emp where user_id =8


--insert
insert into emp values(1,'chinmay',19);


--Rename	
alter table u1 rename  to u11


--limit
select * from emp 
limit 5


--order by
select * from emp 
order by salary asc    (ascending)
select * from emp 
order by salary desc  (descending)


--group by
select address  ,count(salary) as total from emp 
group by address

select e.adress , count(e.emp_name) from emp as e
group by e.adress


--having
select adress,sum(salary) as total from emp 
group by adress
having sum(salary)>700


--inner join   (Return matching record from boath the tables )
select e.emp_name,c.transaction 
from emp as e
inner join
customer as c
on e.emp_id = c.cus_id


--left join ( return record from left table )
select * from
emp as e
left join
customer as c
on e.emp_id=c.cus_id 


--Right Join (Return value from rigt table)
select * from
emp as e
right join
customer as c
on e.emp_id=c.cus_id


--Full outer join (Return value from boath of the table)
select * from
emp as e
full outer join
customer as c
on e.emp_id=c.cus_id


--Join( inner join)
select * from
emp as e
 join
customer as c
on e.emp_id=c.cus_id


--(same no of column and data type)
--union (unique)
select * from u2
union  
select * from u1


--union all (return duplicate)
select * from u2
union all
select * from u1

--sub query
select * from emp where salary >(select avg(salary) from emp)


---Window Function  ( over )  window table below here
--To select specific column : partition by 
--To select hole row:   rows between unbounded preceding and unbounded following
select salary ,adress ,
count(salary) over(partition by adress order by salary) as total
from emp

select salary ,adress ,
max(salary) over
(order by salary rows between unbounded preceding and unbounded following)
as max from emp

select salary ,
dense_rank() over(order by salary) from emp

select emp_id,
last_value(emp_id) over (order by emp_id rows between unbounded preceding and unbounded following) 
from emp


--Case statement
select emp_name ,
case 
when  salary>1000  then  'best'
when..
when…
else 'good'
end  as lifestyle
from emp

select department ,
case department
when  'DS'  then  'best' 
else 'good'
end  as view
from emp3


--Importing CSV file 
create table customer(
	customer_id int8 primary key,
	first_name varchar(50),
	last_name varchar(30),
	adress int8
);

copy customer(customer_id,first_name,last_name,adress)
from 'D:\SQL\customer.csv'
delimiter ','
csv header;


--CTE –Common Table Expression
with amount as (
	select  p.mode , max(p.amount) as heighest_amount ,sum (p.amount) as total_amount from payment as p
    group by mode
)
select total_amount from amount



with my_cte as (select * from emp as e
			   inner join
			   customer  as c
			   on e.emp_id = c.customer_id)
select first_name ,emp_name  from my_cte


























