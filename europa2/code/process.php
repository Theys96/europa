<?php
require 'classes.php';
// MySQL creds:
$mysql  = new Mysqli("","","","") or die("Error " . mysqli_error($mysql));
$Session = new GameSession($mysql);
$Cookie = new Cookie();
$Europa = new EuropaGame($mysql,$Session);

foreach ($Session->listGames('notpaused') as $gameid=>$gamename)
{
$Map = new Map($mysql,$Session,$gameid);

$result = "";
$result .= $Map->process();

$timestamp  = date('d-m-y_H:i');
mkdir('../process/' . $gameid);
file_put_contents('../process/' . $gameid . '/' . $timestamp . '.txt',$result);

echo "<h2>" . $gameid . "</h2>\n\n";
echo "<h3>Levende spelers: " . $Map->livingPlayers() . "</h3>\n";
if ($Map->livingPlayers() <= $Session->GameData(null,'finish'))
    echo "<h3>Sessie afgelopen</h3>\n";

echo $result;
}
?>