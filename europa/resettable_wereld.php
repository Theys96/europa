<?php
//12 persoons wereld
$config = array(
'US' => 0,
'CA' => 0,
'GL' => 0,
'MX' => 1,
'GT' => 1,
'BZ' => 1,
'HN' => 1,
'SV' => 1,
'NI' => 1,
'CR' => 1,
'PA' => 1,
'CU' => 1,
'BS' => 1,
'JM' => 1,
'HT' => 1,
'DO' => 1,
'PR' => 1,
'EC' => 1,
'CO' => 1,
'VE' => 1,
'GY' => 1,
'SR' => 1,
'TT' => 1,
'PE' => 2,
'BR' => 2,
'BO' => 2,
'AR' => 2,
'UY' => 2,
'PY' => 2,
'CL' => 2,
'FK' => 2,
'NL' => 3,
'BE' => 3,
'LU' => 3,
'FR' => 3,
'IS' => 3,
'NO' => 3,
'SE' => 3,
'DK' => 3,
'FI' => 3,
'DE' => 3,
'CH' => 3,
'GB' => 3,
'IE' => 3,
'ES' => 3,
'PT' => 3,
'AT' => 4,
'HU' => 4,
'PL' => 4,
'CZ' => 4,
'SK' => 4,
'UA' => 4,
'MD' => 4,
'IT' => 4,
'GR' => 4,
'RO' => 4,
'BG' => 4,
'RS' => 4,
'_1' => 4,
'MK' => 4,
'AL' => 4,
'ME' => 4,
'BA' => 4,
'HR' => 4,
'SI' => 4,
'LT' => 5,
'LV' => 5,
'EE' => 5,
'RU' => 5,
'BY' => 5,
'KZ' => 5,
'TR' => 6,
'CY' => 6,
'GE' => 6,
'AZ' => 6,
'AM' => 6,
'IR' => 6,
'TM' => 6,
'UZ' => 6,
'AF' => 6,
'PK' => 6,
'KG' => 6,
'TJ' => 6,
'MN' => 7,
'CN' => 7,
'KP' => 7,
'KR' => 7,
'JP' => 7,
'IN' => 7,
'LK' => 7,
'BD' => 7,
'BT' => 7,
'NP' => 7,
'TW' => 7,
'MM' => 8,
'LA' => 8,
'VN' => 8,
'TH' => 8,
'KH' => 8,
'MY' => 8,
'ID' => 8,
'BN' => 8,
'PH' => 8,
'TL' => 8,
'PG' => 8,
'AU' => 8,
'NC' => 8,
'NZ' => 8,
'FJ' => 8,
'VU' => 8,
'SB' => 8,
'TF' => 8,
'EG' => 9,
'LB' => 9,
'SA' => 9,
'JO' => 9,
'PS' => 9,
'IQ' => 9,
'IL' => 9,
'SY' => 9,
'SD' => 9,
'ER' => 9,
'ET' => 9,
'DJ' => 9,
'SO' => 9,
'_3' => 9,
'YE' => 9,
'OM' => 9,
'QA' => 9,
'AE' => 9,
'KW' => 9,
'MA' => 10,
'MR' => 10,
'_2' => 10,
'DZ' => 10,
'TN' => 10,
'LY' => 10,
'TD' => 10,
'NE' => 10,
'ML' => 10,
'NG' => 10,
'SN' => 10,
'GM' => 10,
'GW' => 10,
'GN' => 10,
'SL' => 10,
'LR' => 10,
'CI' => 10,
'BF' => 10,
'GH' => 10,
'BJ' => 10,
'TG' => 10,
'CM' => 11,
'CF' => 11,
'SS' => 11,
'KE' => 11,
'UG' => 11,
'CD' => 11,
'CF' => 11,
'GQ' => 11,
'GA' => 11,
'AO' => 11,
'CG' => 11,
'TZ' => 11,
'RW' => 11,
'BI' => 11,
'AO' => 11,
'ZM' => 11,
'MW' => 11,
'MZ' => 11,
'NA' => 11,
'ZW' => 11,
'BW' => 11,
'ZA' => 11,
'MG' => 11,
'SZ' => 11,
'LS' => 11
);

$map = 'wereld';

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
<input type="text" name="players[]" autocomplete="off" /><br />
<input type="text" name="players[]" autocomplete="off" /><br />
Passkey: <input type="password" name="passkey" autocomplete="off" /><br />
<input type="submit" />
</form>
<?php
endif;
?>