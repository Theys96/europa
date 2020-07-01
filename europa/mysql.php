<?php
include 'config_europa.php';
$con=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);

$query = mysqli_query($con,"SELECT * FROM players,players_europa WHERE players.id = players_europa.id");
while ($row = mysqli_fetch_array($query))
    {
    print_r($row);
    echo '<br />';
    }
?>