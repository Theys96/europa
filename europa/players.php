<?php
$con=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);
if (mysqli_connect_errno($con))
  {
  echo "Connect fail: " . mysqli_connect_error();
  }

$regions = Array();
$profit = Array();
$army = Array();
$result = mysqli_query($con,"SELECT * FROM $maptable");
while ($region = mysqli_fetch_array($result))
    {
    if ($region['owner'] != 'neutral')
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
	}
$result = mysqli_query($con,"SELECT * FROM $playertable");
while ($player = mysqli_fetch_array($result))
    {
    if ($regions[$player['username']] != 0)
        {
        $totalmoney += $player['money'];
        }
    }

$highestprofit = array_search(max($profit),$profit);
$biggestarmy = array_search(max($army),$army);
echo '<table width="100%"><tr><td><b>Naam</b></td><td><b>Landen</b></td><td><b>Inkomsten</b></td><td><b>Legermacht</b></td><td><b>Geld</b></td></tr>';
$result = mysqli_query($con,"SELECT * FROM $playertable,players WHERE $playertable.id=players.id");
while ($player = mysqli_fetch_array($result))
    {
    $partners = explode(',',$player['trade']);
    $trade_partners = array();
    unset($partners[array_search($player['id'],$partners)]);
    $flair_pre = '';
    $flair_suf = '';
    if ($highestprofit == $player['username'] && $biggestarmy == $player['username'])
        {
        $flair_suf .= ' <span style="color: #FDD017">H</span> ';
        $armyplusmoney = $army[$player['username']] + $player['money'];
        $totalarmyplusmoney = array_sum($army) + $totalmoney ;
        $this_profit = $profit[$player['username']];
        $totalprofit = array_sum($profit) - $this_profit;
        }
    $trade_partners = implode(',',$trade_partners);
    if ($regions[$player['username']] != 0)
        {
        echo '<tr bgcolor="' . $player['color'] . '"><td>' . $flair_pre . '<a href="player.php?pid=' . $player['id'] . '">' . getScreenName($player['username']) . '</a>' . $flair_suf . '</td><td>' . $regions[$player['username']] . '</td><td>' . round($profit[$player['username']],2) . '</td><td>' . $army[$player['username']] . '</td><td>' . round($player['money'],2) . '</td></tr>';
        }
    }
echo '</table>';
?>