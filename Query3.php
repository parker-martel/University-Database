<?php
$link = mysqli_connect('mariadb', 'cs332t22', '1MgogJBu', 'cs332t22');
//if connection is not successful you will see text error
if (!$link) {
       die("Connect failed\n");
}
//if connection is successfully you will see message below


// exmaple 2847874
$professor = $_POST["cno"];
$result = $link->query("SELECT s.Classroom, s.meeting_days, s.beg_time, s.end_time FROM Professor p, Section s WHERE p.SSN = s.SSN AND p.SSN=$professor",$conn);
 $nor=$result->num_rows;
 for($i=0; $i<$nor; $i++) {
 $row=$result->fetch_assoc();
 echo "Classroom: ", $row["Classroom"], "<br>";
 echo "meeting days: ", $row["meeting_days"], "<br>";
 echo "beg time: ", $row["beg_time"], "<br>";
 echo "end time: ", $row["end_time"], "<br>";
 echo "<br>";
 }
 $result->free_result();
 $link->close();
 
?>