select S.Sec_num, S.Classroom, S.meeting_days, S.beg_time, Count(E.CWID_number) 
from Section S , Enrollment E
where E.Sec_num = S.Sec_num
and S.course_num=5893
GROUP BY S.Sec_num