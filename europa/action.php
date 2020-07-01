<?php
session_start();
include 'functions.php';
include 'config_' . $_SESSION['game'] . '.php';
$con=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);

if ($_POST['type'] == 'trade') :
$from = getPlayer($_POST['from']);
$to = getPlayer($_POST['to']);
$partners = explode(',',$from['trade']);
if ($to['id'] != '')
	$partners[] = $to['id'];
$partners = implode(',',array_unique($partners));
$id = $from['id'];
mysqli_query($con,"UPDATE $playertable SET trade='$partners' WHERE id='$id'");
echo 'Klaar.';
endif;

if ($_POST['type'] == 'stoptrade') :
$from = getPlayer($_POST['from']);
$to = getPlayer($_POST['to']);
$partners = explode(',',$from['trade']);
if (in_array($to['id'],$partners))
    unset($partners[array_search($to['id'],$partners)]);
$partners = implode(',',array_unique($partners));
$id = $from['id'];
mysqli_query($con,"UPDATE $playertable SET trade='$partners' WHERE id='$id'");
echo 'Klaar.';
endif;

if ($_POST['type'] == 'bg') :
$from = getPlayer($_POST['from']);
$to = getPlayer($_POST['to']);
$partners = explode(',',$from['bg']);
if ($to['id'] != '')
    $partners[] = $to['id'];
$partners = implode(',',array_unique($partners));
$id = $from['id'];
mysqli_query($con,"UPDATE $playertable SET bg='$partners' WHERE id='$id'");
echo 'Klaar.';
endif;

if ($_POST['type'] == 'stopbg') :
$from = getPlayer($_POST['from']);
$to = getPlayer($_POST['to']);
$partners = explode(',',$from['bg']);
if (in_array($to['id'],$partners))
    unset($partners[array_search($to['id'],$partners)]);
$partners = implode(',',array_unique($partners));
$id = $from['id'];
mysqli_query($con,"UPDATE $playertable SET bg='$partners' WHERE id='$id'");
echo 'Klaar.';
endif;

if ($_POST['type'] == 'move') :

$q = $_POST['q'];
if (substr($q,-1) == 'k' or substr($q,-1) == 'K')
    $q = substr($q,0,-1)*1000;
$from = getRegion($_POST['from']);
$to = getRegion($_POST['to']);
$sender = $from['id'];
$receiver = $to['id'];

$moves = explode(',',$from['move']);
foreach($moves as $move)
    {
    $move = explode(':',$move);
    $leaving += $move[1];
    }

if ($q <= $from['army']-$leaving)
    {
    if (checkBG($from['owner'],$to['owner']))
        {
        $moves = explode(',',$from['move']);
        foreach ($moves as $move)
            {
            $move = explode(':',$move);
            $moves[$move[0]] = $move[1];
            }
        
        $start = $moves[$to['id']];
        if (isset($moves[$to['id']]))
            $moves[$to['id']] += $q;
        else
            $moves[$to['id']] = $q;
        
        $string = '';
        foreach ($moves as $region => $quantity)
            {
            if ($region != '' and !is_numeric($region))
                {
                if ($quantity < 0)
                    $quantity = 0;
                $string .= $region . ':' . $quantity . ',';
                }
            }
        $string = substr_replace($string,"",-1);
        
        $moves = explode(',',$string);
        foreach ($moves as $move)
            {
            $move = explode(':',$move);
            $moves[$move[0]] = $move[1];
            }
        $moved = $moves[$to['id']] - $start;
        
        mysqli_query($con,"UPDATE $maptable SET move='$string' WHERE id='$sender'");
        $newarmy = $from['army_new'] - $moved;
        mysqli_query($con,"UPDATE $maptable SET army_new='$newarmy' WHERE id='$sender'");
        $newarmy = $to['army_new'] + $moved;
        mysqli_query($con,"UPDATE $maptable SET army_new='$newarmy' WHERE id='$receiver'");
        
        echo $moved . ' verzonden';
        }
    }
else
    echo 'Niet genoeg legers.';
endif;

if ($_POST['type'] == 'attack') :

$q = $_POST['q'];
if (substr($q,-1) == 'k' or substr($q,-1) == 'K')
    $q = substr($q,0,-1)*1000;
$from = getRegion($_POST['from']);
$to = getRegion($_POST['to']);
$sender = $from['id'];
$receiver = $to['id'];

$attacks = explode(',',$from['attack']);
foreach($attacks as $attack)
    {
    $attack = explode(':',$attack);
    $leaving += $attack[1];
    }

if ($q <= $from['army']-$leaving)
    {
    if ($from['owner'] != $to['owner'])
        {
        $moves = explode(',',$from['attack']);
        foreach ($moves as $move)
            {
            $move = explode(':',$move);
            $moves[$move[0]] = $move[1];
            }
        
        $start = $moves[$to['id']];
        if (isset($moves[$to['id']]))
            $moves[$to['id']] += $q;
        else
            $moves[$to['id']] = $q;
        
        $string = '';
        foreach ($moves as $region => $quantity)
            {
            if ($region != '' and !is_numeric($region))
                {
                if ($quantity < 0)
                    $quantity = 0;
                $string .= $region . ':' . $quantity . ',';
                }
            }
        $string = substr_replace($string,"",-1);
        
        $moves = explode(',',$string);
        foreach ($moves as $move)
            {
            $move = explode(':',$move);
            $moves[$move[0]] = $move[1];
            }
        $moved = $moves[$to['id']] - $start;
        
        mysqli_query($con,"UPDATE $maptable SET attack='$string' WHERE id='$sender'");
        $newarmy = $from['army_new'] - $moved;
        mysqli_query($con,"UPDATE $maptable SET army_new='$newarmy' WHERE id='$sender'");
        
        echo $moved . ' verzonden';
        }
    }
else
    echo 'Niet genoeg legers.';
endif;

if ($_POST['type'] == 'recruit') :

$region = getRegion($_POST['region']);
$player = getPlayer($region['owner']);
$q = $_POST['q'];
if (substr($q,-1) == 'k' or substr($q,-1) == 'K')
    $q = substr($q,0,-1)*1000;
if ($player['money_new'] >= $q and (($q < 0) ? (-$q <= $region['recruit']) : 1))
	{
	$id = $region['id'];
	$user = $player['username'];
	$new_army = $region['army_new']+$q;
	$new_money = $player['money_new']-$q;
	$new_recruit = $region['recruit']+$q;
	mysqli_query($con,"UPDATE $maptable SET army_new='$new_army',recruit='$new_recruit' WHERE id='$id'");
	mysqli_query($con,"UPDATE $playertable,players SET money_new='$new_money' WHERE players.id=$playertable.id AND username='$user'");
	echo $q . ' gerekruteerd.';
	}
else
	{
	echo 'Rekrutering mislukt.';
	}

endif;
?>