
create table Countries(
[Id] int primary key identity(1,1),
[Name] nvarchar(100) 
)

create procedure usp_Countries
@name nvarchar (100)

as
begin
 insert into Countries([Name])
 values (@name)
end

exec usp_Countries 'Ingiltere'

Select * from Countries


create table Cities(
[Id] int primary key identity(1,1),
[Name] nvarchar(255) ,
[CountryId] integer

foreign key ([CountryId]) references Countries(Id)

)

create procedure usp_Cities
@name nvarchar (100),
@countryId integer

as
begin
 insert into Cities([Name],[CountryId])
 values (@name,@countryId)
end

exec usp_Cities 'Sumqayit',1

select * from Cities




create table Departaments(
[Id] int primary key identity(1,1),
[Name] nvarchar(255)

)

create procedure usp_Departaments
@name nvarchar (255)

as
begin
 insert into Departaments([Name])
 values (@name)
end

exec usp_Departaments 'Satis'


create table StaffMembers(
[Id] int primary key identity(1,1),
[FullName] nvarchar(255) ,
[Age] integer,
[Salary] float,
[CityId] integer

foreign key ([CityId]) references Cities(Id)

)

create procedure usp_StaffMembers
@fullName nvarchar (100),
@age integer,
@salary float,
@cityId integer

as
begin
 insert into StaffMembers([FullName],[Age],[Salary],[CityId])
 values (@fullName,@age,@salary,@cityId)
end

exec usp_StaffMembers 'Fikret Amirov',42,450,1

select * from StaffMembers

create table Roles(
[Id] int primary key identity(1,1),
[Name] nvarchar(255),
[DepartamentId] integer

foreign key ([DepartamentId]) references Departaments(Id)
)

create procedure usp_Roles
@name nvarchar (255),
@departamentId integer

as
begin
 insert into Roles([Name],[DepartamentId])
 values (@name,@departamentId)
end

exec usp_Roles 'Huquqsunas',1

select * from Roles

create table RoleStaffMemmbers(
[Id] int primary key identity(1,1),
[RoleId] integer,
[StaffMemberId] integer

foreign key ([RoleId]) references Roles(Id),

foreign key ([StaffMemberId]) references StaffMembers(Id)

)

create procedure usp_RoleStaffMemmbers
@roleId integer,
@staffMemberId integer

as
begin
 insert into RoleStaffMemmbers([RoleId],[StaffMemberId])
 values (@roleId,@staffMemberId)
end

exec usp_RoleStaffMemmbers 4,1

create table Students(
[Id] int primary key identity(1,1),
[Name] nvarchar(255) ,
[Surname] nvarchar(255) ,
[Adress] nvarchar(255) ,
[Age] integer,
[Email] nvarchar(255),
[CityId] integer

foreign key ([CityId]) references Cities(Id)

)

create procedure usp_Students
@name nvarchar (255),
@surname nvarchar (255),
@adress nvarchar (255),
@age integer,
@email nvarchar (255),
@cityId integer

as
begin
 insert into Students([Name],[Surname],[Adress],[Age],[Email],[CityId])
 values (@name,@surname,@adress,@age,@email,@cityId)
end


exec usp_Students 'Huseyn','Huseynov','Xocasen',21,'huseyn@mail.ru',1

select * from Students


create table Education(
[Id] int primary key identity(1,1),
[Name] nvarchar(255) ,

)

create procedure usp_Education
@name nvarchar (255)

as
begin
 insert into Education([Name])
 values (@name)
end

exec usp_Education 'CyberSec'

select * from Education


create table Rooms(
[Id] int primary key identity(1,1),
[Name] nvarchar(255) ,
Capacity int check (Capacity>=18)

)

create procedure usp_Rooms
@name nvarchar (255),
@capacity int 

as
begin
 insert into Rooms([Name],[Capacity])
 values (@name,@capacity)
end

exec usp_Rooms 'Fortune',22

select * from Rooms

create table Groups(
[Id] int primary key identity(1,1),
[Name] nvarchar(255) ,
[Capacity] integer,
[RoomId] integer,
[EducationId] integer

foreign key ([RoomId]) references Rooms(Id),
foreign key ([EducationId]) references Education(Id)
)

create procedure usp_Groups
@name nvarchar (255),
@capacity integer,
@roomId integer,
@educationId integer

as
begin
 insert into Groups([Name],[Capacity],[RoomId],[EducationId])
 values (@name,@capacity,@roomId ,@educationId)
end


exec usp_Groups 'PB101',20,1,1

select * from Groups

create table Teachers(
[Id] int primary key identity(1,1),
[FullName] nvarchar(255) ,
[Salary] float ,
[Adress] nvarchar(255) ,
[Email] nvarchar(255),

)

create procedure usp_Teachers
@fullName nvarchar (255),
@salary float,
@adress nvarchar (255),
@email nvarchar (255)
as
begin
 insert into Teachers([FullName],[Salary],[Adress],[Email])
 values (@fullName,@salary,@adress,@email)
end


exec usp_Teachers 'Cavid Bashirov',11000,'Ehmedli','cavid@mail.ru'

select * from Teachers

create table GroupTeachers(
[Id] int primary key identity(1,1),
[GroupId] integer,
[TeacherId] integer

foreign key ([GroupId]) references Groups(Id),
foreign key ([TeacherId]) references Teachers(Id)
)

create procedure usp_GroupTeachers
@groupId integer,
@teacherId integer
as
begin
 insert into GroupTeachers([GroupId],[TeacherId])
 values (@groupId,@teacherId)
end


exec usp_GroupTeachers 1,1

select * from GroupTeachers

create table StudentGroups(
[Id] int primary key identity(1,1),
[GroupId] integer,
[StudentId] integer

foreign key ([GroupId]) references Groups(Id),
foreign key ([StudentId]) references Students(Id)
)

create procedure usp_StudentGroups
@groupId integer,
@studentId integer
as
begin
 insert into StudentGroups([GroupId],[StudentId])
 values (@groupId,@studentId)
end

exec usp_StudentGroups 1,1

Select * from Cities
Select * from Countries
Select * from Departaments
Select * from Education
Select * from Groups
Select * from GroupTeachers
Select * from Roles
Select * from RoleStaffMemmbers
Select * from Rooms
Select * from StaffMembers
Select * from StudentGroups
Select * from Students
Select * from Teachers


--select
--c.[Name] as 'City',
--cr.[Name] as 'Country'

--from Cities c
--join Countries cr
--on
--cr.Id=c.CountryId

--SELECT DISTINCT name FROM Countries

--SELECT * FROM StaffMembers
--ORDER BY [FullName] ASC, [Age],[Salary];

--SELECT * FROM StaffMembers
--ORDER BY [FullName] DESC, [Age],[Salary];



--select COUNT(*)as 'StaffMember count',Age
--FROM StaffMembers
--GROUP BY Age;
