<?php
$link = mysqli_connect('mariadb', 'cs332t22', '1MgogJBu', 'cs332t22');
//if connection is not successful you will see text error
if (!$link) {
       die("Connect failed\n");
}
//if connection is successfully you will see message below


// exmaple 5893
$result = $link->query("SELECT S.Sec_num, S.Classroom, S.meeting_days, S.beg_time, Count(E.CWID_number) AS 'count' FROM Section S , Enrollment E WHERE E.Sec_num = S.Sec_num AND S.course_num="  . $_POST["pno"],$conn);
 $nor=$result->num_rows;
 for($i=0; $i<$nor; $i++) {
 $row=$result->fetch_assoc();
 echo "Section number: ", $row["Sec_num"], "<br>";
 echo "Classroom: ", $row["Classroom"], "<br>";
 echo "meeting days: ", $row["meeting_days"], "<br>";
 echo "beginning time: ", $row["beg_time"], "<br>";
 echo "amount of students: ", $row["count"];

 }
 $result->free_result();
 $link->close();
 
?>