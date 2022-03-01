use EntranceSystem                        --For creating table in given database 
create table Employees(
	ID int primary key identity(1,1) not null,
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null,
	Department nvarchar(50) not null,
	DateOfJoining datetime,
	BasicPay float not null,
);
