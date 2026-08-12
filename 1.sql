##advanced_queries some examples
  
Description: Identify professors teaching at least three course offerings.
SELECT
    p.empId,
    p.name,
    COUNT(t.courseId) AS courses_taught
FROM professor p
JOIN teaching t
ON p.empId = t.empId
GROUP BY p.empId, p.name
HAVING COUNT(t.courseId) >= 3
ORDER BY courses_taught DESC;

Description: Compare student population across departments.
SELECT
    d.name AS department,
    COUNT(s.rollNo) AS total_students
FROM department d
JOIN student s
ON d.deptId = s.deptNo
GROUP BY d.name
ORDER BY total_students DESC;

Description: Find students enrolled in a large number of courses.
SELECT
    s.rollNo,
    s.name,
    COUNT(e.courseId) AS enrolled_courses
FROM student s
JOIN enrollment e
ON s.rollNo = e.rollNo
GROUP BY s.rollNo, s.name
HAVING COUNT(e.courseId) >= 5
ORDER BY enrolled_courses DESC;


## Improved query performance using indexing strategies and EXPLAIN execution plan analysis in MySQL.

  Before Index : 
  EXPLAIN
SELECT *
FROM enrollment
WHERE courseId = '451';

create index : 
  CREATE INDEX idx_enrollment_course
ON enrollment(courseId);

after creating index : 
EXPLAIN
SELECT *
FROM enrollment
WHERE courseId = '451';

Composite Index Example : 
CREATE INDEX idx_teaching_course_sem
ON teaching(courseId, sem);

EXPLAIN
SELECT *
FROM teaching
WHERE courseId = '451'
AND sem = 'even';


### schema_reference.md

  
Student(rollNo, name, degree, year, sex, deptNo, advisor)

Professor(empId, name, sex, startYear, deptNo, phone)

Department(deptId, name, hod, phone)

Course(courseId, cname, credits, deptNo)

Enrollment(rollNo, courseId, sem, year, grade)

Teaching(empId, courseId, sem, year, classRoom)

Prerequisite(preReqCourse, courseId)