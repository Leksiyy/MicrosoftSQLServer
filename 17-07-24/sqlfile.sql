use Academy

select * from Departments order by id desc
go

select Name as GropName, Rating as GropRating from Groups
go

select Name, (Teachers.Salary / Teachers.Premium) as Salary_to_Premium, (Teachers.Salary / (Teachers.Salary + Teachers.Premium)) * 100 AS salary_percentage from Teachers
go

select concat('The dean of faculty ', Faculties.Name, ' is ', Faculties.Dean, '.') as faculty_info
from Faculties;
go

select Surname from Teachers where IsProfessor=1 and Salary > 1050;
go

select Name from Departments where Financing<11000 and Financing>25000;
go

select Name from Faculties where Name<>'Computer Science';
go

select Surname, Position from Teachers where IsProfessor<>1;
go

select Surname, Position, Salary, Premium from Teachers where IsAssistant=1 and Premium>160 and Premium<550;
go

select Surname, Salary from Teachers where IsAssistant=1;
go

select Surname, Position from Teachers where EmploymentDate<'2000-01-01'
go

select Name as 'Name of Department' from Departments where Name<'Software Development' order by Name;
go

select Surname from Teachers where IsAssistant=1 and Salary+Premium<1200
go

select Name from Groups where Year=5 and Rating>2 and Rating<4;
go

select Surname from Teachers where IsAssistant=1 and (Salary<550 or Premium<220)