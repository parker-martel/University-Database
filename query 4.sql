SELECT C.Title, E.Grade
FROM Enrollment E, Section S, Course C 
WHERE E.Sec_num= S.Sec_num
AND C.Course_num = S.course_num
AND CWID_number = 99362748
