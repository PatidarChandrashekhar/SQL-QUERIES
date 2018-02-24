--########## Start of table creation ###########
if OBJECT_ID('tempdb..#tempStudentDetails') is not null
	drop table #tempStudentDetails

Create table #tempStudentDetails
(
	StudentID integer primary key,
	StudentName varchar(100)
)	

insert into #tempStudentDetails values(1,'Shekhar')
insert into #tempStudentDetails values(2,'Mahesh')
insert into #tempStudentDetails values(3,'Mahesh')
insert into #tempStudentDetails values(4,'Aditya')
insert into #tempStudentDetails values(5,'Anjali')

select * from #tempStudentDetails

if OBJECT_ID('tempdb..#tempStudentTotalMarks') is not null
	drop table #tempStudentTotalMarks

Create table #tempStudentTotalMarks
(
	StudentID int references #tempStudentDetails,
	StudentMarks int
)	

insert into #tempStudentTotalMarks values(1,200)
insert into #tempStudentTotalMarks values(2,300)
insert into #tempStudentTotalMarks values(3,400)
insert into #tempStudentTotalMarks values(4,500)

select * from #tempStudentTotalMarks
--############################################

MERGE #tempStudentTotalMarks AS STM
USING (select StudentID,StudentName from #tempStudentDetails) as SD
	on STM.StudentID=SD.StudentID
WHEN MATCHED AND STM.StudentMarks>500 THEN DELETE
WHEN MATCHED THEN UPDATE SET STM.StudentMarks=STM.StudentMarks+25
WHEN NOT MATCHED THEN
 INSERT(StudentID,StudentMarks) values(SD.StudentID,25);
 GO

--#############################################
select * from #tempStudentDetails
select * from #tempStudentTotalMarks