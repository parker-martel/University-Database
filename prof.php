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



<h1 style="font-family:verdana; padding-top: 20px">University Database</h1>
<h5 style="font-family:verdana;">Maintained by: Parker Martel, Aidan Sunahara, Sebastian Rodriguez</h5>

<div class="text-center" style="text-align: center; padding-top: 80px"> 

<legend class="border-bottom mb-4">Professor Queries</legend>
<form action="Query3.php" method="POST">
1. Given the social security number of a professor, list the titles, classrooms, meeting days and time of his/her classes. <b> Enter Social Security: </b><input type="text" name="cno" />
<input type="submit" />
</form>

<form action="Query4.php" method="POST">
2. Given a course number and a section number, count how many students get each distinct grade, i.e. A, A-, B+, B, B-, etc. <br><b> Enter Course number</b> <input type="text" name="Course" />
<b> Section Number: </b> <input type="text" name="Section" />
<input type="submit" />
</form>


</div>
<div class="text-center" style="text-align: center; padding-top: 80px">
<button style="margin:10px 0px 0px 0px;" class="btn btn-light" onclick="history.back()">Go Back</button>
</div>


</head>
</body>
</html>

