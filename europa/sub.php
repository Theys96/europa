<?php
session_start();
include 'functions.php';
include 'sessions.php';
include 'config_' . $_SESSION['game'] . '.php';
$con=mysqli_connect($mysql_host,$mysql_username,$mysql_password,$mysql_db);
$player = getPlayer($_SESSION[$maptable]['username']);

?>
<!DOCTYPE html>
<html>
<head>
  <title><?php echo $sessie[$_SESSION['game']]; ?> - Aanmelden</title>
  <link rel="stylesheet" media="all" href="style.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
</head>
<body>
<center>
<p><a href="index.php">Terug</a></p>

<?php
$living = 0;
$result = mysqli_query($con,"SELECT * FROM $playertable,players WHERE players.id=$playertable.id");
while ($gamer = mysqli_fetch_array($result))
    {
    if (numRegions($gamer['username']) > 0)
        $living += 1;
    }
if ($_SESSION[$maptable]['username'] != 'gast') :
if ($living <= 5) :

if ($_REQUEST['sub'] == 'true')
    {
    $id = $player['id'];
    $result = mysqli_query($con,"SELECT * FROM $subtable WHERE id='$id'");
    if (mysqli_num_rows($result) == 0)
        {
        mysqli_query($con,"INSERT INTO $subtable (id, type) VALUES ($id, 'sub')");
        }
    else
        {
        mysqli_query($con,"UPDATE $subtable SET type='sub' WHERE id='$id'");
        }
    }
else if ($_REQUEST['sub'] == 'false')
    {
    $id = $player['id'];
    mysqli_query($con,"DELETE FROM $subtable WHERE id='$id'");
    }
    
if (isset($_REQUEST['subother']))
    {
    $other = getPlayer($_REQUEST['subother']);
    $id = $other['id'];
    $result = mysqli_query($con,"SELECT * FROM $subtable WHERE id='$id'");
    if (mysqli_num_rows($result) == 0 and $player['intro'] == 1)
        {
        if (playerExists($other['username']))
            {
            mysqli_query($con,"INSERT INTO $subtable (id, type) VALUES ($id, 'intro')");
            $id = $player['id'];
            mysqli_query($con,"UPDATE $playertable SET intro=0 WHERE id='$id'");
            $to = $other['mail'];
            $subject = "Uitnodiging voor sessie (" . $_SESSION['game'] . ") in Europa";
            $message = "Hoi!\nJe bent uitgenodigd voor een sessie in het spel Europa: " . $_SESSION['game'] . ".\n Ga naar thijshavinga.nl/europa en doe mee!";
            $from = "europa@thijshavinga.nl";
            mail($to,$subject,$message,"From: $from");
            }
        else
            {
            echo '<p>Speler bestaat niet.</p>';
            }
        }
    else
        {
        echo '<p>Kon niet toevoegen. Je mag alleen iemand uitnodigen als je mee hebt gedaan in de afgelopen sessie, met een limiet van 1 speler.</p>';
        }
    }
?>

<p><a href="?sub=true">Aanmelden</a></p>
<form method="get">
<p>Een vriend aanmelden: <input name="subother" /><input type="submit" value="OK" /></p>
</form>
<table>
<tr>
<td>Aanmeldingen:</td>
<td>
<table>
<?php
$result = mysqli_query($con,"SELECT * FROM $subtable,players WHERE $subtable.id = players.id");
while ($sub = mysqli_fetch_array($result))
    {
    echo '<tr><td>';
    echo ($sub['type'] == 'intro') ? '<i>' : '';
    echo $sub['username'];
    echo ($sub['type'] == 'intro') ? '<i>' : '';
    echo '</td>';
    if ($sub['id'] == $player['id'])
        {
        echo '<td>';
        echo '<a href="?sub=false"><img src="media/min.PNG" height="15" /></a>';
        echo '</td>';
        }
    else
        {
        echo '<td></td>';
        }
    echo '</tr>';
    }
?>
</table>
</td>
</tr>
</table>
<?php 
endif; 
if ($living > 5)
    echo '<p>Je kunt je pas aanmelden voor de volgende sessie als er nog 5 mensen of minder in de sessie zitten.</p>';
endif;
if ($_SESSION[$maptable]['username'] == 'gast')
    echo '<p>Je kunt je als gast niet aanmelden voor een sessie.</p>'
?>
</center>
</body>
</html>