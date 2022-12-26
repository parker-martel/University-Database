<?php
$link = mysqli_connect('mariadb', 'cs332t22', '1MgogJBu', 'cs332t22');
//if connection is not successful you will see text error
if (!$link) {
       die("Connect failed\n");
}
//if connection is successfully you will see message below


//example course number - 5745
//example section number - 45
$course = $_POST["Course"];
$section = $_POST["Section"];
$result = $link->query("SELECT e.Grade, COUNT(Grade) AS 'letter' FROM Course c, Section s, Enrollment e WHERE c.Course_num = $course AND s.Sec_num = $section AND c.Course_num = s.course_num AND s.Sec_num = e.Sec_num GROUP BY e.Grade",$conn);
 $nor=$result->num_rows;
 for($i=0; $i<$nor; $i++) {
 $row=$result->fetch_assoc();
 echo "Grade: ", $row["Grade"], "<br>";
 echo "Amount of that grade: ", $row["letter"], "<br>";
 echo "<br>";
 }
 $result->free_result();
 $link->close();
 
?>