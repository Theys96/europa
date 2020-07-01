<?php
session_start();
include 'functions.php';
include 'config.php';
$con=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);

$res=mysqli_query($con,"SELECT * FROM $playertable");
$player=mysqli_fetch_array($res);
echo $player['color'];

$values = array('00','33','66','99','cc','ff');
echo '<select>';
for ($r=0;$r<6;$r++)
    {
    for ($g=0;$g<6;$g++)
        {
        for ($b=0;$b<6;$b++)
            {
            $color = '#' . $values[$r] . $values[$g] . $values[$b];
            $res = mysqli_query($con,"SELECT * FROM $playertable WHERE color='$color'");
            echo mysqli_num_rows($res);
            if (mysqli_num_rows($res) > 0)
                $disabled = 'disabled';
            else
                $disabled = '';
            echo '<option style="background-color: ' . $color . '" ' . $disabled . '>' . $color . '</option>';
            }
        }
    }
echo '</select>';
?>