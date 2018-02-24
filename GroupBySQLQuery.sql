--########## Start of table creation ###########
if OBJECT_ID('tempdb..#tempStudentMarks') is not null
	drop table #tempStudentMarks
	
select '1' [RollNumber],'Shekhar' [Name],'Maths' [Subject],95 [Marks]
into #tempStudentMarks
UNION
select '1' [RollNumber],'Shekhar' [Name],'Physics' [Subject],90 [Marks]
UNION 
select '1' [RollNumber],'Shekhar' [Name],'Chemistry' [Subject],85 [Marks]
UNION
select '2' [RollNumber],'Ramesh' [Name],'Maths' [Subject],75 [Marks]
UNION
select '2' [RollNumber],'Ramesh' [Name],'Physics' [Subject],70 [Marks]
UNION
select '2' [RollNumber],'Ramesh' [Name],'Chemistry' [Subject],65 [Marks]
UNION
select '3' [RollNumber],'Aditya' [Name],'Maths' [Subject],78 [Marks]
UNION
select '3' [RollNumber],'Aditya' [Name],'Physics' [Subject],70 [Marks]
UNION
select '3' [RollNumber],'Aditya' [Name],'Chemistry' [Subject],70 [Marks]

select * from #tempStudentMarks

--##################################
--Group by clause without where condition
select Name,SUM(Marks) as TotalMarks 
from #tempStudentMarks
group by Name
---------------------------------
--Group by clause with where condition
select Name,SUM(Marks) as TotalMarks 
from #tempStudentMarks
where Name='Shekhar'
group by Name
---------------------------------
--Group by clause to find max marks in subject
select Name,MAX(Marks) as MaxMarksInSubject 
from #tempStudentMarks
group by Name
---------------------------------
--Having clause without where condition
select Name,SUM(Marks) as 'Students score > 210' 
from #tempStudentMarks
group by Name
having SUM(Marks)>210
---------------------------------
--Having clause with where condition
select Name,SUM(Marks) as 'Students score > 100' 
from #tempStudentMarks
where RollNumber between 1 and 2
group by Name
having SUM(Marks)>100
---------------------------------