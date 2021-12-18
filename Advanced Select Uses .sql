Select [FirstName],[LastName]  
From [Employees]
Where LastName='Rajput';


Select [FirstName],[LastName]
From [Employees]
Where LastName like '%k%';                                    --'%' is a wildcard



Select [FirstName],[LastName]
From [Employees]
Where LastName like 'j%';


Select [FirstName],[LastName]
From [Employees]
Where LastName like '%student';



Select [FirstName],[LastName],18 as [Age]                           //This will add a column of age also at the output. But, in actual its not present or saved in database
From [Employees]


Select * from Employees
Where id=15

