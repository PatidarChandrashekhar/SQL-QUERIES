
BEGIN TRY

	declare @num int,@msg varchar(200)
	
	set @num = 5/0;
	print'This will not execute'

END TRY

BEGIN CATCH
	print 'Error occured that is: '
	--set @msg=(select ERROR_MESSAGE())
	--print @msg;
	select ERROR_NUMBER() as ERRORNUMBER,
	ERROR_SEVERITY() as ERRORSEVERITY,
	ERROR_STATE() as ERRORSTATE,
	ERROR_PROCEDURE() as ERRORPROCEDURE,
	ERROR_LINE() as ERRORLINE,
	ERROR_MESSAGE() as ERRORMESSAGE
	
END CATCH