use master

create database Academy
use Academy
create table Groups (
                        Id int identity (1,1) primary key, -- первичный ключ не может быть нулевым
                        Name nvarchar(10) not null unique check (len(name) > 0),
                        Rating int not null check (rating between 0 and 5),
                        Year int not null check (year between 0 and 5)
    )
create table Departments (
                             Id int identity (1,1) primary key,
                             Financing money not null default (0) check (financing > 0),
                             Name nvarchar(100) not null unique check (len(name) > 0),
)
create table Faculties (
                           Id int identity (1,1) primary key,
                           Name nvarchar(100) not null unique check (len(name) > 0)
)
create table Teachers (
                          Id int identity (1,1) primary key,
                          EmploymentDate date not null check (EmploymentDate > '1990-01-01'),
                          Name nvarchar(max) not null check (len(Name) > 0),
                          Premium money not null default 0 check (Premium >= 0),
                          Salary money not null check (Salary > 0),
                          Surname nvarchar(max) not null check (len(Surname) > 0),
)
