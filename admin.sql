use [master];
go

if db_id('Academy') is not null
    begin
        drop database [Academy];
    end
go

create database [Academy];
go

use [Academy];
go

use [master];
go

if db_id('Academy') is not null
    begin
        drop database [Academy];
    end
go

create database [Academy];
go

use [Academy];
go

create table [Assistants]
(
    [Id] int not null identity(1, 1) primary key,
    [TeacherId] int not null
);
go

create table [Curators]
(
    [Id] int not null identity(1, 1) primary key,
    [TeacherId] int not null
);
go

create table [Deans]
(
    [Id] int not null identity(1, 1) primary key,
    [TeacherId] int not null
);
go

create table [Departments]
(
    [Id] int not null identity(1, 1) primary key,
    [Building] int not null check ([Building] between 1 and 5),
    [Name] nvarchar(100) not null unique check ([Name] <> N''),
    [FacultyId] int not null,
    [HeadId] int not null
);
go

create table [Faculties]
(
    [Id] int not null identity(1, 1) primary key,
    [Building] int not null check ([Building] between 1 and 5),
    [Name] nvarchar(100) not null unique check ([Name] <> N''),
    [DeanId] int not null
);
go

create table [Groups]
(
    [Id] int not null identity(1, 1) primary key,
    [Name] nvarchar(10) not null unique check ([Name] <> N''),
    [Year] int not null check ([Year] between 1 and 5),
    [DepartmentId] int not null
);
go

create table [GroupsCurators]
(
    [Id] int not null identity(1, 1) primary key,
    [CuratorId] int not null,
    [GroupId] int not null
);
go

create table [GroupsLectures]
(
    [Id] int not null identity(1, 1) primary key,
    [GroupId] int not null,
    [LectureId] int not null
);
go

create table [Heads]
(
    [Id] int not null identity(1, 1) primary key,
    [TeacherId] int not null
);
go

create table [LectureRooms]
(
    [Id] int not null identity(1, 1) primary key,
    [Building] int not null check ([Building] between 1 and 5),
    [Name] nvarchar(10) not null unique check ([Name] <> N'')
);
go

create table [Lectures]
(
    [Id] int not null identity(1, 1) primary key,
    [SubjectId] int not null,
    [TeacherId] int not null
);
go

create table [Schedules]
(
    [Id] int not null identity(1, 1) primary key,
    [Class] int not null check ([Class] between 1 and 8),
    [DayOfWeek] int not null check ([DayOfWeek] between 1 and 7),
    [Week] int not null check ([Week] between 1 and 52),
    [LectureId] int not null,
    [LectureRoomId] int not null
);
go

create table [Subjects]
(
    [Id] int not null identity(1, 1) primary key,
    [Name] nvarchar(100) not null unique check ([Name] <> N'')
);
go

create table [Teachers]
(
    [Id] int not null identity(1, 1) primary key,
    [Name] nvarchar(max) not null check ([Name] <> N''),
    [Surname] nvarchar(max) not null check ([Surname] <> N'')
);
go

alter table [Assistants]
    add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Curators]
    add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Deans]
    add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Departments]
    add foreign key ([FacultyId]) references [Faculties]([Id]);
go

alter table [Departments]
    add foreign key ([HeadId]) references [Heads]([Id]);
go

alter table [Faculties]
    add foreign key ([DeanId]) references [Deans]([Id]);
go

alter table [Groups]
    add foreign key ([DepartmentId]) references [Departments]([Id]);
go

alter table [GroupsCurators]
    add foreign key ([CuratorId]) references [Curators]([Id]);
go

alter table [GroupsCurators]
    add foreign key ([GroupId]) references [Groups]([Id]);
go

alter table [GroupsLectures]
    add foreign key ([GroupId]) references [Groups]([Id]);
go

alter table [GroupsLectures]
    add foreign key ([LectureId]) references [Lectures]([Id]);
go

alter table [Heads]
    add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Lectures]
    add foreign key ([SubjectId]) references [Subjects]([Id]);
go

alter table [Lectures]
    add foreign key ([TeacherId]) references [Teachers]([Id]);
go

alter table [Schedules]
    add foreign key ([LectureId]) references [Lectures]([Id]);
go

alter table [Schedules]
    add foreign key ([LectureRoomId]) references [LectureRooms]([Id]);
go