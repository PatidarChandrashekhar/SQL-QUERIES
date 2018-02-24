if OBJECT_ID('tempdb..#tempEmployee') is not null
	drop table #tempEmployee
	
select 'A' [Class],80 [Marks],'Shekhar' [Name]
into #tempEmployee
UNION
select 'A' [Class],70 [Marks],'Ramesh' [Name]
UNION
select 'A' [Class],70 [Marks],'Mohit' [Name]
UNION
select 'A' [Class],90 [Marks],'Mukesh' [Name]
UNION
select 'A' [Class],90 [Marks],'Anjali' [Name]
UNION
select 'A' [Class],100 [Marks],'Shyam' [Name]

select * from #tempEmployee

select Marks,Name,ROW_NUMBER() over(order by Marks desc) as [ROW_NUMBER],
	RANK() over(order by Marks desc) as [RANK],
	DENSE_RANK() over(order by Marks desc) as [DENSE_RANK],
	NTILE(3) over(order by Marks desc) as [NTILE]

from #tempEmployee