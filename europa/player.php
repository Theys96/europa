<?php
session_start();
include 'functions.php';
include 'sessions.php';
include 'config_' . $_SESSION['game'] . '.php';
$con=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);
$profile = getPlayerById($_GET['pid']);
$username = $profile['username'];

foreach (explode(',',$profile['trade']) as $trader)
    {
    $trader = getPlayerById($trader);
    $traders .= (checkTrade($trader['username'],$profile['username']) ? $trader['username'] : '<del>'.$trader['username'].'</del>') . "<br />\n";
    }
foreach (explode(',',$profile['bg']) as $bg)
    {
    $bg = getPlayerById($bg);
    $bgs .= (checkBG($bg['username'],$profile['username']) ? $bg['username'] : '<del>'.$bg['username'].'</del>') . "<br />\n";
    }
    
$log = mysqli_fetch_array(mysqli_query($con,"SELECT * FROM log WHERE user='$username' ORDER BY timestamp DESC LIMIT 1"));
$date = date('Y-m-d', strtotime($log['timestamp']));
$today = date('Y-m-d');
$yesterday = date('Y-m-d', strtotime('yesterday')); 

if ($date == $today) {
  $lastlogin = "Vandaag";
} else if ($date == $tomorrow) {
  $lastlogin = "Gisteren";
} else {
  $lastlogin = date('d-m-\'y',strtotime($log['timestamp']));
}


?>
<!DOCTYPE html>
<html>
<head>
  <title><?php echo $sessie[$_SESSION['game']]; echo (isset($profile) ? ' - Profiel van '.$profile['firstname'] : ' - Geen speler'); ?></title>
  <link rel="stylesheet" media="all" href="style.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
</head>
<body>
<center>
<a href="<?php echo ($_SESSION[$maptable]['guest'] == true) ? 'guest.php' : 'index.php'; ?>">Terug</a>
<h2><?php echo getScreenName($profile['username']) ?></h2>
<table>
<tr><td>Naam: </td>             <td><?php echo $profile['firstname'];   ?></td></tr>
<tr><td>Gebruikersnaam: </td>   <td><?php echo $profile['username'];    ?></td></tr>
<tr><td>Laatst ingelogd: </td>  <td><?php echo $lastlogin;              ?></td></tr>
<tr><td>Rang: </td>             <td><?php echo getRank($profile['rating']) . ' (' . $profile['rating'] . ')';      ?></td></tr>
<tr><td>Titel: </td>            <td><?php echo ($profile['title'] == '') ? '<i>Geen speciale titel</i>' : $profile['title']; ?></td></tr>
<tr><td>Achtertitel: </td>      <td><?php echo ($profile['suftitle'] == '') ? '<i>Geen achtertitel</i>' : $profile['suftitle']; ?></td></tr>
<tr><td colspan="2"><center><?php echo (($profile['pic'] != '') ? '<img src="'.$profile['pic'].'" height="200" />' : '') ?></center></td></tr>
<?php if (inSession($profile['username'])) : ?>
<tr><td>Toevoegen: </td>
<td>
<a style="text-decoration: underline;" onClick="
$.post('action.php', {type: 'trade',from: '<?php echo $_SESSION[$maptable]['username'] ?>',to: '<?php echo $profile['username'] ?>'}).done(function( data ) {
alert(data);
location.reload();
});
"><img src="media/plus.PNG" height="15" /></a> <a style="text-decoration: underline;" onClick="
$.post('action.php', {type: 'stoptrade',from: '<?php echo $_SESSION[$maptable]['username'] ?>',to: '<?php echo $profile['username'] ?>'}).done(function( data ) {
alert(data);
location.reload();
});
"><img src="media/min.PNG" height="15" /></a>
 Handel
<br />
<a style="text-decoration: underline;" onClick="
$.post('action.php', {type: 'bg',from: '<?php echo $_SESSION[$maptable]['username'] ?>',to: '<?php echo $profile['username'] ?>'}).done(function( data ) {
alert(data);
location.reload();
});
"><img src="media/plus.PNG" height="15" /></a> <a style="text-decoration: underline;" onClick="
$.post('action.php', {type: 'stopbg',from: '<?php echo $_SESSION[$maptable]['username'] ?>',to: '<?php echo $profile['username'] ?>'}).done(function( data ) {
alert(data);
location.reload();
});
"><img src="media/min.PNG" height="15" /></a>
 Bondgenoot
</td>
</tr>
<tr><td>Geld: </td>             <td><?php echo $profile['money'];       ?></td></tr>
<tr><td>Kleur: </td>            <td style="background-color: <?php echo $profile['color'];   ?>"></td></tr>
<tr><td>Handelspartners: </td>  <td><?php echo $traders                 ?></td></tr>
<tr><td>Bondgenoten: </td>      <td><?php echo $bgs                     ?></td></tr>
<?php endif; ?>
</table>
</center>
</body>
</html>