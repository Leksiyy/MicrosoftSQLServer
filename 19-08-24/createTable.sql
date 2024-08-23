use master
drop database Academy
create database Academy
use Academy
go

create table curators (
    id int identity (1,1) not null primary key ,
    name nvarchar(max) not null check(len(name)>0),
    surname nvarchar(max) not null check(len(surname)>0)
)
create table faculties (
    id int identity (1,1) not null primary key ,
    financing money not null check(financing>=0) default 0,
    name nvarchar(100) not null check(len(name)>0) unique ,
)
create table departments (
    id int identity (1,1) not null primary key ,
    financing money not null check(financing>=0) default 0,
    name nvarchar(100) not null check(len(name)>0) unique ,
    facultyId int not null,
    foreign key (facultyId) references faculties (id),
)
create table [group] (
    id int identity (1,1) not null primary key ,
    name nvarchar(10) not null check(len(name)>0) unique ,
    year int not null check(year between 1 and 5) ,
    departamentId int not null ,
    foreign key (departamentId) references departments (id),
)
create table groupsCurators (
    id int identity (1,1) not null primary key ,
    curatorId int not null ,
    groupId int not null ,
    foreign key (curatorId) references curators (id),
    foreign key (groupId) references [group] (id),
)
create table subjects (
                          id int identity (1,1) not null primary key ,
                          name nvarchar(100) not null check(len(name)>0) unique ,
)
create table teachers (
                          id int identity (1,1) not null primary key ,
                          name nvarchar(max) not null check(len(name)>0),
                          salary money not null check(salary>0),
                          surname nvarchar(max) not null check(len(surname)>0)
)
create table lectures(
     id int identity (1,1) not null primary key ,
     lectureRoom nvarchar(max) not null check(len(lectureRoom)>0),
     subjectId int not null ,
     teacherId int not null ,
     foreign key (subjectId) references subjects (id),
     foreign key (teacherId) references teachers (id),
)
create table groupsLectures (
    id int identity (1,1) not null primary key ,
    groupId int not null ,
    lectureId int not null ,
    foreign key (groupId) references [group] (id),
    foreign key (lectureId) references lectures (id),
)
