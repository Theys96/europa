<?php 
session_start();
// Enter MySQL credentials:
$con = mysqli_connect(host, username, password, database);
// Check connection
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }


$username=$_POST["username"];
$password=$_POST["password"];

$result = mysqli_query($con,"SELECT * FROM europa_players WHERE username='$username'");
$row = mysqli_fetch_array($result);

if ($password == $row['password'] and $row['password']!="")
{
$_SESSION['logged']=true;
$_SESSION['name']=$row["firstname"];
$_SESSION['userid']=$row['id'];
echo "<noscript>Correct, sessie gestart. <a href='login'>Klik hier om door te gaan.</a></noscript><script type= 'text/javascript'>window.location='index.php';</script>";
}
else
{
session_destroy();
echo "<noscript>Incorrect, sessie gestopt. <a href='index.php'>Klik hier om terug te gaan.</a></noscript>";
echo "<script type= 'text/javascript'>window.location='index.php';</script>";
}

?>