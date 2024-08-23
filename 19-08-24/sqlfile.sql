use Academy
go

select * from teachers, [group]
go

select faculties.name from faculties
    join departments on faculties.id = departments.facultyId
        where faculties.financing < departments.financing
go

select curators.surname, [group].name from groupsCurators
    join [group] on groupsCurators.groupId = [group].id
    join curators on curators.id = groupsCurators.curatorId
go

select curators.name, curators.surname from groupsCurators
    join dbo.curators on curators.id = groupsCurators.curatorId
    join dbo.[group] on [group].id = groupsCurators.groupId
    where [group].name='P107'
go

select teachers.surname, [group].name from groupsLectures
    join [group] on groupsLectures.groupId = [group].id
    join lectures on groupsLectures.lectureId = lectures.id
    join teachers on lectures.teacherId = teachers.id
go

select departments.name, [group].name from [group]
    join departments on [group].departamentId = departments.id
go

select subjects.name from lectures
    join subjects on lectures.subjectId = subjects.id
    join teachers on lectures.teacherId = teachers.id
where teachers.name = 'Samantha Adams'
go

select departments.name from groupsLectures
    join [group] on groupsLectures.groupId = [group].id
    join departments on [group].departamentId = departments.id
    join lectures on groupsLectures.lectureId = lectures.id
    join subjects on lectures.subjectId = subjects.id
where subjects.name = 'Database Theory'
go

select [group].name from [group]
    join departments on [group].departamentId = departments.id
    join faculties on departments.facultyId = faculties.id
where departments.name = 'Computer Science'
go

select [group].name, faculties.name from [group]
    join departments on [group].departamentId = departments.id
    join faculties on departments.facultyId = faculties.id
where [group].year = 5
go

select teachers.name, teachers.surname, subjects.name, [group].name from groupsLectures
    join [group] on groupsLectures.groupId = [group].id
    join lectures on groupsLectures.lectureId = lectures.id
    join teachers on lectures.teacherId = teachers.id
    join subjects on lectures.subjectId = subjects.id
where lectures.lectureRoom = 'B103'
go