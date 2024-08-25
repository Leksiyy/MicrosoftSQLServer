select count(*) from Teachers;
go

select count(S.name) from Lectures
    join dbo.Subjects S on Lectures.SubjectId = S.Id
    join dbo.Teachers T on Lectures.TeacherId = T.Id
                     where T.name = 'DaveMcQueen';
go

select count(S.name) from Lectures
    join dbo.Subjects S on Lectures.SubjectId = S.Id
                     where LectureRoom = 'D201';
go

select LectureRoom, count(S.name) from Lectures
    join dbo.Subjects S on Lectures.SubjectId = S.Id
group by LectureRoom;
go

CREATE TABLE Students
(
    Id       INT IDENTITY PRIMARY KEY,
    Name     NVARCHAR(100) NOT NULL,
    Surname  NVARCHAR(100) NOT NULL,
    GroupId  INT NOT NULL FOREIGN KEY REFERENCES Groups(Id)
);
go

select count(S.Id) as TotalStudents
from Students as S
         join Groups as G on S.GroupId = G.Id
         join GroupsLectures as GL on G.Id = GL.GroupId
         join Lectures as L on GL.LectureId = L.Id
         join Teachers as T on L.TeacherId = T.Id
where T.Name = 'Jack' and T.Surname = 'Underhill';


select avg(T.Salary) from GroupsLectures
    join dbo.Lectures L on L.Id = GroupsLectures.LectureId
    join dbo.Teachers T on L.TeacherId = T.Id
    join dbo.Groups G on G.Id = GroupsLectures.GroupId
    join dbo.Departments D on D.Id = G.DepartmentId
    join dbo.Faculties F on D.FacultyId = F.Id
                     where F.Name = 'Computer Science';
go

select min(StudentCount), max(StudentCount)
from (select count(*) as StudentCount from Students group by GroupId) as SSC

select avg(Financing) from Departments;
go

select T.Name, T.surname, count(S.name)from Lectures
    join dbo.Subjects S on S.Id = Lectures.SubjectId
    join dbo.Teachers T on T.Id = Lectures.TeacherId
group by T.Name, T.Surname;
go

select DayOfWeek, count(*) from GroupsLectures group by DayOfWeek

select LectureRoom, count(D.Name) from GroupsLectures
    join dbo.Lectures L on L.Id = GroupsLectures.LectureId
    join dbo.Subjects S on S.Id = L.SubjectId
    join dbo.Groups G on G.Id = GroupsLectures.GroupId
    join dbo.Departments D on D.Id = G.DepartmentId
group by LectureRoom
    having count(D.Name) > 0;
go

select F.Name, count(S.Name) from GroupsLectures as GP
    join dbo.Lectures L on L.Id = GP.LectureId
    join dbo.Subjects S on S.Id = L.SubjectId
    join dbo.Groups G on G.Id = GP.GroupId
    join dbo.Departments D on D.Id = G.DepartmentId
    join dbo.Faculties F on F.Id = D.FacultyId
group by F.Name
    having count(S.Name) > 0;
go

select T.Name, Surname, LectureRoom, count(S.Name) from Lectures as L
    join Subjects as S on L.SubjectId = S.Id
    join Teachers as T on L.TeacherId = T.Id
group by T.Name, Surname, LectureRoom
    having count(S.Name) > 0;
go