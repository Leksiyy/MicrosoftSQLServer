-- 1. Вивести назви аудиторій, де читає лекції викладач “Edward Hopper”.
-- 2. Вивести прізвища асистентів, які читають лекції у групі “F505”.
-- 3. Вивести дисципліни, які читає викладач “Alex Carmack” для груп 5 курсу.
-- 4. Вивести прізвища викладачів, які не читають лекції у по- неділок.
-- 5. Вивестиназвиаудиторій,іззазначеннямїхкорпусів,уяких немає лекцій у середу другого тижня на третій парі.
-- 6. Вивестиповнііменавикладачівфакультету“ComputerScience”, які не курирують групи кафедри “Software Development”.
-- 7. Вивести список номерів усіх корпусів, які є у таблицях факультетів, кафедр та аудиторій.
-- 8. Вивести повні імена викладачів у такому порядку: дека- ни факультетів, завідувачі кафедр, викладачі, куратори, асистенти.
-- 9. Вивести дні тижня (без повторень), в які є заняття в ауди- торіях «A311» та «A104» корпусу.

use Academy

-- 1
select lr.name
from schedules s
         join lectures l on s.lectureid = l.id
         join teachers t on l.teacherid = t.id
         join lecturerooms lr on s.lectureroomid = lr.id
where t.name = 'Edward' and t.surname = 'Hopper';

-- 2
select t.surname
from groupslectures gl
         join lectures l on gl.lectureid = l.id
         join teachers t on l.teacherid = t.id
         join assistants a on a.teacherid = t.id
         join groups g on gl.groupid = g.id
where g.name = 'F505';

-- 3
select s.name
from lectures l
         join subjects s on l.subjectid = s.id
         join teachers t on l.teacherid = t.id
         join groupslectures gl on l.id = gl.lectureid
         join groups g on gl.groupid = g.id
where t.name = 'Alex' and t.surname = 'Carmack' and g.year = 5;

-- 4
select distinct t.surname
from teachers t
where t.id not in (
    select l.teacherid
    from lectures l
             join schedules s on l.id = s.lectureid
    where s.dayofweek = 1
);

-- 5
select lr.name, lr.building
from lecturerooms lr
where lr.id not in (
    select s.lectureroomid
    from schedules s
    where s.dayofweek = 3 and s.week = 2 and s.class = 3
);

-- 6
select t.name, t.surname
from teachers t
         join departments d on d.headid = t.id
         join faculties f on d.facultyid = f.id
where f.name = 'Computer Science'
  and t.id not in (
    select gc.curatorid
    from groupscurators gc
             join groups g on gc.groupid = g.id
             join departments d on g.departmentid = d.id
    where d.name = 'Software Development'
);

-- 7
select distinct building
from (
         select building from faculties
         union
         select building from departments
         union
         select building from lecturerooms
     ) as buildings;

-- 8
select t.name, t.surname
from deans d
         join teachers t on d.teacherid = t.id
union all
select t.name, t.surname
from heads h
         join teachers t on h.teacherid = t.id
union all
select t.name, t.surname
from curators c
         join teachers t on c.teacherid = t.id
union all
select t.name, t.surname
from assistants a
         join teachers t on a.teacherid = t.id;

-- 9
select distinct s.dayofweek
from schedules s
         join lecturerooms lr on s.lectureroomid = lr.id
where lr.name in ('A311', 'A104');
