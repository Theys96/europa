<?php
include 'functions.php';
$mysql_host = 'localhost';
$mysql_username = 'thijshavi_eu';
$mysql_password = 'eu2013';
$mysql_db = 'thijshavi_eu';
$con=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);

$sessions = mysqli_query($con,"SELECT * FROM sessions");
while ($session = mysqli_fetch_array($sessions))
    {
    if ($session['active'] == 1 and $session['paused'] == 0)
        $sessie[$session['id']] = $session['name'];
    }

foreach ($sessie as $gameid=>$gamename)
{
$page = '';
include 'config_' . $gameid . '.php';
$con=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);
$_SESSION['game'] = $gameid;

$result = mysqli_query($con,"SELECT * FROM $maptable");
while ($region = mysqli_fetch_array($result))
    {
    $id = $region['id'];
    $army = $region['army_new'];
    $recruit = $region['recruit'];
	$owner = getPlayer($region['owner']);
	$user = $owner['username'];
	$money = $owner['money'] - $recruit;
	mysqli_query($con,"UPDATE $playertable,players SET money='$money' WHERE players.id=$playertable.id AND players.username='$user'");
    mysqli_query($con,"UPDATE $maptable SET army='$army',army_new='$army',recruit='',move='' WHERE id='$id'");
    }

$p_attacks = array();
$result = mysqli_query($con,"SELECT * FROM $maptable");
while ($region = mysqli_fetch_array($result))
    {
    $id = $region['id'];
    $attacks = explode(',',$region['attack']);
    foreach ($attacks as $attack)
	    {
	    $attack = explode(':',$attack);
	    $p_attacks[$attack['0']][$region['id']] = $attack['1'];
	    }
    mysqli_query($con,"UPDATE $maptable SET attack='' WHERE id='$id'");
    }

unset($p_attacks['']);
unset($attack);
$new_owners = array();
$army_new = array();
foreach ($p_attacks as $target=>$attack)
	{
    if (array_sum($attack) > 0) :
    
    while (($key = array_search(0, $attack)) !== false)
        unset($attack[$key]);
    
    //Gather info
    $target = getRegion($target);
    $att_n = array_sum($attack);
    $def_n = ($target['army'] > 0) ? $target['army'] : 1;
    unset($attackers);
    foreach ($attack as $attacker=>$q)
		{
		$attacker = getRegion($attacker);
		$attackers[] = $attacker['name'];
        }
    
    $defender = $target['name'];
    $def_id = $target['id'];
    //Done.
    
    //Calculate
    $rand_a = (mt_rand(0,1000))/1000;
    $rand_d = (mt_rand(0,1000))/1000;
    $factor_def = (4.76*pow($rand_d,4)) - (14.29*pow($rand_d,3)) + (14.1*pow($rand_d,2)) - (6.07*$rand_d) + 2;
    $factor_att = pow((4.76*pow($rand_a,4)) - (14.29*pow($rand_a,3)) + (14.1*pow($rand_a,2)) - (6.07*$rand_a) + 2,-1);
    $damage_att = round($factor_att * $att_n,0);
    $damage_def = round($factor_def * $def_n,0);
    $left_att = max(0,$att_n - $damage_def);
    $left_def = max(0,$def_n - $damage_att);
    //Done.
    
    //Process
    $army_new[$def_id] -= $def_n - $left_def;
    //addStat($target['owner'],'kills',$damage_att);
    //mysqli_query($con,"UPDATE $maptable SET army='$left_def',army_new='$left_def' WHERE id='$def_id'");
    foreach ($attack as $attacker=>$q)
		{
		$attacker = getRegion($attacker);
		$id = $attacker['id'];
		$new_army = $attacker['army'] + $q/$att_n*$left_att;
        $army_new[$id] += $q/$att_n*$left_att;
        //addStat($attacker['owner'],'kills',$q/$att_n*$damage_def);
		//mysql_query($con,"UPDATE $maptable SET army='$new_army',army_new='$new_army' WHERE id='$id'");
		}
        
    if ($left_def == 0)
        {
        $victor = getRegion(array_search(max($attack),$attack));
        $victor_region = $victor['name'];
		$targetid = $target['id'];
		$new_owners[$targetid] = $victor['owner'];
        }
    //Done
    
    //Print results
    $page .= '<table class="rapport">';
    $page .= '<tr><td>Aanvaller</td><td>Verdediger</td></tr>';
    $page .= '<tr><td>' . implode(', ',$attackers) . '</td><td>' . $defender . '</td></tr>';
    $page .= '<tr><td>' . $att_n . '</td><td>' . $def_n . '</td></tr>';
    $page .= '<tr><td colspan="2"><img align="left" src="media/bar.png" height="20px" width="' . $rand_a*100 . '%" /><br /><img align="right" src="media/bar.png" height="20px" width="' . (1-$rand_d)*100 . '%" /></td></tr>';
    $page .= '<tr><td>' . $left_att . '</td><td>' . $left_def . '</td></tr>';
    $page .= '<tr><td colspan="2">';
    $page .= (($left_def > $left_att) ? 'De verdediger heeft gewonnen.' : 'De aanvaller heeft gewonnen<br />');
    if ($left_def == 0)
        $page .= '<br />' . $defender . ' is nu van ' . $victor['owner'] . ' (' . $victor_region . ')';
    $page .= '</td></tr>';
    $page .= "</table><br /><br />\n\n";
    //Done.
    
    endif;
    /*
    OUDE CODE
    
	$target = getRegion($target);
	$att_n = array_sum($attack);
	if ($att_n > 0) :

	$def_n = ($target['army'] > 0) ? $target['army'] : 1;
	$power = $att_n/$def_n;
	if ($power < 2.5 and $power > 0.4)
		$chance = (1.166*$power)-0.429-(0.238*$power*$power);
	else
		{
		if ($power > 2.5)
			$chance = 0.999999;
		if ($power < 0.4)
			$chance = 0.000001;
		}
	$rand = (mt_rand(0,1000))/1000;
	$page .= '<table><tr><td>Aanvaller</td><td>Verdediger</td></tr>';
	$page .= '<tr><td>';
	unset($attackers);
	foreach ($attack as $attacker=>$q)
		{
		$attacker = getRegion($attacker);
		$attackers[] = $attacker['name'];
        }
	$page .= implode(', ',$attackers);
	$page .= '</td><td>' . $target['name'] . '</td></tr>';
	$page .= '<tr><td>' . $att_n . '</td><td>' . $def_n . '</td></tr>';
	$page .= '<tr><td colspan="2">';
	$page .= 'Winkans: ' . round($chance*100,2) . '% <br />';
	if ($rand < $chance)
		{
		$page .= 'De aanvaller wint. ';
		$victor = getRegion(array_search(max($attack),$attack));
		$victor = $victor['owner'];
		$targetid = $target['id'];
		$new_owners[$targetid] = $victor;
        //$page .= '<br />' . $target['name'] . ' is nu van ' . $victor '.';
		}
	else
		$page .= 'De verdediger wint. ';
	$page .= '</td></tr>';
	$page .= '<tr><td>' . round(max(0,$att_n-min($def_n,$att_n)*($rand/$chance)*($rand/$chance))) . '</td>';
	$page .= '<td>' . round(max(0,$def_n-min($def_n,$att_n)*((1-$rand)/(1-$chance))*((1-$rand)/(1-$chance)))) . '</td></tr>';
	$page .= '</table>';

	$id = $target['id'];
	$new_army = round(max(0,$def_n-min($def_n,$att_n)*((1-$rand)/(1-$chance))*((1-$rand)/(1-$chance))));
	if ($def_n-$new_army > min($att_n,$def_n)*2.5)
		$new_army = $def_n-min($att_n,$def_n)*2.5;
	mysqli_query($con,"UPDATE $maptable SET army='$new_army',army_new='$new_army' WHERE id='$id'");
	foreach ($attack as $attacker=>$q)
		{
		$attacker = getRegion($attacker);

		$id = $attacker['id'];
		$new_army = $attacker['army'] + round(($q/$att_n)*(max(0,$att_n-min($def_n,$att_n)*($rand/$chance)*($rand/$chance))));
		mysqli_query($con,"UPDATE $maptable SET army='$new_army',army_new='$new_army' WHERE id='$id'");
		}
	endif;
    */
	}

foreach ($army_new as $id => $q)
{
$region = getRegion($id);
$new_army = $region['army'] + $q;
mysqli_query($con,"UPDATE $maptable SET army='$new_army',army_new='$new_army' WHERE id='$id'");
}


foreach ($new_owners as $targetid => $victor)
	{
	mysqli_query($con,"UPDATE $maptable SET owner='$victor',army='0',army_new='0' WHERE id='$targetid'");
	}

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
        if (checkTrade($region['owner'],$neigh['owner']))
            $trade *= $neigh['trade']/100+1;
        }
    $profit[$region['owner']] += $region['worth']*($trade);
    }

$result = mysqli_query($con,"SELECT * FROM $playertable,players WHERE players.id=$playertable.id");
while ($player = mysqli_fetch_array($result))
	{
    //addStat($player['username'],'money',$money);
    
	$money = round($player['money'] + $profit[$player['username']],0);
	$id = $player['id'];
	mysqli_query($con,"UPDATE $playertable SET money='$money',money_new='$money' WHERE id='$id'");
	}
}

include 'sessions.php';

foreach ($sessie as $gameid=>$gamename)
{
include 'config_' . $gameid . '.php';
$_SESSION['game'] = $gameid;

//Checken voor nieuwe sessie
$living = 0;
$regions = array();
$result = mysqli_query($con,"SELECT * FROM $playertable,players WHERE players.id=$playertable.id");
while ($gamer = mysqli_fetch_array($result))
    {
    if (numRegions($gamer['username']) > 0)
        {
        $living += 1;
        $regions[$gamer['username']] = numRegions($gamer['username']);
        }
    }

if ($living <= 3)
    {
    $page .= '<h2>Sessie afgelopen.</h2>';
    mysqli_query($con,"UPDATE sessions SET paused=1 WHERE id='$gameid'");
    $profit = Array();
    $result = mysqli_query($con,"SELECT * FROM $maptable");
    while ($region = mysqli_fetch_array($result))
        {
        if ($region['owner'] != 'neutral')
            {
            $trade = $region['trade']/100+1;
            foreach (explode(',',$region['neigh']) as $neigh)
                {
                $neigh = getRegion($neigh);
                if (checkTrade($neigh['owner'],$region['owner']))
                    $trade *= $neigh['trade']/100+1;
                }
            $profit[$region['owner']] += $region['worth']*($trade);
            }
        }
    arsort($profit);

    $players = array_keys($profit);
    $page .= '1: ' . $players[0] . '<br />';
    $page .= '2: ' . $players[1] . '<br />';
    $page .= '3: ' . $players[2] . '<br />';
    
    
    $query = mysqli_query($con,"SELECT * FROM $subtable WHERE type='sub'");
    
    include 'startconfig_' . $gameid . '.php';
    $page .= '<p>' . mysqli_num_rows($query) . '/' . $numplayers . ' spelers voor de volgende sessie.</p>';
    if (mysqli_num_rows($query) >= $numplayers)
        {
        $page .= '<p>Nieuwe sessie beginnend.</p>';
        
        $players = $_POST['players'];
        shuffle($players);

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
        mysqli_query($con,"TRUNCATE TABLE $subtable");
        mysqli_query($con,"UPDATE sessions SET paused=0 WHERE id='$gameid'");
        mysqli_query($con,"");
        echo 'Klaar.';
        }
    }

echo $page;
file_put_contents('process/' . $gameid . '/' . date("d-m-y_H:i") . '.txt',$page);
file_put_contents('process/' . $gameid . '.txt',$page);
file_put_contents('../' . $gameid . '/process.txt',$page);
}
?>