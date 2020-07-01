<?php
session_start();
include 'sessions.php';
include 'functions.php';

//Check login
if (isset($_REQUEST['user']) and isset($_REQUEST['pass']) and isset($_REQUEST['game']))
    {
    $_SESSION['game'] = $_REQUEST['game'];
    if (checkPass($_REQUEST['user'],$_REQUEST['pass']))
        {
        include 'config_' . $_SESSION['game'] . '.php';
        $con=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);
        $_SESSION[$maptable]['username'] = $_REQUEST['user'];
        $_SESSION[$maptable]['guest'] = false;
        $fname = getPlayer($_REQUEST['user']);
        $_SESSION[$maptable]['id'] = $fname['id'];
        $_SESSION[$maptable]['fname'] = $fname['firstname'];
        $_SESSION[$maptable]['displayname'] = getScreenName($_SESSION[$maptable]['username']);
        if ($fname['settings']['chatcolor'] == 'true')
            $_SESSION[$maptable]['chatcolor'] = $fname['color'];
        else
            $_SESSION[$maptable]['chatcolor'] = 'black';
        
        $user = $_SESSION[$maptable]['username'];
        $ip = $_SERVER['REMOTE_ADDR'];
        $meta = $maptable . ' - ' . $_SERVER['HTTP_USER_AGENT'];
        mysqli_query($con,"INSERT INTO log (user, ip, meta) VALUES ('$user', '$ip', '$meta')");
        }
    else
        {
        echo '<p>Foutieve combinatie wachtwoord/gebruikersnaam.</p>';
        unset($_SESSION[$maptable]['username']);
        }
    }

include 'config_' . $_SESSION['game'] . '.php';
$con=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);

if (isset($_SESSION[$maptable]['username'])) :

//Set modus
if (isset($_GET['modus']))
	$maptype = $_GET['modus'];
else
	$maptype = 'owner';
//Done.

//Session & DB
$user = getPlayer($_SESSION[$maptable]['username']);
//Done.

//Time
$datetime = new DateTime('tomorrow');
if (date('G') < 18)
	$time = '18:00 ' . date("d-m-'y");
else
	$time = '0:00 ' . $datetime->format("d-m-'y");
//Done.

//Player data
$saldo = $user['money'];
$expense = $user['money']-$user['money_new'];
$regions = Array();
$profit = Array();
$army = Array();
$result = mysqli_query($con,"SELECT * FROM $maptable");
while ($region = mysqli_fetch_array($result))
    {
    $regions[$region['owner']] += 1;
    $army[$region['owner']] += $region['army'];
    $trade = $region['trade']/100+1;
    foreach (explode(',',$region['neigh']) as $neigh)
        {
        $neigh = getRegion($neigh);
        if (checkTrade($neigh['owner'],$region['owner']))
            $trade *= $neigh['trade']/100+1;
        }
    $profit[$region['owner']] += $region['worth']*($trade);
    }
$army = $army[$user['username']];
$profit = round($profit[$user['username']]);
$regions = $regions[$user['username']];
//Done.

?>
<!DOCTYPE html>
<html>
<head>
<script>

</script>

  <title><?php echo $sessie[$_SESSION['game']]; ?></title>
  <link rel="stylesheet" media="all" href="style.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
  <?php include 'initmap.php' ?>
</head>
<body>
<?php
$living = 0;
$result = mysqli_query($con,"SELECT * FROM $playertable,players WHERE players.id=$playertable.id");
while ($gamer = mysqli_fetch_array($result))
    {
    if (numRegions($gamer['username']) > 0)
        $living += 1;
    }
if ($living <= 5) :
?>
<center><p><a href="sub.php">Aanmelden voor de volgende sessie</a></p></center>
<?php
endif;
if ($user['color'] == '#cccccc')
    echo '<p>Kies aub een kleur bij <a href="settings.php">settings</a></p>';

include 'header.php';
?>
<table width="100%"><tr><td class="notable">
<div id="info"></div></td><td class="notable">
<div id="map1"></div></td></tr>
</table>
<div id="players"><?php include 'players.php' ?></div>

<div id="messages"><H2>Laatste aanvallen</h2><?php include 'process/' . $_SESSION['game'] . '.txt' ?></div>
</body>
</html>








<?php
endif;
if (!isset($_SESSION[$maptable]['username']))
    include 'login.php';

echo '<!--';
print_r($_SESSION);
print_r(getPlayer($_SESSION[$maptable]['username']));
echo '-->';
?>