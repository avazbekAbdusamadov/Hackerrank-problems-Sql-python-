/* draw triangle using mssql sever*/
declare @var int=20
while @var>0
begin
   print replicate('*',@var)
   set @var=@var-1;
end;

