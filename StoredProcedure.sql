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
