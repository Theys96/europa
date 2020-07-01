<?php
session_start();
include 'functions.php';
include 'config.php';
$con=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);

if (isset($_SESSION['username'])) :

if (!isset($_REQUEST['modus']) or $_REQUEST['modus'] == 'rating')
    $modus = 'rating';
else if ($_REQUEST['modus'] == 'landen')
    $modus = 'landen';
?>
<!DOCTYPE html>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<center>

<?php if ($modus == 'rating') : ?>
<table>
<tr><td><b>Username</b></td><td><b>Rating</b></td></tr>
<?php
$sort = (isset($_REQUEST['sort'])) ? $_REQUEST['sort'] : 'rating';
$order = (isset($_REQUEST['order'])) ? strtoupper($_REQUEST['order']) : 'DESC';
$query = mysqli_query($con,"SELECT * FROM $playertable ORDER BY $sort $order");
while($row = mysqli_fetch_array($query))
    {
    echo '<tr><td>' . $row['username'] . '</td><td>' . $row['rating'] . '</td></tr>';
    }
?>
</table>
<?php endif; ?>

<?php if ($modus == 'landen') : ?>
<table>
<tr><td><b>Land</b></td><td><b>Eigenaar</b></td><td><b>Legermacht</b></td><td><b>Inkomsten</b></td></tr>
<?php
$sort = (isset($_REQUEST['sort'])) ? $_REQUEST['sort'] : 'owner';
$order = (isset($_REQUEST['order'])) ? strtoupper($_REQUEST['order']) : 'DESC';
$query = mysqli_query($con,"SELECT * FROM $maptable ORDER BY $sort $order");
while($row = mysqli_fetch_array($query))
    {
    $owner = getPlayer($row['owner']);
    $profit = getProfitRegion($row['id']);
    echo '<tr bgcolor="' . $owner['color'] . '"><td>' . $row['name'] . '</td><td>' . getScreenName($owner['username']) . '</td><td>' . $row['army'] . '</td><td>' . round($profit,0) . '</td></tr>';
    }
?>
</table>
<?php endif; ?>

</center>
</body>
</html>

<?php
endif;
if (!isset($_SESSION['username']))
    {
    echo 'Log alstublieft in.';
    }
?>