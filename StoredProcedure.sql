--creating the Stored Procedure without using the parameters
create procedure spDisplaySentence
as
begin 
	print 'Hello Imperio CSE'
end

--call the stored procedure
exec spDisplaySentence;

-- Create Employee Table
CREATE TABLE Employee
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(50),
  DOB DATETIME,
  DeptID INT
)
GO
-- Populate the Employee Table with test data
INSERT INTO Employee VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 1)
INSERT INTO Employee VALUES(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 2)
INSERT INTO Employee VALUES(3, 'Anurag', 'Male','1995-04-19 10:53:27.060', 2)
INSERT INTO Employee VALUES(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 3)
INSERT INTO Employee VALUES(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 1)
INSERT INTO Employee VALUES(6, 'Hina', 'Female','1995-07-12 10:53:27.060', 2)
GO

--creatig the stored Procedure to display the Name, Gender and DOG of the employee from the employee table using SELECT statement
create procedure spGetEmployee
as
begin
	select Name, Gender, DOB from Employee
end

--Execute Procedure
exec spGetEmployee

sp_helptext spGetEmployee

--How to change the body of the Procedure
alter procedure spGetEmployee
as
begin
	select Name,Gender, DOB from Employee
end

exec spGetEmployee

--How to change the Procedure Name
exec sp_rename 'spGetEmployee' , 'spGetEmployee1'

exec spGetEmployee1



--Adding Two variable
create procedure spAddTwoNumbers
	@no1 int,
	@no2 int
as 
begin
	declare @Result int
	set @Result = @no1 + @no2
	print 'Result is '+cast(@Result as varchar)
end

alter procedure spAddTwoNumbers (@no1 int, @no2 int)
as
begin
	declare @Result int
	set @Result = @no1 + @no2
	print 'Result is '+ cast(@Result as varchar)
end

exec spAddTwoNumbers 20, 30

--Create a procedure that will count the total number of employees in the Employee table using the output parameter.
create procedure spGetTotalCount
	@TotalCount int output
as 
begin
	select @TotalCount = Count(ID) from Employee
end

declare @EmployeeCount int
execute spGetTotalCount @EmployeeCount output
print @EmployeeCount


--Create a procedure that will count the total number of employees in the Employee table using return status.
create procedure spGetTotalCount1
as
begin
	return (select count(ID) from Employee)
end

declare @EmployeeCount1 int
execute @EmployeeCount1 = spGetTotalCount1
print @EmployeeCount1

--Create a procedure that will take the id value of an employee and return the name of that employee using the output parameter.
create Procedure spGetEmployeeNameByID 
	@ID int,
	@Name varchar(40) output
as 
begin
	select @Name = Name From Employee 
	where ID = @ID
end

declare @EmployeeName varchar(40)
execute spGetEmployeeNameByID 3, @EmployeeName output
print @EmployeeName

--Create a procedure that will take the id value of an employee and return the name of that employee using the Status value
create procedure spGetEmployeeByID
	@ID int
as
begin
	return(select Name from Employee where ID = @ID)
end

declare @EmployeeName varchar(30)
execute @EmployeeName = spGetEmployeeByID
print @EmployeeName


sp_help Employee
Select * from syscomments

