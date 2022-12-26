SELECT Grade, COUNT(Grade)

FROM Course c, Section s, Enrollment e
WHERE c.Course_num = s.course_num 
AND s.Sec_num = e.Sec_num
GROUP BY Grade
