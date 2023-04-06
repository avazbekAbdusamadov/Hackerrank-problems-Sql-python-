/* draw triangle using mssql sever*/
declare @var int=20
while @var>0
begin
   print replicate('*',@var)
   set @var=@var-1;
end;

/*   Query an alphabetically ordered list of all names in OCCUPATIONS, immediately 
followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). 
For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. 
Sort the occurrences in ascending order, and output them in the following format:*/

(select concat(name,'(',left(occupation,1),')') from occupations 
 order by name asc)
 union
(select concat('There are a total of ',count(occupation),' ',lower(occupation) ) from occupations 
group by occupation
order by count(occupation), occupation);



/* A country is big if:

it has an area of at least three million (i.e., 3000000 km2), or
it has a population of at least twenty-five million (i.e., 25000000).
Write an SQL query to report the name, population, and area of the big countries.   */
select name, population, area from world
where area>=3000000 or population>=25000000;


/*  Write an SQL query to find the ids of products that are both low fat and recyclable.   */
select product_id from products
where low_fats='Y' and recyclable='Y';


/*  Write an SQL query to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) 
with a single update statement and no intermediate temporary tables.  */

update salary
set sex=case  sex when 'm' then 'f'
when 'f' then 'm'
else null
end;


/*  Write an SQL query to report the names of the customer that are not referred by the customer with id = 2. */
select name from customer
where not referee_id=2 or referee_id is null;

/*  Write an SQL query to report all customers who never order anything.  */
select name as customers from customers
where id not in (select customerId from orders);


/* Write an SQL query to report the name and bonus amount of each employee with a bonus less than 1000.   */

select employee.name, Bonus.bonus from employee
left join Bonus
on employee.empid=Bonus.empId
where Bonus.bonus<1000 or bonus is null;

