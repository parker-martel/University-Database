<?php
$link = mysqli_connect('mariadb', 'cs332t22', '1MgogJBu', 'cs332t22');
//if connection is not successful you will see text error
if (!$link) {
       die("Connect failed\n");
}
//if connection is successfully you will see message below


// exmaple 99362748
$result = $link->query("SELECT C.Title, E.Grade FROM Enrollment E, Section S, Course C WHERE E.Sec_num= S.Sec_num AND C.Course_num = S.course_num AND CWID_number ="  . $_POST["cno"],$conn);
 $nor=$result->num_rows;
 for($i=0; $i<$nor; $i++) {
 $row=$result->fetch_assoc();
 echo "Title: ", $row["Title"], "<br>";
 echo "Grade: ", $row["Grade"], "<br>";
 }
 $result->free_result();
 $link->close();
 
?>