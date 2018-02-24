insert into dbo.tblEmployee1(EmpName) values('Raj')

print @@identity
print scope_identity()
print ident_current('dbo.tblEmployee1')

--set identity_insert dbo.tblEmployee1 on
--set identity_insert dbo.tblEmployee1 off

insert into dbo.tblEmployee2(EmpID,Salary) values(@@identity,5000)

select EMP1.*,EMP2.* from dbo.tblEmployee1 EMP1
inner join  dbo.tblEmployee2 EMP2 on EMP1.EmpID=EMP2.EmpID