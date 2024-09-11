use master
create database IceCream

create table IceCream (
    ID int primary key,
    Name nvarchar(255),
    Price decimal(10, 2),
    StockQuantity int
);

create table Orders (
    ID int primary key,
    OrderDate datetime,
    Quantity int,
    TotalCost decimal(10, 2)
);

create table IstoriyaZamovlennya (
    ID int primary key,
    OrderID int,
    IceCreamID int,
    Quantity int,
    foreign key (OrderID) references Orders(ID),
    foreign key (IceCreamID) references IceCream(ID)
);

create table OrderLogs ( -- новая таблица для третьего тригера
    ID int identity(1,1) primary key ,
    OrderID int,
    OrderDate datetime,
    TotalCost decimal(10, 2),
    LogDate datetime default getdate()
);
