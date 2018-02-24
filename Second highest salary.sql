if OBJECT_ID('tempdb..#tempEmployee') is not null
	drop table #tempEmployee

select '1' [EmpID],'Shekhar' [Name],'100' [Salary]
into #tempEmployee
UNION
select '2' [EmpID],'Ramesh' [Name],'200' [Salary]
UNION
select '3' [EmpID],'Mahesh' [Name],'300' [Salary]
UNION
select '4' [EmpID],'Anjali' [Name],'400' [Salary]
UNION
select '5' [EmpID],'Rohit' [Name],'500' [Salary]


select * from #tempEmployee

--[1] For SQL server 2005 and +
;WITH CTE as (
select EmpID,Name,Salary, row_number() over(order by salary desc) as RN
from #tempEmployee
)
select EmpID,Name,Salary from CTE where RN=2

--[2] For SQL server 2000
select top(1) EmpID,Name,Salary from(
select top(2) EmpID,Name,Salary 
from #tempEmployee order by salary desc)x
order by salary asc

--[3] For SQL server 2005 and +
DECLARE @N int=3;

;WITH CTE as (
select EmpID,Name,Salary, row_number() over(order by salary desc) as RN
from #tempEmployee
)
select EmpID,Name,Salary from CTE where RN=@N

--[4] For SQL server 2000
select top(1) EmpID,Name,Salary from(
select top(@N) EmpID,Name,Salary 
from #tempEmployee order by salary desc)x
order by salary asc