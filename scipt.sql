USE university;

SELECT idprofessors, professors_name, AVG(grades_grade_id)
FROM grades
INNER JOIN professors
ON grades.grades_professor_id = professors.idprofessors
GROUP BY grades_professor_id;

SELECT idstudents, student_name, MAX(grades_grade_id)
FROM grades
INNER JOIN students
ON grades.grades_student_id = students.idstudents
GROUP BY grades_student_id;

select course_name, student_name
from courses
inner join students
on courses.course_student_id = students.idstudents
group by course_student_id;

SELECT course_name, AVG(grades_grade_id) avg_course_grade
FROM courses
INNER JOIN grades
ON grades.grades_course_id = courses.idcourses
group by grades_course_id
order by avg_course_grade ASC;

select course_name, student_name, professors_name
from courses
join students
on courses.course_student_id = students.idstudents
join professors
on professors.idprofessors = courses.course_professor_id
order by courses.idcourses;
