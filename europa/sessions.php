<?php
// Enter MySQL credentials here:
$mysql_host = '';
$mysql_username = '';
$mysql_password = '';
$mysql_db = '';
$con=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);

$sessions = mysqli_query($con,"SELECT * FROM sessions");
while ($session = mysqli_fetch_array($sessions))
    {
    if ($session['active'] == 1)
        $sessie[$session['id']] = $session['name'];
    }
?>