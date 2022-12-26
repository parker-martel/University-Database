<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  

<style>
h1 {text-align: center;}
h5 {text-align: center;}
</style>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>



<h1 style="font-family:verdana; padding-top: 10px">University Database</h1>
<h5 style="font-family:verdana;">Maintained by: Parker Martel, Aidan Sunahara, Sebastian Rodriguez</h5>


<div class="text-center" style="text-align: center; padding-top: 80px">  
<legend class="border-bottom mb-4">Student Queries</legend>
<form action="Query1.php" method="POST">>
1. Given the campus wide ID of a student, list all courses the student took and the grades. <b>Enter the student CWID: </b><input type="text" name="cno" />
<input type="submit" />
</form>

<form action="Query2.php" method="POST">>
2. Given a course number list the sections of the course, including the classrooms, the
meeting days and time, and the number of students enrolled in each section. <b>Enter the course number: </b><input type="text" name="pno" />
<input type="submit" />
</form>
</div>


<div class="text-center" style="text-align: center; padding-top: 80px">
<button style="margin:10px 0px 0px 0px;" class="btn btn-light" onclick="history.back()">Go Back</button>
</div>

</head>
</body>
</html>

