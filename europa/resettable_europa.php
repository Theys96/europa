<?php
$config = array(
'NL' => 0,
'BE' => 0,
'LU' => 0,
'FR' => 0,
'IS' => 1,
'NO' => 1,
'SE' => 1,
'DK' => 1,
'FI' => 1,
'DE' => 2,
'CH' => 2,
'AT' => 2,
'HU' => 2,
'PL' => 3,
'CZ' => 3,
'SK' => 3,
'LT' => 3,
'LV' => 3,
'EE' => 3,
'RU' => 4,
'BY' => 4,
'UA' => 4,
'MD' => 4,
'IE' => 5,
'GB' => 5,
'ES' => 5,
'PT' => 5,
'MA' => 5,
'IT' => 6,
'DZ' => 6,
'TN' => 6,
'LY' => 6,
'LB' => 7,
'SA' => 7,
'JO' => 7,
'PS' => 7,
'IQ' => 7,
'SY' => 7,
'EG' => 8,
'CY' => 8,
'TR' => 8,
'GR' => 8,
'GE' => 8,
'RO' => 9,
'BG' => 9,
'RS' => 9,
'_2' => 9,
'MK' => 9,
'AL' => 9,
'ME' => 9,
'BA' => 9,
'HR' => 9,
'SI' => 9
);

$map = 'europa';

if (isset($_POST['players']) and $_POST['passkey'] == 'europa') :
$players = $_POST['players'];
shuffle($players);

include 'functions.php';
include 'config_' . $map . '.php';
$con=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);

mysqli_query($con,"UPDATE $maptable SET army=200000,army_new=200000,recruit=0,move='',attack='',owner='neutral' WHERE worth!=0");

mysqli_query($con,"TRUNCATE TABLE $playertable");
foreach ($players as $player)
    {
    $player = mysqli_fetch_array(mysqli_query($con,"SELECT * FROM players WHERE username='$player'"));
    $id = $player['id'];
    $color = '#333333';
    echo "INSERT INTO $playertable (id, color, money, money_new, trade, bg) VALUES ($id, '$color', 0, 0, $id, $id)";
    echo '<br />';
    mysqli_query($con,"INSERT INTO $playertable (id, color, money, money_new, trade, bg) VALUES ($id, '$color', 0, 0, $id, $id)");
    }

foreach ($config as $id=>$owner)
    {
    $owner = $players[$owner];
    echo $id . ' voor ' . $owner . '.<br />';
    mysqli_query($con,"UPDATE $maptable SET army=0,army_new=0,owner='$owner' WHERE id='$id'");
    }

echo 'done.';
endif;
if (!isset($_POST['players'])) : 
?>
Spelers:<br />
<form method="post">
<input type="text" name="players[]" autocomplete="off" /><br />
<input type="text" name="players[]" autocomplete="off" /><br />
<input type="text" name="players[]" autocomplete="off" /><br />
<input type="text" name="players[]" autocomplete="off" /><br />
<input type="text" name="players[]" autocomplete="off" /><br />
<input type="text" name="players[]" autocomplete="off" /><br />
<input type="text" name="players[]" autocomplete="off" /><br />
<input type="text" name="players[]" autocomplete="off" /><br />
<input type="text" name="players[]" autocomplete="off" /><br />
<input type="text" name="players[]" autocomplete="off" /><br />
Passkey: <input type="password" name="passkey" autocomplete="off" /><br />
<input type="submit" />
</form>
<?php
endif;
?>