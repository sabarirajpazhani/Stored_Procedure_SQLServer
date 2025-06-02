--creating the Stored Procedure without using the parameters
create procedure spDisplaySentence
as
begin 
	print 'Hello Imperio CSE'
end

--call the stored procedure
exec spDisplaySentence;