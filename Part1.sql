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
