--########## Start of table creation ###########
if OBJECT_ID('tempdb..#tempEmployee') is not null
	drop table #tempEmployee
	
select '1' [EmpID],'Shekhar' [EmpName]
into #tempEmployee
UNION
select '2' [EmpID],'Ramesh' [EmpName]
UNION
select '3' [EmpID],'Aditya' [EmpName]

select * from #tempEmployee


if OBJECT_ID('tempdb..#tempStudent') is not null
	drop table #tempStudent
	
select '1' [StdID],'Shekhar' [StdName]
into #tempStudent
--UNION
--select '1' [StdID],'Shekhar2' [StdName]
UNION
select '4' [StdID],'Rohit' [StdName]
UNION
select '5' [StdID],'Basant' [StdName]

select * from #tempStudent

--########## End of table creation ###########

--[1] INNER JOIN
--This query will return all of the records in the left table that have a matching 
--record in the right table. 
SELECT A.EmpID,A.EmpName,B.StdID,B.StdName
FROM [#tempEmployee] A 
INNER JOIN [#tempStudent] B ON A.EmpID = B.StdID

--[2] LEFT JOIN
--This query will return all of the records in the Left table regardless if any of those records
--have a match in the Right table and it will also retuen any matching records from the Right table. 
SELECT A.EmpID,A.EmpName,B.StdID,B.StdName
FROM [#tempEmployee] A 
LEFT JOIN [#tempStudent] B ON A.EmpID = B.StdID

--[3] RIGHT JOIN
--This query will return all of the records in the Right table regardless if any of those records
--have a match in the Left table and it will also retuen any matching records from the Left table. 

SELECT A.EmpID,A.EmpName,B.StdID,B.StdName
FROM [#tempEmployee] A 
RIGHT JOIN [#tempStudent] B ON A.EmpID = B.StdID

--[4] OUTER JOIN
--This query will return all of the records from both tables.
SELECT A.EmpID,A.EmpName,B.StdID,B.StdName
FROM [#tempEmployee] A 
FULL OUTER JOIN [#tempStudent] B ON A.EmpID = B.StdID

--[5] LEFT JOIN EXCLUDING INNER JOIN
--This query will return all of the records in the left table that do not match any records in the right table.
SELECT A.EmpID,A.EmpName,B.StdID,B.StdName
FROM [#tempEmployee] A 
FULL OUTER JOIN [#tempStudent] B ON A.EmpID = B.StdID
where B.StdID IS NULL

--[6] RIGTH JOIN EXCLUDING INNER JOIN
--This query will return all of the records in the right table that do not match any records in the left table.
SELECT A.EmpID,A.EmpName,B.StdID,B.StdName
FROM [#tempEmployee] A 
FULL OUTER JOIN [#tempStudent] B ON A.EmpID = B.StdID
where A.EmpID IS NULL

--[6] OUTER JOIN EXCLUDING INNER JOIN
--This query will return all of the records in the left table and all of the records
--in the right talbe that do not match
SELECT A.EmpID,A.EmpName,B.StdID,B.StdName
FROM [#tempEmployee] A 
FULL OUTER JOIN [#tempStudent] B ON A.EmpID = B.StdID
where A.EmpID IS NULL OR B.StdID IS NULL

--[7] CROSS JOIN 
SELECT *
FROM [#tempEmployee] A 
CROSS JOIN [#tempStudent] B

--[8] SELF JOIN 

if OBJECT_ID('tempdb..#TCSEMPLOYEE') is not null
	drop table #TCSEMPLOYEE
	
CREATE TABLE #TCSEMPLOYEE
(
	ID INT NOT NULL PRIMARY KEY,
	NAME VARCHAR(200) NULL,
	DESIGNATION VARCHAR(100) NULL,
	SUPERID INT NULL
	--SUPERID INT FOREIGN KEY REFERENCES #TCSEMPLOYEE(ID) --In this table we have a Foreign key superid that
	--references its own primary key id, we will use it for self join
)

insert into #TCSEMPLOYEE(ID,NAME,DESIGNATION) values(1,'Shekhar','Manager')
insert into #TCSEMPLOYEE(ID,NAME,DESIGNATION,SUPERID) values(2,'Aditya','SE',1)
insert into #TCSEMPLOYEE(ID,NAME,DESIGNATION,SUPERID) values(3,'Rohit','SE',4)
insert into #TCSEMPLOYEE(ID,NAME,DESIGNATION) values(4,'Ramesh','Manager')

select * from #TCSEMPLOYEE

select A.ID,A.NAME,A.SUPERID ManagerID,B.NAME ManagerName from #TCSEMPLOYEE A
left join #TCSEMPLOYEE B on B.ID=A.SUPERID