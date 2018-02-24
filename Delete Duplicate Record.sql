;WITH DUPLICATE as (
  SELECT ID,Name,Salary,ROW_NUMBER()over( partition by ID order by ID) as NumOfDups
  FROM [Patidar].[dbo].[tblEmployee]) 
  
 select * from DUPLICATE where NumOfDups>1