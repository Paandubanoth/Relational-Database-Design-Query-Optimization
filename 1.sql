q1 ==> Plain English Description: Find the names and roll numbers of students who have enrolled in every single course offered by their advisor's department, 
provided that the student's home department is strictly different from their advisor's department.

   SELECT s.name, s.rollNo
FROM student s, professor p
WHERE s.advisor = p.empId AND s.deptNo <> p.deptNo
AND NOT EXISTS (
    SELECT c.courseId
    FROM course c
    WHERE c.deptNo = p.deptNo
    AND NOT EXISTS (
        SELECT e.courseId
        FROM enrollment e
        WHERE e.rollNo = s.rollNo AND e.courseId = c.courseId
    )
);

q2 ==> 