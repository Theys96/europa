<?php
function playerExists($username)
    {
    include 'config_' . $_SESSION['game'] . '.php';
    $tempcon=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);
    
    $result = mysqli_query($tempcon,"SELECT * FROM players WHERE username='$username'");
    if (mysqli_num_rows($result) == 1)
        return true;
    }

function getRegion($id)
    {
    include 'config_' . $_SESSION['game'] . '.php';
    $tempcon=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);
    $result = mysqli_query($tempcon,"SELECT * FROM $maptable WHERE id='$id'");
    mysqli_close($tempcon);
    return mysqli_fetch_array($result);
    }

function getProfitRegion($id)
	{
    include 'config_' . $_SESSION['game'] . '.php';
	$region = getRegion($id);
	$trade = $region['trade']/100+1;
	foreach (explode(',',$region['neigh']) as $neigh)
		{
		$neigh = getRegion($neigh);
		if (checkTrade($region['owner'],$neigh['owner']))
			$trade *= $neigh['trade']/100+1;
		}
	return $region['worth']*($trade);
	}
    
function getTradeRegion($id)
    {
    include 'config_' . $_SESSION['game'] . '.php';
	$region = getRegion($id);
	$trade = $region['trade']/100+1;
	foreach (explode(',',$region['neigh']) as $neigh)
		{
		$neigh = getRegion($neigh);
		if (checkTrade($region['owner'],$neigh['owner']))
			$trade *= $neigh['trade']/100+1;
		}
	return $trade;
	}


function getPlayer($username)
    {
    include 'config_' . $_SESSION['game'] . '.php';
    $tempcon=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);
    
    $result = mysqli_query($tempcon,"SELECT * FROM players WHERE username='$username'");
    $player = mysqli_fetch_array($result);
    $id = $player['id'];
    
    $check = mysqli_query($tempcon,"SELECT * FROM $playertable WHERE id='$id'");
    if (mysqli_num_rows($check) != 0)
        {
        $result = mysqli_query($tempcon,"SELECT * FROM players,$playertable WHERE players.id=$playertable.id AND players.username='$username'");
        $player = mysqli_fetch_array($result);
        }
    
    $player['settings'] = explode(',',$player['settings']);
    $player['stats'] = explode(',',$player['stats']);
    $settings = array();
    $stats = array();
    foreach ($player['settings'] as $setting)
        {
        $thissetting = explode(':',$setting);
        $settings[$thissetting[0]] = $thissetting[1];
        }
    foreach ($player['stats'] as $stat)
        {
        $thisstat = explode(':',$stat);
        $stats[$thisstat[0]] = $thisstat[1];
        }
    $player['stats'] = $stats;
    $player['settings'] = $settings;
    
    return $player;
    mysqli_close($tempcon);
    }

function getPlayerById($id)
    {
    include 'config_' . $_SESSION['game'] . '.php';
    $tempcon=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);
    
    $result = mysqli_query($tempcon,"SELECT * FROM players WHERE id='$id'");
    $player = mysqli_fetch_array($result);
    
    $check = mysqli_query($tempcon,"SELECT * FROM $playertable WHERE id='$id'");
    if (mysqli_num_rows($check) != 0)
        {
        $result = mysqli_query($tempcon,"SELECT * FROM players,$playertable WHERE players.id=$playertable.id AND players.id='$id'");
    
        $player = mysqli_fetch_array($result);
        $player['settings'] = explode(',',$player['settings']);
        $settings = array();
        foreach ($player['settings'] as $setting)
            {
            $thissetting = explode(':',$setting);
            $settings[$thissetting[0]] = $thissetting[1];
            }
        $player['settings'] = $settings;
    
        $player['stats'] = explode(',',$player['stats']);
        $stats = array();
        foreach ($player['stats'] as $stat)
            {
            $thisstat = explode(':',$stat);
            $stats[$thisstat[0]] = $thisstat[1];
            }
        $player['stats'] = $stats;
        }
    
    return $player;
    mysqli_close($tempcon);
    }

function checkTrade($user1,$user2)
	{
    include 'config_' . $_SESSION['game'] . '.php';
	$user1 = getPlayer($user1);
	$user2 = getPlayer($user2);
	$trade_user1 = explode(',',$user1['trade']);
	$trade_user2 = explode(',',$user2['trade']);
	if (in_array($user2['id'],$trade_user1) and in_array($user1['id'],$trade_user2))
		return true;
	else
		return false;
	}
    
function checkBG($user1,$user2)
    {
    include 'config_' . $_SESSION['game'] . '.php';
	$user1 = getPlayer($user1);
	$user2 = getPlayer($user2);
	$trade_user1 = explode(',',$user1['bg']);
	$trade_user2 = explode(',',$user2['bg']);
	if (in_array($user2['id'],$trade_user1) and in_array($user1['id'],$trade_user2))
		return true;
	else
		return false;
	}

function checkPass($user,$pass)
    {
    include 'config_' . $_SESSION['game'] . '.php';
    $tempcon=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);
    $result = mysqli_query($tempcon,"SELECT * FROM players WHERE username='$user'");
    $player = mysqli_fetch_array($result);
    if ($pass == $player['password'] and $player['username'] != '')
        return true;
    else
        return false;
    }

function formatNum($num){
    return sprintf("%+d",$num);
}

function getAllNeigh($code) {

include 'config_' . $_SESSION['game'] . '.php';
function getNeigh($code,$owner) {
include 'config_' . $_SESSION['game'] . '.php';
$region = getRegion($code);
$neighs = explode(',',$region['neigh']);
$neighsout = array();
foreach ($neighs as $neigh)
	{
	$neigh = getRegion($neigh);
	if ($neigh['owner'] == $owner)
		{
		$neighsout[] = $neigh['id'];
		}
	}
return $neighsout;
}

$start = getRegion($code);
$owner = $start['owner'];

$curr_neigh = getNeigh($code,$owner);
$i=0;
while ($i<5)
{
foreach($curr_neigh as $neigh)
	{
	$curr_neigh = array_merge($curr_neigh,getNeigh($neigh,$owner));
	}
$curr_neigh = array_unique($curr_neigh);
$i++;
}

return $curr_neigh;
}

function getRank($rating)
    {
    $ranks = array(
        'Soldaat'           =>  0,
        'Krijger'           =>  1,
        'Korpsleider'       =>  2,
        'Sergeant'          =>  3,
        'Kapitein'          =>  5,
        'Luitenant'         =>  8,
        'Veteraan'          =>  10,
        'Generaal'          =>  15,
        'Maarschalk'        =>  20,
        'Veldheer'          =>  25,
        'Oorlogsheld'       =>  30
        );
    
    foreach ($ranks as $title=>$q)
        {
        if ($rating >= $q)
            $rank = $title;
        else
            break;
        }
    
    return $rank;
    }

function getScreenName($username)
    {
    $title = '';
    $player = getPlayer($username);
    if ($player['settings']['showtitle'] == 'true')
        $title .= '<span style="font-weight: bold">' . getRank($player['rating']) . '</span> ';
    if ($player['settings']['showspectitle'] == 'true' and $player['title'] != '')
        $title .= '<span style="font-weight: bold">' . $player['title'] . '</span> ';
    $title .= $player['username'];
    if ($player['settings']['showsuftitle'] == 'true' and $player['suftitle'] != '')
        {
        $title .= (substr($player['suftitle'],0,1) != ',') ? ' ' : '';
        $title .= '<span style="font-weight: bold">' . $player['suftitle'] . '</span>';
        }
    return $title;
    }
    
function addStat($username,$stat,$q)
    {
    include 'config_' . $_SESSION['game'] . '.php';
    $tempcon=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);
    $player = getPlayer($username);
    $player['stats'][$stat] += $q;
    foreach ($player['stats'] as $thisstat=>$thisq)
        {
        $stats[] = $thisstat . ':' . $thisq;
        }
    $stats = implode(',',$stats);
    mysqli_query($tempcon,"UPDATE players,$playertable SET stats='$stats' WHERE players.id=$playertable.id AND username='$username'");
    mysqli_close($tempcon);
    }

function inSession($username)
    {
    include 'config_' . $_SESSION['game'] . '.php';
    $tempcon=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);

    $check = mysqli_query($tempcon,"SELECT * FROM players,$playertable WHERE players.id=$playertable.id AND players.username='$username'");
    mysqli_close($tempcon);
    
    return (mysqli_num_rows($check) != 0);
    }

function numRegions($username)
    {
    include 'config_' . $_SESSION['game'] . '.php';
    $tempcon=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);
    
    $regions = 0;
    $result = mysqli_query($tempcon,"SELECT * FROM $maptable WHERE owner='$username'");
    $regions = mysqli_num_rows($result);
    return $regions;
    }

function getSession($id)
    {
    include 'config_' . $_SESSION['game'] . '.php';
    $tempcon=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);
    
    $result = mysqli_query($tempcon,"SELECT * FROM sessions WHERE id='$id'");
    return mysqli_fetch_array($result);
    }

?>