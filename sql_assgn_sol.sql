/* MODULE 1 */
/* question 1 */
create database training;

/* question 2 */
create table demography (
    CustID int auto_increment primary key,
    Name varchar(50),
    Age int,
    Gender varchar(1)
);

/* question 3 */
insert into demography (Name, Age, Gender)
values ("John", 25, "M");

/* question 4 */
insert into demography (Name, Age, Gender)
values ("Pawan", 26, "M"), ("Hema", 31, "F");

/* question 5 */
insert into demography (Name, Gender)
values ("Rekha", "F");

/* question 6 */
select *
from demography;

/* question 7 */
update demography
set Age = null
where Name = "John";

/* question 8 */
select *
from demography
where Age is null;

/* question 9 */
delete from demography;

/* question 10 */
drop table demography;

/* MODULE 2 */
/* question 1 */
select account_id, cust_id, avail_balance
from account
where status = "ACTIVE" and avail_balance > 2500;

/* question 2 */
select *
from account
where open_date BETWEEN "20020101" and "20021231";

/* question 3 */
select avail_balance, pending_balance
from account
where avail_balance != pending_balance;

/* question 4 */
select account_id, product_cd
from account
where account_id in (1, 10, 23, 27);

/* question 5 */
select account_id, avail_balance
from account
where avail_balance between 100 and 200;

/* MODULE 3 */
/* question 1 */
select count(*)
from account;

/* question 2 */
select *
from account
limit 2;

/* question 3 */
select *
from account
limit 2;

/* question 4 */
select 
	substring(birth_date, 1, 4) as Year, 
    substring(birth_date, 6,2) as Month, 
    substring(birth_date, 9, 2) as Day,
    dayofweek(birth_date) as DayOfWeek
from individual;

/* question 5 */
select substring("Please find the substring in this string", 17, 9) as PLEASE;

/* question 6 */
select abs(25.76823), sign(25.76823), 100 * round(25.76823/100, 0);

/* question 7 */
select date(current_date() + 1);

/* question 8 */
select substring(fname, 1, 3) as `First Three`, substring(lname, -3) as `Last Three`
from individual

/* question 9 */
select upper(fname)
from individual
where length(fname) > 5;

/* question 10 */
select max(avail_balance), avg(avail_balance)
from account
where cust_id = 1;

/* MODULE 4 */
/* question 1 */
select cust_id as `Customer ID`, count(cust_id) as `Number of Accounts`
from account
group by cust_id;

/* question 2 */
select cust_id as `Customer ID`, count(cust_id) as `Number of Accounts`
from account
group by cust_id
having count(cust_id) > 2;

/* question 3 */
select fname as `First Name`, birth_date as `Birth Date`
from individual
order by birth_date desc;

/* question 4 */
select year(open_date), avg(avail_balance)
from account
group by year(open_date)
having avg(avail_balance) > 200
order by year(open_date);

/* question 5 */
select product_cd as `Product Code`, max(pending_balance) as `Max Pending Balance`
from account
where product_cd in ("CHK", "SAV", "CD")
group by product_cd;

/* MODULE 5 */
/* question 1 */
select fname as `First Name`, title as `Title`, name as `Department Name`
from employee 
inner join department on employee.dept_id = department.dept_id;

/* question 2 */
select product_type.name, product.name
from product_type
left join product on product_type.product_type_cd = product.product_type_cd;

/* question 3 */
select concat(emp.fname, " ", emp.lname) as Employee,
    concat(sup.fname, " ", sup.lname) as Superior
from employee as emp
inner join employee as sup
on emp.superior_emp_id = sup.emp_id

/* question 4 */
select fname, lname
from employee
where superior_emp_id in (
	select emp_id
    from employee
    where fname = "Susan" and lname = "Hawthorne");

/* question 5 */
select fname, lname
from employee
where emp_id in (
	select distinct(superior_emp_id)
    from employee);

