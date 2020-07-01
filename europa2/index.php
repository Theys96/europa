<?php
session_start();
require 'code/classes.php';
// MySQL creds:
$mysql = new Mysqli("","","","") or die("Error " . mysqli_error($mysql));
$startqueries = intval(substr($mysql->stat,40,10));
$Session = new GameSession($mysql);
$Cookie = new Cookie();

if (!$Session->isInit())
    {
    $Session->exitGameSession();
    }

if (isset($_POST['user']))
    {
    $Player = new User($_POST['user'],$mysql);
    if($Player->auth($_POST['pass']))
        $Session->initGameSession($_POST['game'],$Player);
    else
        $err_msg = "Inloggen mislukt.";
    }

if ($_POST['switch'] == 'true')
    {
    $user = $Session->username;
    $Player = new User($user,$mysql,$Session);
    $Player->auth();
    $Session->initGameSession($_POST['game'],$Player);
    }
$Europa = new EuropaGame($mysql,$Session);

if ($Europa->LoadPage() == 'game.php')
    {
    $Player = new User($Session->username,$mysql,$Session);
    $Map = new Map($mysql,$Session,$Session->GameData(null,'id'));
    }
if ($Europa->LoadPage() == 'login.php')
    {
    $Map = new Map($mysql,$Session,'wereld','zoomButtons: false');
    }

if ($_GET['action'] == 'logout')
    {
    $Session->exitGameSession();
    header("location: index.php");
    }

if ($Cookie->noanimation != 'true')
    {
    $animation = true;
    $Cookie->noanimation = 'true';
    }
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" media="all" href="lib/jquery-jvectormap.css"/>
<link rel="stylesheet" media="all" href="lib/style.css"/>
<?php
if ($Europa->LoadPage() == 'game.php' or $Europa->LoadPage() == 'login.php')
    $Map->LoadFiles();
?>
<script src="lib/list.js"></script>
<script src="code/europa.js"></script>
<script>
$(function() {

//JavaScript-PHP
<?php
switch($Europa->LoadPage())
    {
    case 'game.php': 
        $Map->initMap('#map1',$_GET['modus']);
        if ($Player->living())
            $Map->focusOnUser('#map1',$Map->player($Session->username));
        echo "\nplaceMoney();\n";
        echo "countDown();\n";
    break;
    case 'login.php': 
        if($Cookie->noanimation != true)
            echo 'animation();';
        $Map->initMap('#logocontainer','owner');
    break;
    }
?>

//End



});
</script>
</head>
<body>
<?php
include 'code/' . $Europa->LoadPage();
?>

<!--
<?php
$endqueries = intval(substr($mysql->stat,40,10));
echo $endqueries-$startqueries . " queries uitgevoerd tijdens programma.\n";
echo "\nSessie: \n";
print_r($_SESSION);
?>
-->
</body>
</html>


